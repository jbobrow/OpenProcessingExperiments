
// Moving clouds and grasses
// STUDY / P3D
// lin wenyu  (ken3101462@gmail.com)

int radius = 100;

void setup() {
  size(800, 600, P3D);
  background(0);
  frameRate(100);
  stroke(0);
}

float r1=random(255);
float r2=random(255);
float r3=random(255);

void draw() {
  //background(0);
  //translate(width/2, height/2, 0);

  stroke(r1, r2, r3, 150);
  ball();
  stroke(r1, r2, r3, 150);
  ball();
  //stroke(r1,r2,r3,150);
  //ball(); 

  fill(0, 10);
  rect(0, 0, width, height);
}


void ball() {
  translate(width/2, height/2, 0);

  rotateY(frameCount * 0.03);
  rotateX(frameCount * 0.04);
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  while (t < 180) {
    s += 18;
    t += 1;
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
  fill(0, 10);
  rect(0, 0, width, height);
}



