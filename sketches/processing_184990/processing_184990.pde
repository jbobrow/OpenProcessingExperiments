
int frames=120, num=1200, sz=2, c=12;
float theta, r;

void setup() {
  size(540, 540, P2D);
  smooth(4);
  noStroke();
}

void draw() {
  background(20);
  fill(255,30);
  for (int j=0; j<c; j++) {
    r=TWO_PI/c*j;
    for (int i=0; i<num; i++) {
      float offSet=TWO_PI/num*i;
      pushMatrix();
      translate(width/2, height/2);
      rotate(r);
      float d =  map(sin(theta-offSet), -1, 1, 0, 60);
      float x = 25 + d*2 + map(sin(theta+offSet*10), -1, 1, 0, d);
      ellipse(x, 0, sz, sz);
      r+=TWO_PI/num;
      popMatrix();
    }
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}
