
//PHOSPHENE GENERATOR
//Kevin Chen
//based on the Lissajous curve code by Ben Norskov
 
float spacing = QUARTER_PI*.1;
int num_balls = 100;
DrawBall[] balls = new DrawBall[num_balls];

float angle = 0;

void setup() {
  smooth();
  size(500, 500);
  float ang = 0;
  for (int i = 0; i<num_balls; i++) {
    balls[i] = new DrawBall(ang);
    ang += spacing;
  }
}
void draw() {
  background(random (255));
  fill(random (255), random (255), random (255));
  stroke (random (255), random (255), random (255));
  strokeWeight (random(5));
  float xx = map(mouseX, 0, width, 0, 6);
  float yy = map(mouseY, 0, height, 0, 6);
  for (int i = 0; i<num_balls; i++) {
    balls[i].update(xx, yy);
    balls[i].display();
  }
}

class DrawBall{
  float angle, speed, drift;
  float x_multi = 4.2; float y_multi = 1;
  float diam = random(75);
  float prev_x, prev_y;
  float direction = -1;
  
  DrawBall(float _ang) {
    angle = _ang;
    speed = HALF_PI*.1;
    drift = .1;
  }
  void update(float _x, float _y) {
    angle += (speed + drift)*direction;
    x_multi = _x;
    y_multi = _y;
    while (angle > TWO_PI) {
      angle -= TWO_PI;
    }
  }
  void display() {
    float center_x = mouseX;
    float center_y = mouseY;
    float x = tan(angle*x_multi)*300 + center_x;
    float y = tan(angle*y_multi)*300 + center_y;
    ellipse(x, y, diam, diam);
    prev_x = -x;
    prev_y = -y;
  }
}

