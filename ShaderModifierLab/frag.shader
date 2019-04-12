#pragma transparent
#pragma body

float mpi = 3.1415926535897932384626433832795;
// scenekit stashes time in scn_frame
float iTime = scn_frame.time;

// grab uv coords from our material
float2 uv = _surface.diffuseTexcoord;

// we want a coords from -1 to 1 instead of standard uv coords (0-1)
float2 p = -1.0+2.0*uv;

// length and angle from center for fancy polar coord dist.
float r = length(p);
float a = atan(p.y / p.x);

//classic demo fx
float2 uvmod = float2(p.x/abs(p.y), 1/abs(p.y));
 
// uv scroll it with time
uvmod += iTime;

// get the diffuse sampler and get col at distorted uv coords
float4 texcol = u_diffuseTexture.sample(u_diffuseTextureSampler, uvmod);
_output.color.rgba = texcol;
