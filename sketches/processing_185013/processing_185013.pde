
int frames=60, num=200, sz=2;
float theta;
long rs;

void setup() {
  size(540, 540);
  noStroke();
  rs = (long) random(2323232);
}

void draw() {
  randomSeed(rs);
  background(10);
  float r=0;
  noStroke();

  for (int i=0; i<=num; i++) {
    float offSet=TWO_PI/num*i;
    pushMatrix();
    translate(width/2, height/2);
    rotate(r);
    float x = 0;
    float d =  map(sin(theta-offSet*3), -1, 1, 20, 40);
    for (int j=0; j<100; j++) {
      if (random(1)>.9){
      x = random(15, 180);
      } else{
      x = random(20, 150);
      }
      if (x>80) {
        fill(0,255,0, 150);
      } else {
        fill(255, 100);
      }
      ellipse(x+d, 0, sz, sz);
    }
    r+=TWO_PI/num;
    popMatrix();
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

