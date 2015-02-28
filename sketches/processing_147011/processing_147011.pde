
float angle = 7.0;
float speed = 0.05;
float radius = 230.0;

void setup() {
  size(600, 600);
  background(102,102,102);
  noStroke();
  smooth();
}

void draw() {
  fill(0,4);
  rect(0, 0, width, height);
  angle +=speed;
  float sinval = sin(angle/3);
  float cosval = cos(angle);
  
  float x = 300+(cosval * radius);
  float y = 300+(sinval * radius);
  stroke(255);
  noFill();
  ellipse(300,300,x,y);
}
