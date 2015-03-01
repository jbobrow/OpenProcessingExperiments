
float angle = 0.0;
float offset = 250;
float scalar = 2;
float speed = 0.2;

void setup() {
  size(500, 500);
  smooth();
    background(255);
    noStroke();
    frameRate(30);
}

void draw() {
//    saveFrame("output/frames#################.tif");

//  for (int i = 1; i < 200; i += 50) {
  fill(random(255));
  float x = offset +cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  ellipse(x, y, 60, 60);
//  fill(random(255));
//  ellipse(x, y, 60, 60);
//  fill(random(255));
//  ellipse(x, y, 10, 10);
  angle += speed;
  scalar += speed;
//  }
}


