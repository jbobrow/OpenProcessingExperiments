
float x, y;
int mini_radius = 50;
int mini_angle = 0;

int max_angle = 0;

void setup() {
  frameRate(120);
  size(500, 500);
  background(50);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  translate(250, 250);
  rotate(radians(max_angle));
  
  x = cos(radians(mini_angle)) * mini_radius + 150;
  y = sin(radians(mini_angle)) * mini_radius;
  fill(max_angle % 360, 100, 100);
  noStroke();
  ellipse(x, y, 10, 10);
  
  mini_angle += 8;
  
  max_angle++;
  
  if (max_angle == 360) {
    noLoop();
  }
}
