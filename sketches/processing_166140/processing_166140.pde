
float x = 0;
float y = 0;
int angle = 0;
int radius = 125;

void setup() {
  size(500, 500);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  translate(250, 250);
  
  background(50);
  stroke(80);
  // Y axis
  line(0, -250, 0, 250);
  // X axis
  line(-250, 0, 250, 0);
  
  noFill();
  stroke(255);
  ellipse(0, 0, radius*2, radius*2);
  
  
  
  if (angle == 360)
    angle = 0;
  
  x = cos(radians(angle)) * radius;
  y = sin(radians(angle)) * radius;
  
  // Background landmarks
  stroke(80);
  line(x, y, 0, y);
  line(x, y, x, 0);
  line(0, 0, x, y);
  
  // The moving circle
  fill(255);
  noStroke();
  ellipse(x, y, 10, 10);
  
  // COS representation
  stroke(200);
  line(0, 0, x, 0);
  line(0, 0, 0, y);
  
  angle++;
}

