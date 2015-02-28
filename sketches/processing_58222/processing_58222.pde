
Button button;
int btnX = 260;
int btnY = 50;
int btnW = 80;
int btnH = 80;
boolean animate = true;
//---------------------------------------------------------------

void setup() {
  size(400, 500);
  smooth();
  button = new Button();
}

void draw() {
  background(64);
  button.ball();
  button.button();
  button.operate();
}
//---------------------------------------------------------------
class Button {
 

  float y;
  float speed;
  float gravity;
  color b;
  color c;

  Button() {
    y = -100;
    speed = 0;
    gravity = 0.1;
    b = color(136, 239, 250);
    c = color(247, 165, 242);
    
  }
//---------------------------------------------------------------

  void button () {
    fill(b);
    rect(btnX, btnY, btnW, btnH);
  }

  void ball() {
    fill(c);
    ellipse(width/4, y, 50, 50);
  }

  void operate() {
    if ( animate==true) {
      y = y + speed;
      speed = speed + gravity;
    }
    if ( y > height - 100) {
      speed *= - 0.9;
    }
  }
}
//---------------------------------------------------------------
void mousePressed() {
  if ( mouseX > btnX && mouseX < (btnX+btnW) 
    && mouseY > btnY && mouseY < (btnY+btnH)) {

    if (animate == true) {
      animate = false;
    }
    else {
      animate = true;
    }
  }
}



