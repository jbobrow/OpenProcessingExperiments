
color e = color(0,0,300);
float x = 100;
float y = 100;
float speed = 2;

void setup() {
  size(500,200);
}

void draw() {
  background(0);
  move();
  display();
}

void move() {
  y = y + speed;
  if (y > height) {
    y = 0;
  }
    x = x + speed;
  if (x > width) {
    x = 0;
  }
  
}

void display() {
  fill(e);
  ellipse(x,y,20,20);
  {
    rect(x+50,y+50,20,20);
  }
}

class Cagla {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Cagla() 
  {
    e=color(300);
    xpos=width/2;
    ypos=height/2;
    xspeed=2;
  }
  
  void display() {
    ellipseMode(BOTTOM);
    fill(e);
    ellipse(xpos,ypos,40,40);

  }
  
  void drive() {
    xpos=xpos+xspeed;
    if (xpos>width) {
      xpos=0;
      
    }
  }
}

