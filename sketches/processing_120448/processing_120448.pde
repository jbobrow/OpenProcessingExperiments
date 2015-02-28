
//basic from:schien@mail.ncku.edu.tw
//practice in class
//re-code:juichi lin
int radius = 50;
void setup() {
  size(480, 250, P3D);
  background(69, 58, 36,250 );
}
void draw() {
  strokeWeight(2);
  stroke(125, 171, 20);
  grass(100, 200);
  strokeWeight(15);
  stroke(199, 72, 92);
  grass(100, 100);
  strokeWeight(15);
  stroke(250, 189, 30);
  grass(200, 200);
}  


void grass(int x, int y) {
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  while (t < 180) {
    s += 18;
    t += 2;
    translate(s, t, 0);
    rotateY(frameCount * 0.03);
    rotateX(frameCount * 0.4);
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 0 + (radius*cos(radianS)*sin(radianT));
    float thisy = 0 + (radius*sin(radianS)*sin(radianT));
    float thisz = 0 + (radius*cos(radianT));
    if (lastx != 0) {
      line(thisx, thisy, thisz, lastx, lasty, lastz);
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
}


