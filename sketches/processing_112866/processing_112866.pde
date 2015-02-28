
Stripe[] stripes = new Stripe[50];
SideStripe[] sidestripes = new SideStripe[100];

void setup() {
  size(400, 400);
  for (int i= 0; i<stripes.length; i++) {
    stripes[i] = new Stripe ();
  }
  for (int j= 0; j<sidestripes.length; j++) {
    sidestripes[j] = new SideStripe();
  }
}

void draw() {
  background(100);
    for (int j= 0; j<sidestripes.length; j++) {
    sidestripes[j].rollover(mouseY, mouseX);
    sidestripes[j].move();
    sidestripes[j].display();
  }
  for (int i= 0; i <stripes.length; i++) {
    stripes[i].rollover(mouseX, mouseY);
    stripes[i].move();
    stripes[i].display();
  }

}

class SideStripe {
  float y;
  float speed;
  float h;
  boolean mouse;

  SideStripe() {
    y=0;
    speed = random(0.5);
    h = random (10, 30);
    mouse = false;
  }

  void display () {
    if (mouse) {
      fill(255, 0, 0, 20);
    } 
    else {
      fill (180, 100);
    }

    noStroke();
    rect(0, y, width, h);
  }

  void move() {
    y += speed;
    if (y > height+20) y = -20;
  }

  void rollover(int my, int mx) {
    if (my > y && my< y +h) {
      mouse=true;
    } 
    else {
      mouse = false;
    }
  }
}

class Stripe {
  float x;
  float speed;
  float w;
  boolean mouse;

  Stripe() {
    x=0;
    speed = random(0.5);
    w = random (10, 30);
    mouse = false;
  }

  void display () {
    if (mouse) {
      fill(255, 0, 0, 100);
    } 
    else {
      fill (255, 100);
    }

    noStroke();
    rect(x, 0, w, height);
  }

  void move() {
    x += speed;
    if (x > width+20) x = -20;
  }

  void rollover(int mx, int my) {
    if (mx > x && mx< x +w) {
      mouse=true;
    } 
    else {
      mouse = false;
    }
  }
}



