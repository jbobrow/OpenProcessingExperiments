
import processing.pdf.*;
void setup() {
       size(600, 300);
       background(0);
       smooth();
     }
void draw(){
  float frame=frameCountP0;
  float ran=radians(frameCount*2);
  translate(frame*3,height/2);
  rotate(ran);
  float scl=sin(radians(frame*3.5));
  //scale(scl);
  scale(map(scl, -1, 1, .5, 1));
  //println(frame);
  /*
  translate(width/2,height/2);
  rotate(radians(frame));
  //scale(sin(radians(frame)));
  */
  if (frame >250)
    background(0);
    frame=0;
  drawEllipse();
  drawStar();
}
void drawFigure(){
  noFill();
  stroke(0,0,0,128);
   rect(0,0,100,100);
}
void drawStar() {
  float r1 = 20;
  float r2 = 60;
  int numPoints = 2;
  float dTheta = radians(360)/(numPoints * 2.0);
  for (int i=0; i<numPoints; i++) {
     float x0 = r1 * cos((2*i)*dTheta);
     float y0 = r1 * sin((2*i)*dTheta);
     float x1 = r2 * cos(((2*i)+1) * dTheta);
     float y1 = r2 * sin(((2*i)+1) * dTheta);
     float x2 = r1 * cos(((2*i)+2) * dTheta);
     float y2 = r1 * sin(((2*i)+2) * dTheta);
     noFill();
     stroke(255, 255, 255, 128);
     line(x0, y0, x1, y1);
     line(x1, y1, x2, y2);
  }
}
void drawEllipse() {
  noFill();
  stroke(255, 255, 255, 128);
  ellipse(0, 0, 60, 40);
}


