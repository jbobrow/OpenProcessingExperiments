
//PS3 Q1
//Kim Sipkens
 
float speed = 4;
float gravity = 0.2;
 
ball a;
button b;
void setup() {
  size(400,400);
  smooth();
  a = new ball(250,50,50,50);
  b = new button(40,20,100,100,0);
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
 
  void display() {
    fill(c);
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


