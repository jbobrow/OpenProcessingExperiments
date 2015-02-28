
float x;
float y;

float t = 0;
float r = 10;

void setup() {
  size(420, 420);
  background(255);
  smooth();
  noStroke();
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  
  // t = 0 -> x = 210 , y = 160
  x = r *(16 * sin(t) * sin(t) * sin(t)) + random(-5, 5);
  y = -1 * r * (13 * cos(t) - 5 * cos(2*t) - 2 * cos(3 * t) - cos(4 * t) ) +  random(-5, 5);

  noStroke();
  fill(255, random(255), 255);
  ellipse(x, y, 10, 10);

  strokeWeight(random(2, 10));
  stroke(255, random(255), 255, 10);
  line(0, 0, x, y);

  popMatrix();

  t += 0.01;
}



