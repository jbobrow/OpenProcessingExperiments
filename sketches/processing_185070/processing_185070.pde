
int frames=100, num=200, sz=2;
float theta;

void setup() {
  size(540, 540);
  noStroke();
}

void draw() {
  randomSeed(125);
  background(20);
  float r=0;
  noStroke();
  fill(255,100);
  for (int i=0; i<num; i++) {
    float offSet=TWO_PI/num*i;
    pushMatrix();
    translate(width/2, height/2);
    rotate(r);
    float d =  map(sin(theta-offSet*2), -1, 1, 20, 40);
    for (int j=0; j<100; j++) {
      float x = random(20, 150);
      ellipse(x+d, 0, sz, sz);
    }
    r+=TWO_PI/num;
    popMatrix();
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}
