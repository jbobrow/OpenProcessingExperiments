
int numberFrames = 60, step=10, border=100, dmax=80;
float theta;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  stroke(0);
  int cx=0;
  for (int x=border; x<width-border; x+=step) {
    int cy=0;
    int n=(int) sq((height-2*border)/step);
    for (int y=border; y<height-border; y+=step) {
      float offSet=(TWO_PI/n*cx*cy);
      //float offSet=0;
      float distance=dist(0, 0, x, y);
      float max=map(distance, 0, sqrt(sq(width)+sq(height)), 0, dmax);
      pushMatrix();
      translate(x, y);
      float d=map(sin(theta+offSet), -1, 1, max, 5);  
      float x1=cos(theta)*d;
      float y1=sin(theta)*d;
      line(0, 0, x1, y1);
      popMatrix();
      cy++;
    }
    cx++;
  }
  theta -= TWO_PI/numberFrames;
  //if (frameCount<=numberFrames) saveFrame("image-###.gif");
}

