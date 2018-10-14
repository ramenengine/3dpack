depend ramen/lib/v2d.f

: posxz@  pos >x @  pos >z @ ; 
: posxz!  pos >z !  pos >x ! ; 

: tilt-to  ( obj dist -- n ) >r  's pos >y @  pos >y @ -  r> swap  angle ;
: pan-to  ( obj -- n ) >{ posxz@ }  posxz@  2-  -1 1 2*  angle 90 + ;

: orbitted ( obj ang dist -- x y )  vec  rot >{ posxz@ }  2+ ;
: situate  ( obj ang dist -- )   orbitted  posxz! ;