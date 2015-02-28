
// Example 05-09 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

float x;
float y;
float px;
float py;
float easing = 0.1;

void setup() {
  size(920,600);
  smooth();
  stroke(0,0,200, 102);
}

void draw() {
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  float weight = dist(x, y, px, py);
  strokeWeight(weight);
  stroke(x/3,y/3,255,102);
  line(x, y, px, py);
  py = y;
  px = x;
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
