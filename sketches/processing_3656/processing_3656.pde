
int s=400;color[]p;
void setup(){size(s,s,P3D);p=g.pixels;}
void draw(){for(int a=0;a<s*s;a++){float d=dist(mouseX,mouseY,a%s,(a-a%s)/s);
p[a]+=d<=100?p[a]<<16<255?ceil(p[a]+d/5)<<16:0:0;}}

