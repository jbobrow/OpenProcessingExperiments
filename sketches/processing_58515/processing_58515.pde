

color e = color(200,0,0);
float x = 100;
float y = 100;
float speed = 50;

void setup() {
  size(500,200);
}

void draw() {
  background(0);
  move();
  display();
}

void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
  y= y+ speed;
  if(y>height) {
    y=0;
  }
}

void display() {
  fill(e);
  ellipse(x,y,20,20);
  fill(0,200,0);
  ellipse(x*2,y*2,30,30);
  fill(0,0,200);
  ellipse(x+50,y+50,10,10);
}

class Ebru {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Ebru() {
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


