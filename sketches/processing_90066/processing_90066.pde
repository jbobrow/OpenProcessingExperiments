
int y = 300;
int x = 300;
int speed = 1;
int state = 0;
int stateincrement = 1;


void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  if (state == 0) {
    fill(255, 0, 0);
    ellipse(300, y, 100, 100);
  }

  if (state == 1) {
    fill(0, 255, 0);
    ellipse(x, 200, 100, 100);
  }
  if (state == 2) {
    fill(0, 0, 255);
    rect(100, y, 215, 115);
  }
  if (state == 3) {
    fill(255, 0, 255);
    rect(x, 100, 215, 115);
  }
  if (y > height) {
    speed = speed * -1;
  }
  else if (y < 0) {
    speed = speed * -1;
  }


  else if (x > height) {
    speed = speed * +1;
  }
  else if (x < 0) {
    speed = speed * +1;
  }
  y = y - speed;
  x = x - speed;
  if ((state > 0) || (state <= 4)) {
    stateincrement = stateincrement *-1;
  }
}
void mousePressed() {
  state = state + stateincrement;
  println(state);
}
