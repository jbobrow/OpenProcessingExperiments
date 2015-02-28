
int a=200;
void setup(){
  size(400,400);}
int x=0;
int speed=10;
void draw(){
  background(0);
  frameRate(30);
 float r=random (400);
float m=random (400);
fill(r/1.5,m/1.5,120);
if (x<=200)
{a=a-10;}
if(x>=200){a=a+10;}
rectMode(CENTER);
  rect(x,200,a,a);
  x=x+speed;
  if((x<0)||(x>=400)){
    speed=speed*-1;}
    if((x<=0)||(x>=400))
    a=a*-1;}
   
