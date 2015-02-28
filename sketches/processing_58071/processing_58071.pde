
//Problem Set 3
//Question 2
//Natalie DeCoste 

float speed = 2;
float gravity = 0.3;

Ball[] a = new Ball[25];
Button b;

void setup() {
  size(400, 500);
  smooth();
  for (int x =0; x < a.length; x++) {
    a [x] = new Ball (random(width), random (height-100));
    b = new Button (250, 50, 100, 100, 0);
  }
}
void draw() {
  background(64);
  for (int i=0; i < a.length; i++) {
    a[i].drawball();
    if (b.animate()==false) {
      a[i].drop();
    }
    b.display();
  }
}

void mousePressed() {
  b.click();
}
class Ball {
  float x;
  float y;
  float shade;
  float speed;
  float dia;

  Ball(float x, float y) {

    this.x = x;
    this.y = y;

    shade =map(speed, 0.4, 2, random(0), random(200));
    speed = random (0.1, 3);
    dia = map(speed, 0.1, 3, 30, 100);
    gravity = 0.1 ;
  }

  void drawball () {
    fill (31, 155, 219);
    ellipse(x, y, dia, dia);
  }

  void drop() { 
    y = y + speed;
    speed = speed + gravity;
    if (y >= height) {
      speed =-0.9 * speed;
    }

    speed = speed + gravity;
  }
}

class Button {
  int btnx;
  int btny;
  int btnw;
  int btnh;
  color c;
  boolean animate;
  boolean pressed;

  Button(int btnx, int btny, int btnw, int btnh, color c) {
    this.btnx = btnx;
    this.btny = btny;
    this.btnw = btnw;
    this.btnh = btnh;
    this.c = c;
  }
  void display() {
    fill (c);
    rect(btnx, btny, btnw, btnh);
  }
  
  void click() {
    if ( mouseX > b.btnx && mouseX < b.btnx+btnw && mouseY > b.btny && mouseY < b.btny+btnh) {
      animate = !animate;
    }
    if (animate == true) {
      pressed = true;
    }
    else { 
      pressed = false;
    }
  }
  boolean animate () {
    if (pressed==true) {
      return true;
    }
    else { 
      return false;
    }
  }
}


