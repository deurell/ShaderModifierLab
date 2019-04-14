#pragma transparent
#pragma body
float2 uv = _surface.diffuseTexcoord;
float x = 1.0-sin(uv.x*M_PI_F);
x = pow(x,4) - 0.1;
float y = 1.0-sin(uv.y*M_PI_F);
y = pow(y,4)-0.1;

float mx = mix(x,y,0.5);
float3 col = float3(0.2, 0.9, 0.2) * mx;
col *= 8.;
_output.color.rgb = col;
