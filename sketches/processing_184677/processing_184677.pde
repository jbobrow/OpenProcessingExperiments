
float unit, theta;
int num = 27, frames=120;

void setup() {
  size(540, 540);
  unit = width/num;
  rectMode(CENTER);
}

void draw() {
  background(20);
  stroke(20);
  fill(255);
  for (int y=0; y<=num; y++) {
    for (int x=0; x<=num; x++) {
      float distance = dist(width/2, height/2, x*unit, y*unit);
      float offSet = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 0, TWO_PI);
      float sz = map(sin(theta+offSet), -1, 1, unit*.9, unit*.1);
      float angle = atan2(y*unit-height/2, x*unit-width/2);
      float r = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 0, PI);
      float w = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 3, 2);
      pushMatrix();
      translate(x*unit, y*unit);
      rotate(r);
      rotate(angle);
      fill(255);
      rect(0, 0, sz, sz*w);
      popMatrix();
    }
  }
  stroke(255);

  theta -= TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

