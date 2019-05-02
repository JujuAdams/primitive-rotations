var _rotation = current_time/15;

draw_text(10, 10, "Primitive Rotations\n@jujuadams 2019/05/02\nPress <space> to cycle example");

switch(draw_method)
{
    case 0:
        draw_text(10, 80, "\"Hard-coded positions\"");
        
        draw_primitive_begin(pr_trianglelist);
        draw_vertex(500, 300);
        draw_vertex(700, 300);
        draw_vertex(600, 400);
        draw_primitive_end();
        
        draw_circle_colour(600, 350, 5, c_black, c_black, false);
    break;
    
    case 1:
        draw_text(10, 80, "\"Hard-coded positions relative to a central point\"");
        
        var _x = 600;
        var _y = 350;
        
        var _ax = -100;
        var _ay =  -50;
        var _bx =  100;
        var _by =  -50;
        var _cx =    0;
        var _cy =   50;
        
        draw_primitive_begin(pr_trianglelist);
        draw_vertex(_x + _ax, _y + _ay);
        draw_vertex(_x + _bx, _y + _by);
        draw_vertex(_x + _cx, _y + _cy);
        draw_primitive_end();
        
        draw_circle_colour(_x + 0, _y + 0, 5, c_black, c_black, false);
    break;
    
    case 2:
        draw_text(10, 80, "\"Rotation using trigonometry\"");
        
        var _x = 600;
        var _y = 350;
        
        var _sin = dsin(-_rotation);
        var _cos = dcos(-_rotation);
        
        var _ax = -100;
        var _ay =  -50;
        var _ax_rot = _x + _ax*_cos - _ay*_sin;
        var _ay_rot = _y + _ax*_sin + _ay*_cos;
        
        var _bx =  100;
        var _by =  -50;
        var _bx_rot = _x + _bx*_cos - _by*_sin;
        var _by_rot = _y + _bx*_sin + _by*_cos;
        
        var _cx =    0;
        var _cy =   50;
        var _cx_rot = _x + _cx*_cos - _cy*_sin;
        var _cy_rot = _y + _cx*_sin + _cy*_cos;
        
        draw_primitive_begin(pr_trianglelist);
        draw_vertex(_ax_rot, _ay_rot);
        draw_vertex(_bx_rot, _by_rot);
        draw_vertex(_cx_rot, _cy_rot);
        draw_primitive_end();
        
        draw_circle_colour(_x + 0, _y + 0, 5, c_black, c_black, false);
    break;
    
    case 3:
        draw_text(10, 80, "\"Rotation using a matrix\"");
        
        var _x = 600;
        var _y = 350;
        matrix_set(matrix_world, matrix_build(_x, _y, 0,   0,0,_rotation,   1,1,1));
        
        draw_primitive_begin(pr_trianglelist);
        draw_vertex(-100, -50);
        draw_vertex( 100, -50);
        draw_vertex(   0,  50);
        draw_primitive_end();
        
        draw_circle_colour(0, 0, 5, c_black, c_black, false);
        
        matrix_set(matrix_world, matrix_build_identity());
    break;
}