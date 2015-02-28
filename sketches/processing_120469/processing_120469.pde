
//praticeM,by chen, wu-zhi
//noise practice
//reference to my dear teacher:Sheng-Fen Nik Chien

int colorR = 20;
int colorG = 100;
int colorB = 50;
int radius = 90;
//int alpha = random(50);

void setup() {
  size(750, 450, P3D);
  smooth(30);
  sphereDetail(20);
}

void draw() {
  background(0);
  drawPineal();
}

void drawPineal() {
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  stroke(colorR+55, colorG+55, colorB+55);
  translate(6*width/8, 2*height/3, 0);
  rotateX(frameCount * 0.00000000005);
  rotateY(frameCount * 0.005);  
  rotateZ(frameCount * 0.05);

  while (t < 180) {
    s += 500;
    t += 0.5;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 10 + (radius*cos(radianS)*sin(radianT));
    float thisy = 0 + (radius*sin(radianS)*sin(radianT));
    float thisz = 0 + (radius*cos(radianT));
    if (lastx != 0) {
      strokeWeight(6);     
      stroke(colorR+t, colorG-t, colorB-t);
      line(thisx, thisy, thisz, lastx, lasty, lastz);
      stroke(colorR+t, colorG+t, colorB-t);
      line(30*thisx, 25*thisy, 25*thisz, lastx, lasty, lastz);
      stroke(colorR+t, colorG-t, colorB-t);
      point(10*thisx, 10*thisy, 10*thisz, lastx, lasty, lastz);
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
}



