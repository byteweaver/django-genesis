#! /bin/sh
### BEGIN INIT INFO
# Provides:          {{ project_name }}
# Required-Start:    $network $local_fs $syslog
# Required-Stop:     $network $local_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Should-Start:      nginx
# Should-Stop:       nginx
# Short-Description: {{ project_name }} django website initscript
# Description:       This will start the {{ project_name }} django website in fastcgi mode.
### END INIT INFO


PATH="/sbin:/usr/sbin:/bin:/usr/bin";
DESC="{{ project_name }} service";
NAME="{{ project_name }}";
PROJECT_PATH="/var/www/{{ project_name }}";
PIDFILE="$PROJECT_PATH/deploy/$NAME.pid"
SOCKETFILE="$PROJECT_PATH/deploy/$NAME.fcgi"
OUTLOG="$PROJECT_PATH/deploy/logs/out.log";
ERRLOG="$PROJECT_PATH/deploy/logs/err.log";
DAEMON="$PROJECT_PATH/bin/gunicorn";
DAEMON_ARGS="$NAME.wsgi:application --chdir $PROJECT_PATH --daemon --umask 0000 --bind unix:$SOCKETFILE --pid $PIDFILE --error-logfile $ERRLOG"; # out log?
SCRIPTNAME="/etc/init.d/$NAME";
RUNAS_USER="www-data";


# Exit if the package is not installed
[ -x "$DAEMON" ] || exit 0

# Read configuration variable file if it is present
[ -r "/etc/default/$NAME" ] && . "/etc/default/$NAME"

# Load the VERBOSE setting and other rcS variables
. /lib/init/vars.sh

# Define LSB log_* functions.
# Depend on lsb-base (>= 3.2-14) to ensure that this file is present
# and status_of_proc is working.
. /lib/lsb/init-functions

#
# Function that starts the daemon/service
#
do_start()
{
	# Return
	#   0 if daemon has been started
	#   1 if daemon was already running
	#   2 if daemon could not be started
	start-stop-daemon --start --quiet --chuid "$RUNAS_USER" \
        --pidfile "$PIDFILE" --exec "$DAEMON" --test > /dev/null \
		|| return 1;
	start-stop-daemon --start --quiet --chuid "$RUNAS_USER" \
        --pidfile "$PIDFILE" --exec "$DAEMON" -- \
        $DAEMON_ARGS || return 2;
}

#
# Function that stops the daemon/service
#
do_stop()
{
	# Return
	#   0 if daemon has been stopped
	#   1 if daemon was already stopped
	#   2 if daemon could not be stopped
	#   other if a failure occurred
	start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --chuid "$RUNAS_USER" --pidfile "$PIDFILE";
	RETVAL="$?";
	[ "$RETVAL" = 2 ] && return 2;

	rm -f "$PIDFILE" "$SOCKETFILE"
	return "$RETVAL"
}

#
# Function that sends a SIGHUP to the daemon/service
#
do_reload() {
	#
	# If the daemon can reload its configuration without
	# restarting (for example, when it is sent a SIGHUP),
	# then implement that here.
	#
	start-stop-daemon --stop --signal 1 --quiet --chuid "$RUNAS_USER" --pidfile "$PIDFILE" --name "$NAME"
	return 0
}


case "$1" in
  start)
	[ "$VERBOSE" != "no" ] && log_daemon_msg "Starting $DESC" "$NAME";
	do_start;
	case "$?" in
		0|1) [ "$VERBOSE" != "no" ] && log_end_msg 0 ;;
		2) [ "$VERBOSE" != "no" ] && log_end_msg 1 ;;
	esac;
	;;
  stop)
	[ "$VERBOSE" != "no" ] && log_daemon_msg "Stopping $DESC" "$NAME";
	do_stop;
	case "$?" in
		0|1) [ "$VERBOSE" != "no" ] && log_end_msg 0 ;;
		2) [ "$VERBOSE" != "no" ] && log_end_msg 1 ;;
	esac;
	;;
  status)
       status_of_proc "$DAEMON" "$NAME" && exit 0 || exit $?
       ;;
  restart|force-reload)
	log_daemon_msg "Restarting $DESC" "$NAME";
	do_stop;
	case "$?" in
	  0|1)
		do_start;
		case "$?" in
			0) log_end_msg 0 ;;
			1) log_end_msg 1 ;; # Old process is still running
			*) log_end_msg 1 ;; # Failed to start
		esac;
		;;
	  *)
	  	# Failed to stop
		log_end_msg 1;
		;;
	esac
	;;
  *)
	echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
	exit 3;
	;;
esac;

exit 0;
