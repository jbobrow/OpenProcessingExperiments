
void setup(){
size(500,500);
background(255,255,255);
}
float x=0;
float y=0;
float r=0;
float g=0;
float b=0;
float c=0;
float m=0;
float t=0;
void draw(){
background(r,g,b);
if(x==30){
r=random(0,255);
g=random(0,255);
b=random(0,255);
x=0;
}
fill(c,m,t);
if(y==15){
c=random(0,255);
m=random(0,255);
t=random(0,255);
y=0;
}
ellipse(256,256,mouseX,mouseY);
ellipse(256,256,mouseY,mouseX);
x=x+1;
}
//there are only 2 types of numbers computers uses: integers and decimals.
