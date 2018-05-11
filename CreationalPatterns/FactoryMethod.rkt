#lang racket

(require rackunit)

(define (drive miles)
   miles)

(define scooter%
  (class object%
    (super-new)
    (field (speed 10))
    (define/public (go fn)
      (fn speed))))

(define motorbike%
  (class object%
    (super-new)
    (field (speed 20))
    (define/public (go fn)
      (fn speed))))

(define (GetVehicle vehicle)
  (case vehicle
    [("scooter") (new scooter%)]
    [("motorbike") (new motorbike%)]))

(define rgr250 (GetVehicle "motorbike"))
(define honda50 (GetVehicle "scooter"))

(check-equal? (send rgr250 go drive) 20 "Another simple test")
(check-equal? (send honda50 go drive) 10 "Another simple test")
