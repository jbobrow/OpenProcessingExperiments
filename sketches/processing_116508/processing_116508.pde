
float theta = 0;
float d = 0;
float prevAx = 541;
float prevAy = 361;
float prevBx = 541;
float prevBy = 361;
float prevCx = 541;
float prevCy = 361;
float t = 0;
float dt = .01;
void setup() {
  size(1080,720);
  background(0);
}

void draw() {
    if (mousePressed) {
      t+=dt;
      fill(0);
      int Tint = int(t);
      stroke(abs(255*cos(t)), abs(255*cos(4*t)), abs(255*cos(t/2)));
      d = dist(540,360,mouseX,mouseY);
      if (mouseY>360){
        theta = acos((mouseX-540)/d);
      } else {
        theta = -acos((mouseX-540)/d);
      }
      float posAx = 540+d*cos(theta);
      float posAy = 360+d*sin(theta);
      float posBx = 540+d*cos(theta+2*PI/3);
      float posBy = 360+d*sin(theta+2*PI/3);
      float posCx = 540+d*cos(theta+4*PI/3);
      float posCy = 360+d*sin(theta+4*PI/3);
      triangle(posAx,posAy,540,360,prevAx,prevAy);
      triangle(posBx,posBy,540,360,prevBx,prevBy);
      triangle(posCx,posCy,540,360,prevCx,prevCy);
      prevAx = posAx;
      prevAy = posAy;
      prevBx = posBx;
      prevBy = posBy;
      prevCx = posCx;
      prevCy = posCy;
    }
    else{
    }
  }


