
int x = 30;
int u = 50;
float a = -0.12;

void setup() {
  size(400, 400);
  stroke(200,100, 0, 33);
  smooth();
  noLoop();
}

void draw() {
  background(104, 130, 250, 100);
  tail(x, u, a);
  tail(u, x, a);
  tail(u+x, x+u, u);
  tail(350, 40, 100);
  tail(300, 40, 100);
  tail(250, 40, 100);
  tail(200, 40, 100);
}
  
  void tail(int xpos, int units, float angle) {
    pushMatrix();
    translate(xpos, 10);
    for (int i = units; i > 0; i--) {
      strokeWeight(i);
      line(0,0,0,8);
      translate(0,8);
      rotate(TWO_PI);
    }
    popMatrix();
  }
  


