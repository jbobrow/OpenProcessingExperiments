


void setup() {
  size(500, 500);

 }
 void draw(){
  background(255,204,0);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23  
  arc(mouseX, s*6, 80, 80, 0, radians(45));
  stroke(255,255,255);
  arc(mouseX, m*6, 80, 80, 0, radians(45));
  stroke(255,255,255);
  arc(mouseX, h*15, 80, 80, 0, radians(45));
  stroke(255,255,255);
} 

