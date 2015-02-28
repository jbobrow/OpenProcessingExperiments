
//import processing.opengl.*;
float theta=0,separacion=2;
float r, g, b=0;
int h=0;
//float lad=random(900);
//float lad2=random(450);
PFont font;

void setup()
{
  size(1800, 900, P3D);
  r=random(250, 255);
  g=random(250, 255);
  b=random(250, 255);
  noCursor();
  
}
void draw()
{
  lights();
  background(255);
  // if(mousePressed)
  fill(0);
stroke(0);
font = loadFont("Aharoni-Bold-48.vlw"); 
textFont(font);
text("UNOFFICIAL LOGGOTIPPO", width/4, height/3+60); 

  translate(0, height/2, -500);

  for (int e=1;e<=8;e++) {
    separacion=map(mouseX, 0, width, 0, 1.5);
    pushMatrix();
    translate(e*width/12, 0, 0);
    if (e==2)  
    {
      rotateY(theta);
      rotateX(theta);
      rotateZ(theta);
    }
    if (e==1)
    {
      rotateY(theta);
      rotateX(-theta);
      rotateZ(-theta);
    }
      if (e==3)
    {
      rotateY(-theta);
      rotateX(theta);
      rotateZ(-theta);
    }
      if (e==4)
    {
      rotateY(-theta);
      rotateX(-theta);
      rotateZ(theta);
    }
      if (e==5)
    {
      rotateY(theta);
      rotateX(-theta);
      rotateZ(-theta);
    }
     if (e==6)
    {
      rotateY(theta);
      rotateX(-theta);
      rotateZ(theta);
    }
     if (e==7)
    {
      rotateY(-theta);
      rotateX(-theta);
      rotateZ(theta);
    }
     if (e==8)
    {
      rotateY(-theta);
      rotateX(-theta);
      rotateZ(-theta);
    }
    rotateY(12);
   /* rotateX(frameCount*0.03);
    rotateY(frameCount*0.03);*/
    drawSphere(0, 0, 0, mouseY/7, 100, 100, 100, separacion);
    /*drawSphere(0,height/4,0,mouseY/7,r,g,b,separacion);
     drawSphere(0,-height/4,0,mouseY/7,r,g,b,separacion);
     drawSphere(0,0,height/4,mouseY/7,r,g,b,separacion);
     drawSphere(0,0,-height/4,mouseY/7,r,g,b,separacion);*/
    popMatrix();
  }
  theta+=0.002;
  h+=100;
  if (h==10000)
    h=0;
}

void drawSphere(float x, float y, float z, float radio, float r, float g, float b, float divisor)
{
  pushMatrix();
  translate(x, y, z);
  if (mousePressed)
    stroke(0);
  else
  //  noStroke();
  strokeWeight(1);
 /* beginShape(QUADS);
  vertex(0, 0, 0);
  vertex(radio/divisor, 0, 0);
  endShape();*/
  /*beginShape(LINES);
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
   endShape(); */

  //fill(r+100, g, b);
  noFill();
  //noStroke();
  box(100);
  if (radio>20)
  {
    drawSphere(radio/divisor, 0, 0, radio/2, r, 0, b, divisor);
    drawSphere(-radio/divisor, 0, 0, radio/2, r, g, 0, divisor);
    drawSphere(0, radio/divisor, 0, radio/2, 0, g, b, divisor);
    drawSphere(0, -radio/divisor, 0, radio/2, r, g, 0, divisor);
    drawSphere(0, 0, radio/divisor, radio/2, r, 0, b, divisor);
    drawSphere(0, 0, -radio/divisor, radio/2, 0, g, b, divisor);
  }
  popMatrix();
}



