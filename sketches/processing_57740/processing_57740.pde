
//PS3_QUESTION.1_KESHIA.KINGSLEY

float y = -100;
float speed = 0;
float gravity = 0.1;

boolean animate = true;
 
int btnX = 260;
int btnY = 50;
int btnW = 80;
int btnH = 80;
//----------------------------------------------

circle c;
button b;
void setup() {
  size(500, 500);
  smooth();
  
  c= new circle(250, 100, 100, 50);
  b= new button(25, 50, 50, 50, 50);
}

void draw() {
  background (255, 155, 45, 75);
 c.displaycircle();
 b.displaybutton();
 
 if (b.on()==false) {
   c.drop();
 }
}

void mousePressed() {
  b.click();
}

class circle {
  float x;
  float y;
  float dia;
  float c;
  circle(float x, float y, float dia, color c) {
    this.x= x;
    this.y= y;
    this.dia= dia;
    this.c= c;
  }
  
  void displaycircle() {
    ellipse(x, y, dia, dia);
    fill(c);
  }
  
  void drop() {
     if (animate == true) {
    y = y + speed;
    speed = speed + gravity;
    if (y >= height-120) {
      // reduce the speed on every bounce to make it more
      // realistic.. try -1 and see what happens
    speed *= -1; 
    }
  }
   
 
  }
}
//----------------------------------------------
class button {
  int btnx;
  int btny;
  int btnw;
  int btnh;
  color c;
  boolean on;
  boolean pressed;
   
   button(int btnx, int btny, int btnw, int btnh, color c) {
    this.btnx = btnx;
    this.btny = btny;
    this.btnw = btnw;
    this.btnh = btnh;
    this.c= c;
  }
 
  void displaybutton() {
    fill(35, 45, 244, 75);
    rect(btnx, btny, btnw, btnh);
  }
 
  
void click() {
  if (mouseX > b.btnx && mouseX < b.btnx+btnw && mouseY > b.btny && mouseY < b.btny+btnw) {
      on = !on;
    }
 
    if (on == true) {
      pressed = true;
    }
    else {
      pressed =false;
    }
  }
 
  boolean on() {
    if (pressed==true) {
      return true;
    }
  else {
    return false;
  }
 }
 
}



