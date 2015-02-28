
void setup() {size(250, 250);
background(255,255,240);}

void draw() {funStrokes();}

void funStrokes(){
for(int i=0; i<300; i=i+50)
{frameRate(15);
float r =random(10);
float s =random(125);
float t =random(125);
float v=random(250);
strokeWeight(r);
stroke(i,t,v);
line(i,v,s,t);}}
