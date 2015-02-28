

Stripe[] stripes=new Stripe[10];

int counter;

void setup() {
  size(400,300);
  for (int i=0;i<stripes.length; i++) {
    stripes[i]=new Stripe();
  }
}


 void draw() {
  background(0);
  
  for (int i=0; i<stripes.length; i++) {
    stripes[i].rollover(mouseX,mouseY);
    stripes[i].move();
    stripes[i].display();
  }
}

class Stripe {
  float x;
  float speed;
  float w;
  boolean mouse;
  
  Stripe() {
    x=0;
    speed=random(1);
    w=random(10,30);
    mouse=false;
  }
  
  void display() {
    if (mouse) {
      fill(210,15,214);
    } else {
      fill(28,13,178);
    }
    noStroke();
    rect(x,0,w,height);
  }
  
  void move() {
    x+=speed;
    if (x>width+20) x=-20;
  }
  
  void rollover(int mx, int my) {
    if (mx>x && mx<x+w) {
      mouse=true;
    }else{
      mouse=false;
    }
  }
}

