
// Michelle Philpott
//PS 3 - question 2 

//-----------------------------------

Ball[] ball= new Ball[25];
Button button;

//------------------------------------
void setup() {
  size(600, 600);
  smooth();
  button= new Button(400, 100, 75, 75);

  for (int i = 0; i < ball.length; i = i + 1) {
    ball[i] = new Ball (2, 0.1);
  }
}

void draw() {
  background (60);
  button.display();

  for (int i = 0; i <  ball.length; i = i + 1) {
    ball[i].display();


    if (button.animate() == false) {
      ball[i].drop();
    }
  }
}

void mousePressed() {
  button.click();
}

//---------------------------------

class Ball {
  float x;
  float y;
  float speed;
  float gravity;
  float dia;
  

  boolean animate = true;

  Ball (float y, float gravity) {
    this.y = y;
    this. gravity = gravity;
    dia = random(30,150);
    x = random(width);
    speed = map(dia, 30, 175, 0, 5);
  }
  
  //drop function loop of the balls
  void drop () {
    y = y + speed;
    speed = speed + gravity;

    if ( y >= height - 50) {
      speed = speed * -0.70;
    }
  }
    //display function of the balls
    void display () {
      fill(255);
      ellipse(x, y, dia/2, dia/2);
    }
  }

  //------------------------------------------------------
  //declare class button
  class Button {

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
    
    //display function of the buttone
    void display() {
      if (animate == true) {
        fill(128);
      }
      rect(btnX, btnY, btnW, btnH);
    }
    
    //boolean function for when the button is clicked
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

