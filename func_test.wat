(module
    (global $WHITE i32 (i32.const 2))
    (global $BLACK i32 (i32.const 1))
    (global $CROWN i32 (i32.const 4))
    (memory $mem 1)
    (func $indexForPosition (param $x i32) (param $y i32) (result i32)
        (i32.add
            (i32.mul
                (i32.const 8)
                (get_local $y)
            )
            (get_local $x)
        )
    )
    ;; offset = (x + y * 8) * 4
    (func $offsetForPosition (param $x i32) (param $y i32) (result i32)
        (i32.mul
            (i32.const 4)
            (call $indexForPosition (get_local $x) (get_local $y))
        )
    )
    ;; determine if a piece has been crowned
    (func $isCrowned (param $piece i32) (result i32)
        (i32.eq
            (i32.and
                (get_local $piece)
                (get_global $CROWN)
            )
            (get_global $CROWN)
        )
    )
    ;; determine if a piece is white
    (func $isWhite (param $piece i32) (result i32)
        (i32.eq
            (i32.and
                (get_local $piece)
                (get_global $WHITE)
            )
            (get_global $WHITE)
        )
    )
    ;; determine if a piece is black
    (func $isBlack (param $piece i32) (result i32)
        (i32.eq
            (i32.and
                (get_local $piece)
                (get_global $BLACK)
            )
            (get_global $BLACK)
        )
    )
    ;; add a crown to a given piece
    (func $addCrown (param $piece i32) (result i32)
        (i32.or
            (get_local $piece)
            (get_global $CROWN)
        )
    )
    (func $delCrown (param $piece i32) (result i32)
        (i32.and
            (get_local $piece)
            (i32.const 3)
        )
    )
    (export "offsetForPosition" (func $offsetForPosition))
    (export "isCrowned" (func $isCrowned))
    (export "isWhite"   (func $isWhite))
    (export "isBlack"   (func $isBlack))
    (export "addCrown"  (func $addCrown))
    (export "delCrown"  (func $delCrown))
)
