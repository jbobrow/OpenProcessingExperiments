
/**
 * Reach 1. 
 * Based on code from Keith Peters (www.bit-101.com)
 * 
 * The arm follows the position of the mouse by
 * calculating the angles with atan2(). 
 */

 
float x = 100;
float y = 100;
float x2 = 200;
float y2 = 130;
float segLength = 40;


void setup() {
  size(400, 400);
  smooth(); 

  strokeWeight(10.0);
  stroke(240, 180, 85, 180);
}

void draw() {
  background(255);
  
  //Matratze
  noStroke ();
  fill (0, 10, 230, 200);
  quad (200, 318, 150, 290, 280, 292, 350, 318);
  quad (150, 310, 200, 338, 200, 318, 150, 290);
  fill (0, 0, 255, 180); 
  rect (200, 318, 150, 20);
  
  //Matte
  fill (30, 150, 250);
  quad (0, 310, 150, 310, 200, 340, 0, 340);
  stroke (240, 180, 85, 180);
  
  //Gerüst, hinten
  //obere Stange
  strokeWeight (1.0);
  line (230, 120, 165, 140);
  
  //Seite
  strokeWeight (2.0);
  stroke (255, 30, 40);
  line (230, 120, 210, 340);
  line (165, 140, 150, 310);
  
  //Gerüst, vorne
  //obere Stange
  strokeWeight (1.0);
  stroke (240, 180, 85, 180);
  line (100, 200, 60, 200);
  
  //Seite
  strokeWeight (2.0);
  stroke (255, 30, 40);
  line (100, 200, 105, 340);
  line (60, 200, 65, 310);
  
  stroke (240, 180, 85, 180);
  
  strokeWeight(10.0);
    
  float dx = mouseX - x;
  float dy = mouseY - y;
  float angle1 = atan2(dy, dx);  
  
  float tx = mouseX - cos(angle1) * segLength;
  float ty = mouseY - sin(angle1) * segLength;
  dx = tx - x2;
  dy = ty - y2;
  float angle2 = atan2(dy, dx);  
  x = x2 + cos(angle2) * segLength;
  y = y2 + sin(angle2) * segLength;
  
  segment(x, y, angle1); 
  segment(x2, y2, angle2); 
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}



