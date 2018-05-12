#lang racket

(require rackunit)
;; /// <summary>
;; /// Represents a product created by the builder
;; /// </summary>
;; public class Car
;; {
;;     public string Make { get; }
;;     public string Model { get; }
;;     public int NumDoors { get; }
;;     public string Colour { get; }
;; 
;;     public Car(string make, string model, string colour, int numDoors)
;;     {
;;         Make = make;
;;         Model = model;
;;         Colour = colour;
;;         NumDoors = numDoors;
;;     }
;; }
;; 
;; /// <summary>
;; /// The builder abstraction
;; /// </summary>
;; public interface ICarBuilder
;; {
;;     string Colour { get; set; }
;;     int NumDoors { get; set; }
;; 
;;     Car GetResult();
;; }
;; 
;; /// <summary>
;; /// Concrete builder implementation
;; /// </summary>
;; public class FerrariBuilder : ICarBuilder
;; {
;;     public string Colour { get; set; }
;;     public int NumDoors { get; set; }
;; 
;;     public Car GetResult()
;;     {
;;         return NumDoors == 2 ? new Car("Ferrari", "488 Spider", Colour, NumDoors) : null;        
;;     }
;; }
;; 
;; /// <summary>
;; /// The director
;; /// </summary>
;; public class SportsCarBuildDirector
;; {
;;     private ICarBuilder _builder;
;;     public SportsCarBuildDirector(ICarBuilder builder) 
;;     {
;;         _builder = builder;
;;     }
;; 
;;     public void Construct()
;;     {
;;         _builder.Colour = "Red";
;;         _builder.NumDoors = 2;
;;     }
;; }
;; 
;; public class Client
;; {
;;     public void DoSomethingWithCars()
;;     {
;; 
;;         var builder = new FerrariBuilder();
;;         var director = new SportsCarBuildDirector(builder);
;; 
;;         director.Construct();
;;         Car myRaceCar = builder.GetResult();
;;     }
;; }

;;;;(define;(drive;miles)
;;;;;;;miles)
;;;;
;;;;(define;scooter%
;;;;;;(class;object%
;;;;;;;;(super-new)
;;;;;;;;(field;(speed;10))
;;;;;;;;(define/public;(go;fn)
;;;;;;;;;;(fn;speed))))
;;;;
(define Car%
  (class object%
    (super-new)
    (field [make ""])
    (field [model ""])
    (field [doors 0])
    (field [color ""])))

(define Coupe%
  (class object%
    (super-new)
    (field [make ""])
    (field [model ""])
    (field [doors 0])
    (field [color ""])))

(define Sedan%
  (class object%
    (super-new)
    (field [make ""])
    (field [model ""])
    (field [doors 0])
    (field [color ""])))

(define (CarBuilder mk mdl drs clr)
  (define NewCar (new Car%))
  (dynamic-set-field! make NewCar mk)
  (dynamic-set-field! model NewCar mdl)
  (dynamic-set-field! doors NewCar drs)
  (dynamic-set-field! color NewCar clr)
  (return NewCar))

;; public class FerrariBuilder : ICarBuilder
;; {
;;     public string Colour { get; set; }
;;     public int NumDoors { get; set; }
;; 
;;     public Car GetResult()
;;     {
;;         return NumDoors == 2 ? new Car("Ferrari", "488 Spider", Colour, NumDoors) : null;        
;;     }
;; }

(define acar (CarBuilder "Suzuki" "Swift" 4 "red"))
(check-equal? (get-field doors acar) 5 "Another simple test")
