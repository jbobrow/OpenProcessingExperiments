
int step = 1, numFrames = 120, edge=10;
float theta; 

void setup() {
  size(700, 300);
}

void draw() {
  background(#eeeeee);
  fill(#AC192A, 30);
  noStroke();
  float angle=0;
  for (int x=-edge; x<width+edge; x+=step) {
    float y = height/2 + map(sin(angle), -1, 1, -50, 50);
    float sz= map(sin(theta+angle*2),-1,1,5,20);
    ellipse(x, y, sz, sz);
    angle += (TWO_PI/width*step);
  }
  theta -= TWO_PI/numFrames;
  //if (frameCount<=numFrames) saveFrame("image-###.gif");
}

