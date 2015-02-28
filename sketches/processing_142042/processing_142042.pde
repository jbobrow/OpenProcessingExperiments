
//EASING
/*Reas & Fry. Getting Started with Processing*/

float x;
float y;
float px;  
float py;
float easing = 0.05;


void setup() {
  size(480, 120);
  smooth();
  stroke(0, 102);
}

void draw() {
  //easing X and Y
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  
  //set weight
  float weight = dist(x, y, px, py); //the largest the distance, the thicker the line
  strokeWeight(weight);
  
  //draw line
  line(x, y, px, py);
  
  //update position at each redraw so dist can be calculated each time.
  py = y;
  px = x;
}

