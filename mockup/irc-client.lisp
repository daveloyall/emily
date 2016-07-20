(ql:quickload :birch)


(defclass my-connection (birch:connection) ())

(defvar *connection* (make-instance 'my-connection
                                    :server-host "127.0.0.1"
                                    :nick "embot1"))


(birch:connect *connection*)

(birch:/privmsg *connection* "#test" "hello")
(birch:/quit *connection*)
