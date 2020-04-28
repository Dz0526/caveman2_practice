(defsystem "caveman2_practice-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Ito Daiki"
  :license ""
  :depends-on ("caveman2_practice"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "caveman2_practice"))))
  :description "Test system for caveman2_practice"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
