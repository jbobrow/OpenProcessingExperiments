
//Problem Set 3
//Question 2
//Karen Wan
  
ball[] a= new ball[25];
button button;
float speed =3;
float gravity = 0.1;
  
void setup () {
  size(400,400);
  smooth();
 
  
  for (int x=0; x < a.length; x++) {
  a[x] = new ball( random(width), random(height-1000));
  }
  color c= color(33, 25, 125);
  button= new button ( 40, 123, 20, 20, 23);
}
  
void draw () {
  background(255);
  for (int x=0; x < a.length; x++) {
    a[x].drawball() ;
    if (button.on()==false) {
      a[x].drop();
    }
    button.display();
  }
}
void mousePressed() {
  button.click();
}
  
class ball {
  float x;
  float y;
  float cc;
  float dia;
  float speed;
  ball (float x, float y) { 
    this.x = x;
    this.y = y;
  
    speed = random(0.1,3); 
    gravity = 0.1;
    dia = map(speed, 0.1,3,5,20);
    cc = map(speed,0.1,3,random(0), random(225));
  }
  
  void drawball () {
   fill(cc-220,cc-143,cc-42);
    stroke(5);
    ellipse(x, y, dia, dia);
  }
  
  void drop () {
     y += speed;
     speed = speed + gravity;
    if (y >= height) {
      speed *= -0.9;
    }
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
    if (mouseX > button.btnx && mouseX < button.btnx+btnw && mouseY > button.btny && mouseY < button.btny+btnw) {
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



