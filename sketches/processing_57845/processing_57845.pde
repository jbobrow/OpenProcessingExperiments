
// Michelle Philpott
//PS 3 - question 1 

//-------------------------------------------------------
//declare ball and the button class
Ball ball;
Button button;

//--------------------------------------------------------
void setup() {
  size(600, 600);
  smooth();
  ball= new Ball(-75, 0, 0.1);
  button= new Button(400, 100, 75, 75);
}

void draw() {
  background (60);

  ball.display();
  button.display();

  if (button.animate() == false) {
    ball.drop();
  }
}

void mousePressed() {
  button.click();
}

//--------------------------------------------------------
//declare class Ball
class Ball {
  //declare variables
  float y;
  float speed;
  float gravity;

  boolean animate = true;

  Ball (float y, float speed, float gravity) {
    this.y = y;
    this.speed = speed;
    this. gravity = gravity;
  }

  //set a loop for the ball drop
  void drop () {
    y = y + speed;
    speed = speed + gravity;

    if ( y >= height - 50) {
      speed = speed * -0.85;
    }
  }

  //display of the ball
  void display () {
    fill(255);
    ellipse(width/4, y, 75, 75);
  }
}

//------------------------------------------------------
//declare class button
class Button {

  //declare variables
  int btnX;
  int btnY;
  int btnW;
  int btnH;
  boolean animate;
  boolean clicked;

  Button (int btnX, int btnY, int btnW, int btnH) {
    this.btnX = btnX;
    this.btnY = btnY;
    this.btnW = btnW;
    this.btnH = btnH;
  }
  //display of the button
  void display() {
    if (animate == true) {
      fill(128);
    }
    rect(btnX, btnY, btnW, btnH);
  }

  //create boolean loop
  void click() {
    if ( mouseX > btnX && mouseX < (btnX+btnW) && mouseY > btnY && mouseY < (btnY+btnH)) {
      animate = !animate;
    }
    else {
      animate = false;
    }
    if (animate == true) {
      clicked = true;
    }
    else {
      clicked = false;
    }
  }

  boolean animate() {
    if ( clicked == true) { 
      return true;
    }
    else {
      return false;
    }
  }
}



