precision mediump float;


uniform mat4 mWorld;
uniform mat4 mView;
uniform mat4 mProj;

uniform mat4 translate;
uniform mat4 scale;
uniform mat4 rotateX;
uniform mat4 rotateY;
uniform mat4 rotateZ;


attribute vec3 vertPosition;
attribute vec3 vertNormal;
attribute vec2 vertTexCoord;
attribute vec4 vertColor;

varying float fogDepth;

varying vec3 fPosition;
varying vec3 fragNormal;
varying vec2 fragTexCoord;
varying vec4 fragColor;

void main()
{

    vec4 vPos = mView * mWorld * vec4(vertPosition, 1.0);
    fogDepth = length(vPos.xyz);
    fragColor = vertColor;
    fragTexCoord = vertTexCoord;
    fragNormal =  (mWorld *vec4(vertNormal,0.0)).xyz;
    gl_Position = mProj * mView * mWorld * translate * scale * rotateZ * rotateY * rotateX *vec4(vertPosition, 1.0);
    fPosition = vPos.xyz / vPos.w;
    
}