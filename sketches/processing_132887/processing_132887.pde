
void setup() { 
  size(400,400);
 noStroke(); }
int x=0;
int speed=5;
void draw(){ 
  float r=random(255);
  float g=random(255);
  float b=random(255);
  background(255); 
  frameRate(30); 
  fill(r,g,b);
  triangle(x,x,x-5,300,x+100,x+30); 
  x=x+speed;
if ((x<0)||(x>=400)){ speed=speed*-1;
}
}
