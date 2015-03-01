
int frames = 180, step=25, border=100, dmax=80;
float theta;

void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB,360,100,100);
}

void draw() {
  randomSeed(66);
  fill(#000000,30);
  noStroke();
  rect(0,0,width, height);
  strokeWeight(2);
  int cx=0;
  for (int x=border; x<width-border+1; x+=step) {
    int cy=0;
    int n=(int) sq((height-2*border)/step);
    for (int y=border; y<height-border+1; y+=step) {
      stroke(random(360),100,100,200);
      float offSet=(TWO_PI/n*cx*cy);
      //float offSet=0;
      float distance=dist(0,0, x, y);
      float max=map(distance, 0, sqrt(sq(width)+sq(height)),1,dmax);
      pushMatrix();
      translate(x, y);
      float d=map(sin(theta+offSet), -1, 1, max, max/5);  
      float x1=cos(theta)*d;
      float y1=sin(theta)*d;
      line(0, 0, x1, y1);
      popMatrix();
      cy++;
    }
    cx++;
  }
  theta -= TWO_PI/frames;
  //if (frameCount>=frames && frameCount<2*frames+1) saveFrame("image-###.gif");
}

