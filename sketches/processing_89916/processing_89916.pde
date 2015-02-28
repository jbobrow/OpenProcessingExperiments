
ball ballONE = new ball(50, 3), ballTWO = new ball(400, -3);
void setup() {
  size(400, 400);
}
void draw() {
  background(0);
  ballONE.drawball();
  ballTWO.drawball();
}
class ball {
  float x, y=200, xvel;
  
   ball(float xvar, float xvelvar) {
    xvel=xvelvar;
    x=xvar;
  }
  void drawball() {
    x+=xvel;
    if(dist(ballONE.x, ballONE.y, ballTWO.x, ballTWO.y)<25) {
      xvel*=-1;
    }
    ellipse(x, y, 25, 25);
    if(x<0 || x>width) {
      xvel*=-1;
    }
  }
}
