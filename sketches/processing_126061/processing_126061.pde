
float velocity;
int ex,ey;
int maxheight;

void setup() {
  size(640, 360);
  noStroke();
  colorMode(RGB, height, height, height);
  rectMode(CENTER);
  velocity = 0.0;
  ex = 320;
  ey = 0;
  maxheight = 320;
}

void draw() {
  background(0.0);
  if (abs(velocity) < 1)
  {
    println(ey);
  }
  fill(122);
  ellipse(ex,ey,20,20);
  if (ey < 340)
  {
    ey += velocity;
    velocity += 0.1;
  }
  else
  {
    velocity *= -0.85;
    ey = 339;
    maxheight = 320;
  }
  

}
