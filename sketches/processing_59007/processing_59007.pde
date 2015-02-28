
//-----------------------------------
 
Ball[] ball= new Ball[25];
Button button;
 
//------------------------------------
void setup() {
  size(600, 600);
  smooth();
  button= new Button(400, 100, 75, 75);
 
  for (int i = 0; i < ball.length; i = i + 1) {
    ball[i] = new Ball (4, 0.3);
  }
}
 
void draw() {
  background (0);
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
    this.dia = random(10,300);
    this.x = random(width);
    this.speed = map(dia, 130, 17, 20, 65);
  }
   
  //drop function loop of the balls
  void drop () {
    this.y = this.y + this.speed;
    this.speed = this.speed + this.gravity;
 
    if ( y >= height) {
      this.speed *= -0.80;
      this.y = height-1;
    }
  }
    //display function of the balls
    void display () {
      fill(55,5,100);
      ellipse(this.x, this.y, this.dia/2, this.dia/2);
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
        fill(55,200,100);
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


