cd 3dpack
library ode.dll
cd ..

function: dInitODE ( -- )
function: dWorldCreate ( -- world )
function: dHashSpaceCreate ( space|0 -- space )
function: dWorldSetGravity ( world float-x float-y float-z -- )
function: dWorldSetCFM ( world float-cfm -- )
function: dCreatePlane ( dSpaceID-space, dReal-a, dReal-b, dReal-c, dReal-d -- )
function: dSpaceCollide ( dSpaceID-space, void-*data, dNearCallback-*callback -- )
function: dWorldQuickStep ( world float-timestep -- ior )
function: dJointGroupEmpty ( group -- )
function: dJointGroupCreate ( maxsize|0 -- group )
function: dBodyCreate ( world -- body )
function: dCreateSphere ( space float-radius -- id )
function: dMassSetSphere ( dMass-*, dReal-density, dReal-radius -- )
function: dBodySetMass ( dBodyID, const-dMass-*mass -- )
function: dGeomSetBody ( geom body -- )
function: dBodySetPosition ( body float-x float-y float-z -- )
function: dJointCreateContact ( dWorldID, dJointGroupID, const-dContact-* -- id )
function: dJointAttach ( dJointID, dBodyID-body1, dBodyID-body2 -- )
function: dGeomGetBody ( geomid -- bodyid )
function: dCollide ( dGeomID-o1, dGeomID-o2, int-flags, dContactGeom-*contact, int-skip -- numcontacts )
function: dGeomGetPosition ( geom -- adr )
function: dGeomGetRotation ( geom -- adr )


#define dContactMu2	      $001     \ Use axis dependent friction */
#define dContactAxisDep   $001     \ Same as above */
#define dContactFDir1	  $002     \ Use FDir for the first friction value */
#define dContactBounce    $004     \ Restore collision energy anti-parallel to the normal */
#define dContactSoftERP   $008     \ Don't use global erp for penetration reduction */
#define dContactSoftCFM   $010     \ Don't use global cfm for penetration constraint */
#define dContactMotion1   $020     \ Use a non-zero target velocity for the constraint */
#define dContactMotion2   $040     \ 
#define dContactMotionN   $080     \ 
#define dContactSlip1	  $100     \ Force-dependent slip. */
#define dContactSlip2	  $200     \ 
#define dContactRolling   $400     \ Rolling/Angular friction */
#define dContactApprox0   $0000    \ 
#define dContactApprox1_1 $1000    \ 
#define dContactApprox1_2 $2000    \ 
#define dContactApprox1_N $4000    \ For rolling friction */
#define dContactApprox1   $7000


struct %dSurfaceParameters
  /* must always be defined */
  %dSurfaceParameters svar dSurfaceParameters.mode
  %dSurfaceParameters svar dSurfaceParameters.mu

  \ only defined if the corresponding flag is set in mode */
  %dSurfaceParameters svar dSurfaceParameters.mu2
  %dSurfaceParameters svar dSurfaceParameters.rho                   \ Rolling friction */
  %dSurfaceParameters svar dSurfaceParameters.rho2                  \
  %dSurfaceParameters svar dSurfaceParameters.rhoN                  \ Spinning friction */
  %dSurfaceParameters svar dSurfaceParameters.bounce                \ Coefficient of restitution */
  %dSurfaceParameters svar dSurfaceParameters.bounce_vel            \ Bouncing threshold */
  %dSurfaceParameters svar dSurfaceParameters.soft_erp
  %dSurfaceParameters svar dSurfaceParameters.soft_cfm
  %dSurfaceParameters svar dSurfaceParameters.motion1
  %dSurfaceParameters svar dSurfaceParameters.motion2
  %dSurfaceParameters svar dSurfaceParameters.motionN
  %dSurfaceParameters svar dSurfaceParameters.slip1
  %dSurfaceParameters svar dSurfaceParameters.slip2

struct %dContactGeom 
    %dContactGeom 3 cells sfield dContactGeom.pos         \ contact position*/
    %dContactGeom 3 cells sfield dContactGeom.normal      \ normal vector*/
    %dContactGeom svar dContactGeom.depth                 \ penetration depth*/
    %dContactGeom svar dContactGeom.g1                    \
    %dContactGeom svar dContactGeom.g2                    \ the colliding geoms*/
    %dContactGeom svar dContactGeom.side1                 \
    %dContactGeom svar dContactGeom.side2                 \ (to be documented)*/

