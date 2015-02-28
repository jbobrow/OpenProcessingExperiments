
float a = 540;
float b = 360;
float r = 300;
float t = 0;
float dt = 0.01;

void setup() {
  size(1080,720);
}

void draw() {
  if (t>=0) {
    t += dt;
    if (cos(t)<0) {
      background(78,104,116);
      fill(0);
      ellipse(540, 360, 25, 25);
      fill(129, 16, 5);
      ellipse(a+(a-r/2)*sin(t),b,(r+50*abs(sin(t))-30*cos(t)),r-30*cos(t));
    } else {
      background(78,104,116);
      fill(129, 16, 5);
      ellipse(a+(a-r/2)*sin(t),b,(r+50*abs(sin(t)))-30*cos(t),r-30*cos(t));
      fill(0);
      ellipse(540, 360, 25, 25);
    }
  } else {
    exit();
  }
}


