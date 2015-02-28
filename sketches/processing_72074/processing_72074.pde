
//Ben Norskov
//Lissajous curve code
//9/15/12

float spacing = QUARTER_PI*.2; //how far away from one another the balls are
int num_balls = 100;
DrawBall[] balls = new DrawBall[num_balls];
void setup() {
  smooth();
  size(500, 500);
  float ang = 0;
  for (int i = 0; i<num_balls; i++) {//setup the circles
    balls[i] = new DrawBall(ang);
    ang += spacing;
  }
}
void draw() {
  background(0);
  float xx = map(mouseX, 0, width, 0, 6);
  float yy = map(mouseY, 0, height, 0, 6);
  for (int i = 0; i<num_balls; i++) {
    balls[i].update(xx, yy);
    balls[i].display();
  }
}
// /// // /// // /// // /// // DrawBall Class
class DrawBall{
  float angle, speed, drift;
  float x_multi = 4.2; float y_multi = 1;
  float diam = 10;
  float prev_x, prev_y;
  float direction = 1; //-1 reverses direction
  //
  DrawBall(float _ang) {
    angle = _ang; //where to start
    speed = QUARTER_PI*.1; //how fast to move
    drift = .01; // a slight offset to make the circles "chase" each other
  }
  void update(float _x, float _y) {
    //drift is so that they circles don't always appear in the same spots
    angle += (speed + drift)*direction;
    x_multi = _x;
    y_multi = _y;
    while (angle > TWO_PI) { //constrain under 2 PI
      angle -= TWO_PI;
    }
  }
  void display() {
    float center_x = width * .5;
    float center_y = height * .5;//these are the point around which all the circles revolve
    float x = cos(angle*x_multi)*200 + center_x; 
    float y = sin(angle*y_multi)*200 + center_y; // x and y offset from center
    ellipse(x, y, diam, diam);
    prev_x = x;
    prev_y = y;//track last position, for future use
  }
}
