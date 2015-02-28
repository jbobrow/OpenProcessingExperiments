
//Problem Set 3
//Question 1
//Karen Wan


float speed = 5;
float gravity = 0.1;
  
ball a;
button b;
void setup() {
  size(400,400);
  smooth();
  a = new ball(50,30,30,30);
  b = new button(200,50,30,50,0);
}
  
void draw() {
  background (255);
  a.display();
  b.display();
    
  if (b.on()==false) {
  a.drop();
}
}
  void mousePressed() {
    b.click();
  }
class ball {
  float x;
  float y;
  float dia;
  float c;
ball(float x,float y,float dia,color c) {
  this.x = x;
  this.y = y;
  this.dia = dia;
  this.c = c;
}
void display() {
  ellipse(x,y,dia,dia);
  fill(c);
}
  
void drop() {
    y = y + (int)speed;
    speed = speed + gravity;
  
    if (y >= height) {
      speed = -0.9 * speed;
    }
    speed = speed + gravity;
  }
}
class button {
  int btnx;
  int btny;
  int btnw;
  int btnh;
  boolean on;
  boolean pressed;
  
  button(int btnx, int btny, int btnw, int btnh, color c) {
    this.btnx = btnx;
    this.btny = btny;
    this.btnw = btnw;
    this.btnh = btnh;
  }
  
  void display() {
    noStroke();
    fill(222,32,123);
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


