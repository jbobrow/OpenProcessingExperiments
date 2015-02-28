
/*
Based on Daniel Shiffman code. The creature is made to
float down the screen.
*/

float r;
float g;
float b;
float a;

float moogX;
float moogY;

void setup(){
  size(350,500);
  moogX = width/2;
  moogY = height - 500;
  smooth();
}
  
void draw() {
  background(255,4,0);
  ellipseMode(CENTER);
    
  //draw head of creature
  
    stroke(0,0,0);
    strokeWeight(3);
    fill(random(RGB,moogX/2));
    ellipse(moogX,moogY,100,60);
  
  //eyes of creature
  stroke(0,0,10);
  strokeWeight(4);
  r = random(255);
  g = random(255);
  b = random(150);
  a = random(255);
  fill(r,g,b,a);
  
  ellipse(moogX-29,moogY+0,15,15);
  ellipse(moogX+18,moogY+0,15,15);
    
  //eyeballs
  point(moogX-29,moogY+0);
  point(moogX+18,moogY+0);
   
    
  //the mouth
  stroke(0);
  strokeWeight(1);
  fill(255,255,0);
  ellipse(moogX-10,moogY+15,20,10);
   
  //hair
  strokeWeight(3);
  line(moogX-20,moogY-80,moogX-10,moogY-30);
  line(moogX+20,moogY-80,moogX-10,moogY-30);
  
  //creature moves down
  moogY = moogY + 1;
  moogX = moogX + random(-5,5);
    
   
}
