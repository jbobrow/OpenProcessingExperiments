

float thold = 5;
float spifac = 1.05;
float drag = 0.01;
int big = 500;
ball bodies[] = new ball[big];
float mX;
float mY;
void setup() {
  size(400, 300);
  strokeWeight(1);
  smooth();
  stroke(0, 0, 0, 10);
  for(int i = 0; i < big; i++) {
    bodies[i] = new ball();
  }
}
void draw() {
  if(mousePressed) {
    background(255);
    
    mX += 0.3 * (mouseX - mX);
    mY += 0.3 * (mouseY - mY);
  }
   mX += 0.3 * (mouseX - mX);
    mY += 0.3 * (mouseY - mY);
  for(int i = 0; i < big; i++) {
    bodies[i].render();
  }
  filter(BLUR,1);
}
class ball {
  float X;
  float Y;
  float Xv;
  float Yv;
  float pX;
  float pY;
  float w;
  ball() {
    X = random(screen.width);
    Y = random(screen.height);
    w = random(1 / thold, thold);
  }
  void render() {
    if(!mousePressed) {
      Xv /= spifac;
      Yv /= spifac;
    }
    Xv += drag * (mX - X) * w;
    Yv += drag * (mY - Y) * w;
    X += Xv;
    Y += Yv;
    line(X, Y, pX, pY);
    pX = X;
    pY = Y;
  }
}
