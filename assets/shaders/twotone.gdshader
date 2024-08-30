shader_type canvas_item;

uniform float difference_point =1.0;//pixel brightness coefficient
uniform vec4 first_color : source_color = vec4(0,1,0,1);
uniform vec4 second_color : source_color = vec4(0,0,0,1);
uniform sampler2D SCREEN_TEXTURE:hint_screen_texture, filter_linear_mipmap;

void fragment() {

    vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV);

    if (dot(color, vec4(0.5, 0.5, 0.5, 0)) < difference_point) {
        COLOR = vec4(second_color.rgb,second_color.a*color.a);
    } else {
        COLOR =vec4(first_color.rgb,first_color.a*color.a);
    }
}