
int count;
  int direction; 
  
void setup() {
  size(400,400);
  stroke(255);
  smooth();
  count=0;
  direction = 1; 
}
void draw() {
  if (count == 254) {
    direction = -1; 
  } else if (count == 0) { 
    direction = 1; 
  }
  count += direction;
  background(count%255);
  fill(count%255);
  noStroke();
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  stroke(80);
  strokeWeight(1);
  line(width/2, height/2, cos(s) * 300 +width/2, sin(s) * 300 + height/2);

  fill(255,255,255,100);
  noStroke();
  arc(width/2, width/2, 600, 600, m , h);
  
  // Draw the minute ticks
 
  
}


