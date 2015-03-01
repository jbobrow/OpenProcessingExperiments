
int num=12, frames=120, step=100, edge=step;
float theta;
long rs;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  rs = (long) random(100000);
}

void draw() {
  randomSeed(rs);
  background(#ffffff);
  noStroke();
  for (int y=edge; y<=height-edge; y +=step) {
    float j=0;
    for (int x=edge; x<=width-edge; x += step) {
      for (int i=num; i>0; i--) {
        float offSet = TWO_PI/num*i;
        float sz = (5+i*4)*map(sin(theta+random(TWO_PI)),-1,1,.5,1);
        pushMatrix();
        translate(x, y);
        float r = map(sin(theta+offSet), -1, 1, 0, PI/3);
        rotate(r);
        fill(107, 100, 100-i*6);
        rect(5, 0, sz, sz);
        popMatrix();
      }
      j++;
    }
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

