
//Problem Set 3.2
//by: Nathan Smofsky

float speed = 2;
float gravity = 0.3;

ball b;
button btn;
ball[] balls = new ball[25];


//--------------------------------------

void setup() {
  size(500, 500);
  smooth();

  btn = new button(350, 50, 50, 50, 0);
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new ball((random(width)), (random(height)), random(10, 50), random(255));
  }
}

//--------------------------------------

void draw() {
  background(0, 200, 50);
  btn.display();

  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
    if (btn.on() == false) {
      balls[i].bounce();
    }
  }
}
void mousePressed() {
  btn.click();
}
//-----------------------------------------------------
class ball {

  float x;
  float y;
  float dia;
  float c;
  float speed;


  //----------------------------------
  ball(float x, float y, float dia, float c) {
    this.x = x;
    this.y = y;
    this.dia = dia;
    this.c = c;
    this.speed = map(this.dia, 0, 50, 0, 2);
  }

  void display() {
    fill(c);
    ellipse(x, y, dia, dia);
  }

  void bounce () {
    y = y + (int) speed;
    speed = speed + gravity;

    if (y >= height) {
      speed = -0.9 * speed;
    }
  }
}
//---------------------------------------------------
class button {

  int btnx;
  int btny;
  int btnw;
  int btnh;
  color c;
  boolean on;
  boolean pressed;
  //----------------------------------

  button(int btnx, int btny, int btnw, int btnh, color c) {
    this.btnx = btnx;
    this.btny = btny;
    this.btnw = btnw;
    this.btnh = btnh;
    this.c = c;
  }
  void display() {
    fill(c);
    rect(btnx, btny, btnw, btnh);
  }

  void click() {
    if (mouseX > btn.btnx && mouseX < btn.btnx+btnw && mouseY > btn.btny && mouseY < btn.btny+btnw) {
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


