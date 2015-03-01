
int step = 1, numFrames = 120, edge=-80, maxY=20;
float theta; 

void setup() {
  size(700, 300);
}

void draw() {
  background(#000000);
  fill(#AC192A, 150);
  noStroke();
  float angle=0;
  for (int x=-edge; x<width+edge; x+=step) {
    float y = height/2 + map(sin(theta+angle), -1, 1, -maxY, maxY);
    float sz= map(sin(theta+angle*2), -1, 1, 2, 4);
    float rx = map(sin(theta+angle*3), -1, 1, -20, 40);
    float r = map(sin(angle*2), -1, 1, PI/4, PI/2);
    pushMatrix();
    translate(x,y);
    rotate(r);
    ellipse(rx, 0, sz, sz);
    popMatrix();
    angle += (TWO_PI/width*step);
  }
  theta -= TWO_PI/numFrames;
  //if (frameCount<=numFrames) saveFrame("image-###.gif");
}

