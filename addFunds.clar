(define-map accounts ((account-id int))
  (balance int))

(define-public (add-funds (account-id int) (amount int))
  (let ((current-balance (get accounts account-id "balance")))
    (if (is-some current-balance)
        (begin
          (put accounts account-id "balance" (+ (get current-balance) amount))
          (ok (get accounts account-id "balance")))
        (begin
          (put accounts account-id "balance" amount)
          (ok amount)))))
