
import processing.pdf.*;

float x,y;
float angle = 0;
float r = 700;
float diff = 1;

void setup() {
  size(600, 600);
  background(100);
  
  beginRecord(PDF, "homework.pdf");
  
}

void draw() {
  
 x = r * cos(angle);
 y = r * sin(angle);
 
 fill(random(200), random(10), random(90));
 
 strokeWeight(1);
 translate(width/2, height/2);
 rotate(r);
 ellipse(x/2, y, 7, 7);
  
 strokeWeight(1);
 rotate(r);
 ellipse(x/2, y, 10, 10);
 
 strokeWeight(1);
 rotate(r);
 ellipse(x/900, y/1.1, 4, 4);
 
 
 strokeWeight(1);
 fill(250);
 rotate(r/3);
 ellipse(y/2, x/2, 2, 2);
  
 angle = angle + 0.9;
 r = r - diff;
 
 if (r == 0 || r == 700) {
   diff = diff * -1;
 }
  
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
