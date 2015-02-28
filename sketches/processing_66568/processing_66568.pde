
float x, y;
color col = color(0, 255, 255);
float speed = 0;
float gravity = 0.1;
float ediam = 100;


void setup () {
  size(500, 500);
  smooth();
  x = width/2;
  y = random(0, height/3);
}

void draw() {
  background(180);

  //display the ball
  ellipseMode(CENTER);
  fill(col);
  strokeWeight(3);
  ellipse(x, y, ediam, ediam);
  y = y + speed;
  speed = speed + gravity;
  if (y > height-ediam/2) {
    speed = speed * -0.95;
    col = color(random(255), random(255), random(255));
  }
}
