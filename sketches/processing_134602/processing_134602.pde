
/**
 * Linear Motion. 
 * 
 * Changing a variable to create a moving line.  
 * When the line moves off the edge of the window, 
 * the variable is set to 0, which places the line
 * back at the bottom of the screen. 
 */

float a;
float b;

void setup() {
  size(640, 360);
  stroke(255);
  a = height/2;
}

void draw() {
  line(0, a, width, a); 
  stroke(random(0, 255), random(0, 255), random(0, 255),b);
  rect(0, height, width, a);
  fill(random(0, 255), random(0, 255), random(0, 255));
  //    background(51);
    a = a - 0.5;
    b++;
  if (a < 0) { 
    a = height;
  }
}



