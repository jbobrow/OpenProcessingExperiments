
//import processing.opengl.*;
float theta=0,r,g,b,separacion=2;
int h=0;
void setup()
{
size(900,450,P3D);
r=random(255);
g=random(255);
b=random(255);
}
void draw()
{
   
   background(0,20);
  if(mousePressed)
   background(255,20);
   translate(0,height/2,-500);
   stroke(239,247,7,50);
  for(int e=1;e<=2;e++){
    separacion=map(mouseX,0,width,0,1.5);
     pushMatrix();
     translate(e*width/3,0,0);
  if(e==2)  
  {
   rotateY(theta);
   rotateX(theta);
   rotateZ(theta);
  }
  if(e==1)
  {
   rotateY(theta);
   rotateX(-theta);
   rotateZ(-theta);
  }
// rotateY(theta);
  drawSphere(0,0,0,mouseY/4,100,100,100,separacion);
  drawSphere(0,height/4,0,mouseY/4,r,g,b,separacion);
  drawSphere(0,-height/4,0,mouseY/4,r,g,b,separacion);
  drawSphere(0,0,height/4,mouseY/4,r,g,b,separacion);
  drawSphere(0,0,-height/4,mouseY/4,r,g,b,separacion);
   popMatrix();
}
theta+=0.02;
h+=100;
if(h==10000)
h=0;
}
 
void drawSphere(float x,float y,float z,float radio,float r,float g,float b,float divisor)
{
  pushMatrix();
  translate(x,y,z);
  if(mousePressed)
    stroke(0,60);
  else
  stroke(255,60);
  strokeWeight(1);
  beginShape(LINES);
  vertex(0,0,0);
  vertex(radio/divisor,0,0);
  endShape();
  beginShape(LINES);
  vertex(0,0,0);
  vertex(-radio/divisor,0,0);
  endShape();
  beginShape(LINES);
  vertex(0,0,0);
  vertex(0,radio/divisor,0);
  endShape();
  beginShape(LINES);
  vertex(0,0,0);
  vertex(0,-radio/divisor,0);
  endShape();
  beginShape(LINES);
  vertex(0,0,0);
  vertex(0,0,radio/divisor);
  endShape();
  beginShape(LINES);
  vertex(0,0,0);
  vertex(0,0,-radio/divisor);
  endShape();
  fill(r,g,b,100);
  noStroke();
  box(radio);
  if(radio>20)
  {
    drawSphere(radio/divisor,0,0,radio/2,r,0,b,divisor);
    drawSphere(-radio/divisor,0,0,radio/2,r,g,0,divisor);
    drawSphere(0,radio/divisor,0,radio/2,0,g,b,divisor);
    drawSphere(0,-radio/divisor,0,radio/2,r,g,0,divisor);
    drawSphere(0,0,radio/divisor,radio/2,r,0,b,divisor);
    drawSphere(0,0,-radio/divisor,radio/2,0,g,b,divisor);
  }
  popMatrix();
}


