
(module

(import "console" "logNumbers" (func $print_f64 (param i32)))
(import "commands" "control" (func $move (param i32 i32)))
(global $x (mut i32) (i32.const 100))
(global $y (mut i32) (i32.const 0))
;;8 up 2 donw  4 left 6 right
(global $lastPosition (mut i32) (i32.const 0))
(global $hund i32 (i32.const 100))


(func $lastPositionFunction
(result i32)
(
  i32.add(i32.const 0)(global.get $lastPosition)
)
)
(export "lastPositionFunction" (func $lastPositionFunction))

(func $moveRight
(
;;call $print_f64(global.get $x )

drop(global.get $x)
(global.set $x(i32.add(global.get $hund)(global.get $x)))

(global.set $lastPosition (i32.const 6))
(call $move(global.get $x)(global.get $y))
 ;;(drop)

)
)
(export "moveRight" (func $moveRight))



(func $moveLeft
(
  drop(global.get $x)
(global.set $x(i32.sub(global.get $x)(global.get $hund )))
(global.set $lastPosition (i32.const 4))
(call $move(global.get $x)(global.get $y))
)
)
(export "moveLeft" (func $moveLeft))

(func $moveUp
(
  drop(global.get $y)
(global.set $y(i32.sub(global.get $y)(global.get $hund )))
(global.set $lastPosition (i32.const 8))
(call $move(global.get $x)( global.get $y))
)
)
(export "moveUp" (func $moveUp))

(func $moveDown
(
  drop(global.get $y)
(global.set $y(i32.add(global.get $y)(global.get $hund )))
(global.set $lastPosition (i32.const 2))
(call $move(global.get $x)( global.get $y))
)
)
(export "moveDown" (func $moveDown))


;;name
(func  $print 
  ;; params
  (param $num1 i32)
  (param $num2 i32)
 
  (result i32)
  ;;body
  (
    ;;local.get 3
  ;;call  $print_f64(local.get $num1)
  ;;call  $print_f64(local.get $num2)
  ;;(local.get $num1.add(local.get $num2))

  ;;(call $print(local.get 0)(local.get 1))

    i32.add(local.get $num1)(local.get $num2)
  )
  )
  (export "print" (func $print))


(func $loop
    ;; create a local variable and initialize it to 0
    (param $numStart i32)
    (param $numEnd i32)
    (local $i i32)

    (loop $my_loop

      local.get $numStart
      call $print_f64
      
      ;; add one to $i
      local.get $numStart
      i32.const 1
      i32.add
      local.set $numStart

      ;; log the current value of $i


      ;; if $i is less than 10 branch to loop
      local.get $numStart
     ;; i32.const 10
      local.get $numEnd
      i32.lt_s
      br_if $my_loop


    )
  )
 (export "loop" (func $loop))




(func $Fnum
      ;; create a local variable and initialize it to 0
  
    (param $numEnd i32)
    (local $numStart i32)
    (local $i i32)
    (local $b i32)
    (local $oldb i32)
      (local.set $i (i32.const 0))
    (local.set $b (i32.const 1))
    (
      
      loop $my_loop
 local.get $b
local.set  $oldb

  local.get $i
  local.get $b
   i32.add   
  local.set  $b


  local.get $oldb
  local.set $i

       local.get $b
      call $print_f64







      ;; add one to $i
      local.get $numStart
      i32.const 1
      i32.add
      local.set $numStart

      ;; log the current value of $i
    

      ;; if $i is less than 10 branch to loop
      local.get $numStart
     ;; i32.const 10
      local.get $numEnd
      i32.lt_s
      br_if $my_loop


    )
  )
 (export "Fnum" (func $Fnum))
  

)


  



