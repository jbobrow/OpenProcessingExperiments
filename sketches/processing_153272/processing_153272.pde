
int num=30;
float theta, start, maxsz=300, x, y;

void setup() {
  size(500, 500);
  stroke(255);
  strokeCap(SQUARE);
  background(0);
  noFill();
}

void draw() {
  background(255);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float sw = map(sin(theta+TWO_PI/num*i),-1,1,1,3);
    translate(width/2, height/2);
    int dir=i%2==0 ? 1 : -1;
    float start = TWO_PI/num*i;
    float sz = maxsz - i*9;
    rotate(theta*dir+TWO_PI/num*i);
    stroke(0);
    strokeWeight(sw);
    arc(0,0, sz, sz, start, start+PI);
    popMatrix();
  }
  theta += 0.0523;
  //if (frameCount%2==0 & frameCount<121) saveFrame("image-###.gif");
}

