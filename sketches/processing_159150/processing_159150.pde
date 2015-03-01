
import processing.pdf.*;

float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float r;
float g; 
float b;
float a;
void setup(){
  size(800,800);
  beginRecord(PDF, "everything.pdf");
}
void draw(){
   r = random(255);
   g = random(255);
   b = random(255);
   a = random(255);
   x1 = random(width);
   y1 = random(height);
   x2 = random(width);
   y2 = random(height);
   x3 = random(width);
   y3 = random(height);
   fill(r,g,b,a);
   triangle(x1,y1,x2,y2,x3,y3);
}
void mouseReleased(){
  noLoop();
}
void mousePressed(){
  loop();
}
void keyPressed(){
  endRecord();
}


