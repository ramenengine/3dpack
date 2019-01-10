empty
depend 3dpack/3dpack.f
depend 3dpack/ode.f
depend afkit/ans/param-enclosures.f

: blob  1 kb /allot ;

\ sphere demo

0 value world
0 value space
0 value body	
0 value geom	
create m blob
0 value contactgroup
create contact blob

: contact>surface ;

$7f800000 constant dInfinity

0 value o1
0 value o2

:noname ( -- )
    _PARAM_2 _PARAM_1 _PARAM_0 1( contact contact>surface ) locals| s data | to o1 to o2
    1( dContactBounce dContactSoftCFM or ) s dSurfaceParameters.mode !
    \ friction parameter
    dInfinity s dSurfaceParameters.mu !
    \ bounce is the amount of "bouncyness".
    0.7e s dSurfaceParameters.bounce sf!
    \ bounce_vel is the minimum incoming velocity to cause a bounce
    0.1e s dSurfaceParameters.bounce_vel sf!
    \ constraint force mixing parameter
    0.001e s dSurfaceParameters.soft_cfm sf!
    o1 o2 #1 1( contact 15 cells + ) 11 cells dCollide if
        world contactgroup contact dJointCreateContact
            o1 dGeomGetBody o2 dGeomGetBody dJointAttach
    then
; #3 cb: nearcb

: sim  ( -- )
   \ find collisions and add contact joints
   space 0 nearcb dSpaceCollide
   \ step the simulation
   world 0.1 1af dWorldQuickStep 0= abort" There was an error"
   \ remove all contact joints
   contactgroup dJointGroupEmpty

;

: init  ( -- )
   dInitODE 
   ( create world )
   dWorldCreate to world
   0 dHashSpaceCreate to space
   world 0 0 -0.5 3af dWorldSetGravity
   world 1e-5 1sf dWorldSetCFM
   space 0 0 1 0 4af dCreatePlane 
   0 dJointGroupCreate to contactgroup
   ( create object )
   world dBodyCreate to body
   space 0.5 1af dCreateSphere to geom 
   m 1 0.5 2af dMassSetSphere 
   body m dBodySetMass 
   geom body dGeomSetBody
   ( set initial position )
   body -10 0 3 3af dBodySetPosition 
   step> sim
;

\ objlist models

: *sphere
    stage one draw>
        1( vieww 2 / ) 1( geom dGeomGetPosition cell+ cell+ sf@ f>p -40 * 200 + ) at
        10 yellow circf
;

init
*sphere
