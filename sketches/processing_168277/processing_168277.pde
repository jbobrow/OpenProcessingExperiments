
int frames = 180, num=20, loLimit=400, hiLimit=100, rs;
float theta, sz=10, scal, edge, step, f;

void setup() {
  size(500, 500);
  noStroke();
  edge=100;
  step=(width-2*edge)/num;
}

void draw() {
  randomSeed(rs);
  background(20);
  int i=0;
  for (int j=0; j<4; j++) {
    for (int x=100; x<401; x+=step) { 
      float y = map(sin(j*PI/8+theta+(TWO_PI/num*i)), -1, 1, loLimit, hiLimit);
      for (int h=0; h<7; h++) {
        f = 255;
        fill(f, h*30);
        if (y>=hiLimit && y<=loLimit) scal = map(y, loLimit, hiLimit, 1, 2.8-h*.3);
        ellipse(x, y, sz*scal, sz*scal);
      }
      fill(f);
      ellipse(x, y, sz, sz);
      i++;
    }
  }

  theta += TWO_PI/frames;
  //if (frameCount<frames+1) saveFrame("image-###.gif");
}

