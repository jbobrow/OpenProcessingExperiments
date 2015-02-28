
//HW 3 Jordana Bungard
//bungard.9@osu.edu February 4,2014
float x=50;
float y=100;
float z=90;
float w=200;
float i=300;
float h=350;
float a=350;
float b=375;
void setup(){
  size(400,400);
  background(0);
  frameRate(9);
}
  
  void draw() {
    x=x+2;
    z=z+3;
    h=h+5;
    i=i+5;
    a=a+2;
    if(z>35);
    if(x>90);
    fill(random(256), random(256), random(256),20);
    ellipse(x,y,random(30),30);
    ellipse(a,b,random(50),50);
    ellipse(z,w,50,50);
    if(z>375)
    z=0;
    if (i>395)
    i=200;
    if (x>395)
    x=5;
    if (a>395)
    a=0;
 triangle(mouseX,mouseY,i,250,250,h);
 rect(0,50,0,100,100,50,100,100);
if(mouseX>350) {
    background(255);
    }
if(mouseY>350) {
      background(random(256),random(256),random(256));}}
   
