
int start_x;
int start_y;
int len = 50;
int num_max = 8;
int theta = -90;
int theta_delta = 0;

void setup() {
  size(450, 450);
  colorMode(HSB, 360, 100, 100);
  background(360);
  strokeWeight(5);

  start_x = width/2;
  start_y = height/2;
}

void draw() {
  background(360);

  for (int i = 0; i < 4; i++) {
    drawingLines(start_x, start_y, len, theta+90*i, num_max);
  }

  theta_delta += 2;
}

void drawingLines(float Ax, float Ay, float len, float theta, int num) {
  float x = 0;
  float y = 0;

  float Bx = Ax+len*cos(radians(theta));
  float By = Ay+len*sin(radians(theta));

  stroke(170+20*num, 50, 100, 80);
  line(Ax, Ay, Bx, By);

  if (num > 0) {
    drawingLines(Bx, By, len*0.8, theta+theta_delta, num-1);
    drawingLines(Bx, By, len*0.8, theta-theta_delta, num-1);
  }
}



