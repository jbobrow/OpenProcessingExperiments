
int frames=120, num=400, sz=40;
float theta;

void setup() {
  size(750, 540, P2D);
  smooth(4);
  noStroke();
}

void draw() {
  background(20);
  float r=PI;
  for (int i=0; i<num; i++) {
    float offSet=TWO_PI/num*i;
    pushMatrix();
    translate(width/2, height/2);
    rotate(r);
    float d =  map(sin(theta-offSet), -1, 1, 0, 20);
    float x = 150 + map(sin(theta+offSet*10), -1, 1, 0, d);
    ellipse(x, 0, sz, sz);
    r+=TWO_PI/num;
    popMatrix();
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

