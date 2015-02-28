
//praticeM,by chen, wu-zhi
//noise practice
//reference to my dear teacher:Sheng-Fen Nik Chien

int colorR = random(100, 255);
int colorG = random(100, 255);
int colorB = random(100, 255);
int radius = 100;

void setup() {
  size(500, 300, P3D);
  background(255);
  //stroke(0);
}

void draw() {
  background(colorR, colorG, colorB);
  stroke(colorR+50, colorG+50, colorB+50);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.01);
  //rotateX(frameCount * 0.04);
  rotateZ(frameCount * 0.3);
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;

  while (t < 180) {
    s += 500;
    t += 0.5;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 10 + (radius*cos(radianS)*sin(radianT));
    float thisy = 0 + (radius*sin(radianS)*sin(radianT));
    float thisz = 0 + (radius*cos(radianT));
    if (lastx != 0) {
      strokeWeight(1);
      line(thisx, thisy, thisz, lastx, lasty, lastz);
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
}



