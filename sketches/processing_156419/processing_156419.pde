
int num = 10;
float theta;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float offSet = TWO_PI/num*i;
    rotate(offSet);
    float sz = map(sin(theta+offSet), -1, 1, 20, 40);
    ellipse(0, width*.35, sz, sz);
    for (int j=0; j<num; j++) {
      pushMatrix();
      translate(0, width*.35);
      float offSet2 = TWO_PI/num*j;
      rotate(offSet2);
      float sz2 = map(sin(theta+offSet*2), -1, 1, 10, 20);
      ellipse(0, sz*.8, sz2, sz2);
      popMatrix();
    }
    popMatrix();
  }
  theta += 0.0523;
}

