
int num=40;
float theta;

void setup() {
  size(500, 500);
}

void draw() {
  background(20);
  for (int i=0; i<num; i++) {
    pushMatrix();
    translate(width/2, height/2);
    float r = TWO_PI/num*i;
    rotate(r);
    float offSet = r*3;
    float x = map(sin(theta+offSet), -1, 1, 20, width*.4);
    float min = 15;
    float max = 50;
    float sz = map(sin(theta+offSet), -1, 1, max, min);
    fill(255);
    noStroke();
    ellipse(x, 0, sz, sz);
    noFill();
    stroke(255);
    float scal=map(sz, min, max, 1.8, 1);
    ellipse(x, 0, sz*scal, sz*scal);
    popMatrix();
  }
  theta += 0.0523;
  //if (frameCount%2==0 && frameCount<241) saveFrame("image-###.gif");
}

