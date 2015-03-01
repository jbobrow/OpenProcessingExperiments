
float theta, lx, ly, sz;
int frames=120, cols=30, rows=cols, edge=0;

void setup() {
  size(500, 500);
  lx = width/cols;
  ly = height/rows;
  noStroke();
}

void draw() {
  background(#202020);
  drawStuff(width*.33, height*.5, #F0BE41,1);
  drawStuff(width*.66, height*.5, #5C496E,-1);
  theta -=TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

void drawStuff(float ox, float oy, color col, int r) {
  for (int i=edge; i<cols-edge; i++) {
    for (int j=edge; j<rows-edge; j++) {
      fill(col);
      float x = (i+.5)*lx;
      float y = (j+.5)*ly;
      float distance = dist(x, y, ox, oy);
      //float distance = dist(x,y,width/2,height/2);
      float offSet = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 0, TWO_PI);
      float sz = map(sin(theta*r+offSet*5), -1, 1, 3, 14);
      ellipse(x, y, sz, sz);
    }
  }
}
