#1 #9 #0 [ramen] [checkver]

depend ramen/lib/rangetools.f
depend ramen/lib/draw.f
depend ramen/lib/cgrid.f
depend ramen/lib/task.f
depend afkit/lib/kb.f
depend ramen/lib/audio1.f
depend ramen/lib/sprites.f
depend ramen/lib/v2d.f
depend 3dpack/v3d.f
depend 3dpack/model.f
depend ramen/lib/state.f
depend 3dpack/cam.f

transform p 
80 value fov

: f  fov >rad 2 / tan ;
: asp  viewwh / ;

: 3d
    p al_identity_transform
    p 1 1 -1 3af al_scale_transform_3d
    p   asp f * negate 1af   f 1af           1 1af
        asp f * 1af          f negate 1af    16384 1af
    al_perspective_transform
    p al_use_projection_transform

    ALLEGRO_WRITE_MASK #-1 al_set_render_state
    ALLEGRO_DEPTH_FUNCTION ALLEGRO_RENDER_LESS al_set_render_state
    ALLEGRO_DEPTH_TEST #1 al_set_render_state
    1 1af al_clear_depth_buffer 
;
: 2d
    p al_identity_transform
    p 0 0 -16384 3af displaywh 16384 3af al_orthographic_transform
    p al_use_projection_transform    
    ALLEGRO_DEPTH_TEST #0 al_set_render_state
;
