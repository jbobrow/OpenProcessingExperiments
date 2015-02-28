
int s=400;PVector[]v=new PVector[s];
void draw(){
for(int a=0;a<s;a++){
if(v[a]==null)v[a]=new PVector(a,random(s));
float g=noise(v[a].x*.02,v[a].y*.02)*6;
point(v[a].x+=sin(g),v[a].y+=cos(g));}}

