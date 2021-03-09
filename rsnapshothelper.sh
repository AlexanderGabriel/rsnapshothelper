#!/bin/sh
if  [ -n "$SSH_ORIGINAL_COMMAND"  ]
then
        #echo  "$(/bin/date): $SSH_ORIGINAL_COMMAND" >> $HOME/rsnapshothelper.log
        case "$SSH_ORIGINAL_COMMAND" in
                "rsync --server --sender -vlogDtprRe.iLsfxC --numeric-ids . /opt")
                echo  "$(/bin/date): OK: $SSH_ORIGINAL_COMMAND" >> $HOME/rsnapshothelper.log
                exec $SSH_ORIGINAL_COMMAND
                ;;
        "rsync --server --sender -vlogDtprRe.iLsfxC --numeric-ids . /etc")
                echo  "$(/bin/date): OK: $SSH_ORIGINAL_COMMAND" >> $HOME/rsnapshothelper.log
                exec $SSH_ORIGINAL_COMMAND
                ;;
        "mysqldump --all-databases")
                echo  "$(/bin/date): OK: $SSH_ORIGINAL_COMMAND" >> $HOME/rsnapshothelper.log
                exec $SSH_ORIGINAL_COMMAND
                ;;
        *)
                echo  "$(/bin/date): VIOLATION: $SSH_ORIGINAL_COMMAND" >> $HOME/rsnapshothelper.log
                echo "Access denied"
                exit 1
                ;;
        esac
fi