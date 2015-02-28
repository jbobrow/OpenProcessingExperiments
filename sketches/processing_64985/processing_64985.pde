
void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  background(250, 99, 50);
}

void draw() {
  float x, y, r, r1;
  int n=7;  //n周
  float sz=5.;    //ellipse,rectサイズ
  boolean offset = false;

  scale(0.5);

  for (y=1; y<15; y++) {
    for (x=1; x<15; x++) {
      r  = 10.*(float)n-5.;
      r1 = r+sz*(float)n/2.;
      pushMatrix();
      translate(r1 + 1.5*r1*(x-1), r1 + 1.5*r1*(y-1));
      if (offset) {
        if (x%2==0) flower(n, r, sz);
        else {
          fill(180, 99, 99, 80);
          ellipse(0, 0, 20, 20);
        }
      } 
      else {
        if (x%2==0) {
          fill(60, 99, 99, 80);
          rect(0, 0, 10, 10);
        }
        else flower(n, r, sz);
      }
      popMatrix();
    }
    offset = !offset;
  }
}

void flower(int n, float r, float sz) {
  float x1;
  float num = 6.;   //1周 num*2個

  for (int i=0; i<n; i++) {
    r-=10.;
    rotate( radians(90./num) );
    stroke(15*i, 99, 99, 99);
    fill(15*i, 99, 99, 99);
    for (float theta=0.; theta<360; theta+=180./num) {
      x1 = r * cos(radians(theta));
      pushMatrix();
      if (theta<180) {
        translate(x1, sqrt(r*r-x1*x1));
        rotate(radians(theta-135.));
        rect(0, 0, sz*(n-i), sz*(n-i));
      } 
      else {
        translate(x1, -sqrt(r*r-x1*x1));
        rotate(radians(theta-135.));
        rect(0, 0, sz*(n-i), sz*(n-i));
      }
      popMatrix();
    }
  }
  noStroke();
  noFill();
}
