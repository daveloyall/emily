(ql:quickload :birch)

(defpackage :emily (:use :birch :cl))
*package*
(in-package :emily)

(defclass my-connection (connection) ())

(defvar *connection* (make-instance 'my-connection
                                    :server-host "metalbaby"
                                    :nick "embot1"))

(defmethod handle-event ((connection my-connection) (event privmsg-event))
  (format t "Message received on ~A: ~A" (channel event) (message event)))

(connect *connection*)

(/privmsg *connection* "#test" "helllllo")
(/quit *connection*)
(/join *connection* "#test")
