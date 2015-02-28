
void setup()
{
  size(460, 450);
  stroke(255);
}

void draw()
{
  background(255); 
  noStroke();
  smooth(); 
  translate(260, -75);
  rotate(45);
  fill(68, 95, 7);
  ellipse(230, 180, 240, 470);
  fill(168, 229, 28);
  ellipse(230, 200, 210, 360);
  fill(229, 159, 28);
  ellipse(230, 200, 200, 350);
  fill(13, 144, 119);
  ellipse(230, 230, 170, 220); 
  fill(8, 37, 118);
  ellipse(230, 230, 150, 200);
  fill(255, 70);
  ellipse(250, 250, 70, 70);
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI - radians(45);
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI - radians(45); 
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI - radians(45); 
  stroke(255); 
  strokeWeight(2);
  line(250, 250, cos(s) * 60 + 250, sin(s) *  60 + 250);
  strokeWeight(4); 
  line(250, 250, cos(m) *  50 + 250, sin(m) * 50 + 250); 
  line(250, 250, cos(h) *  40 + 250, sin(h) * 40 + 250); 
}

