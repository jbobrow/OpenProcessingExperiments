
PImage bg;
Robot robot;

void setup(){
  size (600, 600);
  bg = loadImage("Forest.jpg");
  robot = new Robot();
}

void draw (){
bg.resize(1000,1000);
  background (bg);
  
  robot.move();
  robot.display();
  robot.boundary();
  
}
class Robot {
  PImage head;
  PImage body;

  int x, y;
  int r;
  int speed;
  
  Robot() {
    head = loadImage("head.png");
    body = loadImage("body.png");
    x = width/2;
    y = height/2;
    speed = 4;
    r = 40;
  }

  Robot(int x, int y) {
    head = loadImage("robot_head.jpg");
    body = loadImage("body.jpg");
    speed = 4;
    r = 40;
  }

  void move() {
    if (keyPressed) {
      if (keyCode == UP) {
        y-=speed;
      }
    }

    if (keyPressed) {
      if (keyCode == DOWN) {
        y+=speed;
      }
    }
    if (keyPressed) {
      if (keyCode == RIGHT) {
        x+=speed;
      }
    }
    if (keyPressed) {
      if (keyCode == LEFT) {
        x-=speed;
      }
    }
  }

  void boundary() { //so that spaceship can't leave playing field
    if (x<r/2) {
      x = r/2;
    }
    if (x>width-(r/2)) {
      x = width-(r/2);
    }
    if (y<r/2) {
      y = r/2;
    }
    if (y>height-(r/2)) {
      y = height - (r/2);
    }
  }

  void display() {
    rectMode(CENTER);
    imageMode(CENTER);
    
    image (head,x,y-90);
    image (body,x-10,y+30);
  }
}




