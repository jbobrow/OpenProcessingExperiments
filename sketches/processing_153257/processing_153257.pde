
int num=30;
float theta, start, maxsz=300;

void setup() {
  size(500, 500);
  stroke(0);
  noFill();
}

void draw() {
  background(255);
  for (int i=0; i<num; i++) {
    pushMatrix();
    translate(width/2, height/2);
    int dir=i%2==0 ? 1 : -1;
    float start = TWO_PI/num*i;
    float sz = maxsz - i*9;
    rotate(theta*dir);
    arc(0, 0, sz, sz, start, start+PI);
    popMatrix();
  }

  theta += 0.0523/2;
  //if (frameCount%3==0 & frameCount<241) saveFrame("image-###.gif");
}
