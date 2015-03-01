
float y = 50.0;
float speed = 0.5;
float radius = 15.0;

void setup() {
  size(100, 100);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  ellipse(33, y, radius, radius);
  y = y + speed;
  println(speed);

  if (y >= height-radius) { 
    speed = -speed;
  } 
  
  if (y <= radius) {
    //y = y + speed;
    speed = -speed;
  }
}

