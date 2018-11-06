return function ()
    return love.graphics.newShader([[
varying vec4 vpos;
 
#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    vpos = vertex_position;
    return transform_projection * vertex_position;
}
#endif
 
#ifdef PIXEL
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    number x = (cos(vpos.x / 10) / 2) + 0.5;
    number y = (sin(vpos.y / 10) / 2) + 0.5;    
    return vec4(x, y,  1 - ((x + y) / 2), 1.0);
}
#endif
]])
end