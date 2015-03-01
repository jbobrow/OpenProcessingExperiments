
int num = 9;
float theta;

void setup() {
  size(500, 500);
  noFill();
}

void draw() {
  background(#202020);
  translate(width/2, height/2);
  strokeWeight(2);
  stroke(255);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float offSet = TWO_PI/num*i;
    rotate(offSet);
    float sz = map(sin(theta+offSet), -1, 1, 25, 45);
    ellipse(0, width*.35, sz, sz);
    translate(0, width*.35);
    int dir=i%2==0?1:-1;
    rotate(theta/2*dir);
    for (int j=0; j<num; j++) {
      pushMatrix();
      float offSet2 = TWO_PI/num*j;
      rotate(offSet2);
      float sz2 = map(sin(offSet2), -1, 1, 8, 16);
      ellipse(0, sz, sz2, sz2);
      popMatrix();
    }
    popMatrix();
  }
  theta += 0.0523;
  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
}

