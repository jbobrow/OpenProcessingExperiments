
import processing.opengl.*;

float x, y;
float angle = 0;
float r = 30;
float d = 0;
 

void setup() {
 
  size(600, 600);
 
  background(255);
}
 
void draw() {
   
  x = r * cos (angle);
  y = r * sin (angle);
 

  stroke(200,100);
  stroke(random(0,10), random(150,210), random(255,255));
noFill();
  translate(width/2, height/2);
  rotate(angle);
  line (10, 10, x, y);
  line (30, 30, x+20, y+20);
  line (70, 70, x+40, y+40);
  line (150, 150, x+80, y+80);

  angle += 0.1;
  r = r -d;
 
  if (r == 0 || r== 100) {
    d = d * -1;
  }
 
 
 
 
 
 
  println(x+ " : " +y);
}
 
void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}

