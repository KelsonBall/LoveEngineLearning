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
extern number WarpAmount;

vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    texture_coords += WarpAmount * vec2(cos(vpos.x), sin(vpos.y));    
    vec4 texcolor = Texel(texture, texture_coords);
    return (1 - sqrt(WarpAmount)) * texcolor * color;
}
#endif
]])
end