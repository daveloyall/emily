(ql:quickload :birch)
(ql:quickload :log4slime)

(defpackage :emily (:use :birch :cl))
*package*
(in-package :emily)

(defclass my-connection (connection) ())

(defvar *connection* (make-instance 'my-connection
                                    :server-host "metalbaby"
                                    :nick "embot1"))

(defmethod handle-event ((connection my-connection) (event privmsg-event))
  (log:info "Message received on ~A: ~A" (channel event) (message event)))



(defmethod handle-event ((connection my-connection) (event event))
  (log:info "message=~A; user=~A" (message event) (user event)))



(connect *connection*)

(/privmsg *connection* "#test" "helllllo")
(/quit *connection*)
(/join *connection* "#test")

(log:info "test")

(process-message *connection*)

(process-message-loop *connection*)
