
/*
M. Kontopoulos, 2011
 Easing between two specific points in space.
 One function for an ellipse and one for a rect.
 */

float e_x, e_y;
float r_x, r_y;
float r_a;
float e_easing = 0.06;
float r_easing = 0.04;

void setup()
{
  size(600, 400);
  rectMode(CENTER);
  fill(215);
  smooth();
  e_x = 50; //ellipse x starting point
  e_y = 65; //ellipse y starting point
  r_x = 300;  //rect x starting point
  r_y = 20;   //rect y starting point
}

void draw()
{
  background(50);
  ellipseShift(mouseX);
  rectShift(mouseX);
}


void ellipseShift(float mx)
{  
  pushMatrix();
  float targetX = map(mx, 0, width, 50, 550);
  float targetY = map(mx, 0, width, 65, 300);  

  e_x += (targetX - e_x) * e_easing;
  e_y += (targetY - e_y) * e_easing;

  translate(e_x, e_y);
  ellipse(0, 0, 70, 70);
  popMatrix();
}
void rectShift(float mx)
{
  pushMatrix();
  float targetX = map(mx, 0, width, 300, 400);
  float targetY = map(mx, 0, width, 20, 300);  
  float targetA = map(mx, 0, width, 0, TWO_PI);

  r_x += (targetX - r_x) * r_easing;
  r_y += (targetY - r_y) * r_easing;
  r_a += (targetA - r_a) * r_easing;

  translate(r_x, r_y);
  rotate(r_a);
  rect(0, 0, 100, 50);
  popMatrix();
}


