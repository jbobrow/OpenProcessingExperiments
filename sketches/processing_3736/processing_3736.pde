
int s=400;int[]p;
void setup(){size(s,s,P3D);p=g.pixels;}
void draw(){
for(int a=0;a<s*s;a++){
float d=dist(mouseX,mouseY,a%s,(a-a%s)/s);
p[a]*=.97;p[a]+=millis()<500?-p[a]:d<90&p[a]<255?-d:p[a]/-d;}}

