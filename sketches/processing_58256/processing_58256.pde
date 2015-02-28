
//PS3_QUESTION.2_KESHIA.KINGSLEY

int btnX = 60;
int btnY = 50;
int btnW = 80;
int btnH = 80;
//--------------------------------------------------------------
Ball [] balls = new Ball [30];
Button button;
boolean animate = true;
boolean btn_state = false;

void setup() {
  size(400, 500);
  smooth();
  button = new Button();
  for (int i=0; i < balls.length; i++) {
    balls [i] = new Ball (random(width), 20);
  }
}
//---------------------------------------------------------------
void draw() {
  background(240, 199, 51);
  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
    balls[i].bounce();
  }
 
  button.display();
}
//---------------------------------------------------------------
class Ball {
  float x;
  float y;
 
  float speed;
  float gravity;
  float s;
  color c;
  
  Ball (float BallX, float BallY) {
 
    x = BallX;
    y = BallY;
 
    speed = random(0.1, 5);
    gravity = 0.1;
    s = map(speed, 1, 10, 20, 100);
    c = color(205, 105, 51);
  }
 
  void display() {
    fill(c);
    ellipse(x, y, s, s);
  }
 
  void bounce() {
    if ( btn_state==true) {
      y=y+speed;
      speed = speed + gravity;
    }
    if ( y > height -100) {
      speed = speed *-0.9;
    }
  }
}
//---------------------------------------------------------------
class Button {
  int btnX;
  int btnY;
  int btnW;
  int btnH;
 
  Button () {
    btnX = 60;
    btnY = 50;
    btnW = 55;
    btnH = 55;
  }
 
  void display() {
    fill (255, 157, 254);
    rect(btnX, btnY, btnW, btnH);
  }
}
 
//---------------------------------------------------------------
 
 
void mousePressed() {
  if ( mouseX > btnX && mouseX < btnX+btnW
    && mouseY > btnY && mouseY < btnY+btnH) {
 
    if (btn_state == false) {
      btn_state = true;
    }
    else {
      btn_state = false;
    }
  }
}


