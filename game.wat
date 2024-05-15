
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
drop(global.get $x)
(if (i32.gt_u (global.get $x) (i32.const 800))
  (then
    (global.set $x(i32.const 800))
  )
  (else
  
 (global.set $x(i32.add(global.get $hund)(global.get $x)))
(global.set $lastPosition (i32.const 6))
(call $move(global.get $x)(global.get $y))
  )
)))
(export "moveRight" (func $moveRight))



(func $moveLeft
(
  drop(global.get $x)
(if (i32.le_s (global.get $x) (i32.const 0))
  (then
   
    (global.set $x(i32.const 0))
  )
  (else
  (global.set $x(i32.sub(global.get $x)(global.get $hund )))
  (global.set $lastPosition (i32.const 4))
  (call $move(global.get $x)(global.get $y)) 
  )
)))
(export "moveLeft" (func $moveLeft))

(func $moveUp
(
  drop(global.get $y)
(if (i32.le_s (global.get $y) (i32.const 0))
  (then
    (global.set $y(i32.const 0))
  )
  (else

(global.set $y(i32.sub(global.get $y)(global.get $hund )))
(global.set $lastPosition (i32.const 8))
(call $move(global.get $x)( global.get $y)) 
  ) 
)
)
)
(export "moveUp" (func $moveUp))

(func $moveDown
(
  drop(global.get $y)
(if (i32.gt_u (global.get $y) (i32.const 300))
  (then
    (global.set $y(i32.const 300))
  )
  (else
 
(global.set $y(i32.add(global.get $y)(global.get $hund )))
(global.set $lastPosition (i32.const 2))
(call $move(global.get $x)( global.get $y))
  ) 
)



)
)
(export "moveDown" (func $moveDown))
)
  



