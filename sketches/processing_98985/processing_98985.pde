
void setup() {size(400,400);}

int x= 0;
int y= 5;

void draw(){discoBox(30,20);}

void discoBox(int z, int a){
  float s=random(255);
  float t=random(255);
  float v=random(255);
  float u=random(20);
  float w=random(400);
background(0,s,t,v);
frameRate(10);
for(int i=0; i<100; i=i+10){
noFill();
strokeWeight(u);
stroke(255);
rect(x,w,z,a);
ellipse(w,x,a,z);}
x=x+y;
if ((x<0)||(x>=380)){
y=y*-1;}}
