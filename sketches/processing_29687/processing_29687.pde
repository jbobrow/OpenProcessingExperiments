
float r, a, b, s;
void setup() {
  size(200, 200, P2D);
  s=width/5;
  noSmooth();
}
void draw() {
  background(255);
  strokeWeight(2);
  translate(width/2, height/2);
  rotate(r);
  noFill();
  for (int j=0;j<4;j++) {
    float p4=PI/4f;
    for (int i=0;i<3;i++) {
      arc(0, 0, width-((i/3f)*s)-(j*s), height-((i/3f)*s)-(j*s), p4*j, p4*(j+1));
    }
  }
  fill(0);
  arc(0, 0, width, height, PI, TWO_PI);
  r+=a;
  a+=b;
}

void mousePressed() {
  b= mouseButton==LEFT ? 0.001 : -0.001;
}
void mouseReleased() {
  b=0;
}


