struct VertexOutput {
    [[builtin(position)]] Position : vec4<f32>;
    [[location(0)]] v_tex_coords : vec2<f32>;
};

[[stage(vertex)]]
fn vs_main([[location(0)]] a_position: vec3<f32>, [[location(1)]] a_tex_coords: vec2<f32>) -> VertexOutput {
    var out: VertexOutput;
    out.Position = vec4(a_position, 1.0);
    out.v_tex_coords = a_tex_coords;
    return out;
}

[[group(0), binding(0)]]
var my_texture: texture_2d<f32>;
[[group(0), binding(1)]]
var my_sampler: sampler;

[[stage(fragment)]]
fn fs_main([[location(0)]] v_tex_coords: vec2<f32>) -> [[location(0)]] vec4<f32> {
    let color = textureSample(my_texture, my_sampler, v_tex_coords);
    return color;
}
