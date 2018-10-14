struct %v3d
    %v3d 0 svar v3d.x
    %v3d 0 svar v3d.y
    %v3d 0 svar v3d.z
: 3+  >r rot >r 2+ r> r> + ;
: 3+! dup >r 3@ 3+ r> 3! ;
: >x ;
: >y cell+ ;
: >z cell+ cell+ ;
: z@ >z @ ;
: z! >z ! ;
: 3negate  negate >r 2negate r> ;
: 3mod  >r rot >r 2mod r> r> mod ;
