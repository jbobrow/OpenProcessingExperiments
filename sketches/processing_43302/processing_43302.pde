
Fly myFly;
Fly myFly2;
Fly myFly3;
Fly myFly4;
Fly myFly5;
Fly myFly6;
PImage ima4;

void setup() {
  size(800,500);
  myFly= new Fly(random(width), random(height), 8, 70);
  myFly2= new Fly(random(width), random(height), 5, 70);
  myFly3= new Fly(random(width), random(height), 5, 70);
  myFly4= new Fly(random(width), random(height), 9, 70);
  myFly5= new Fly(random(width), random(height), 7, 75);
  myFly6= new Fly(random(width), random(height), 5, 70);
}

void draw() {
  background(197,220,222);
  ima4=loadImage("hand1.png");
  image(ima4, mouseX-150, height-380);
  myFly.move();
  myFly.bounce();
  myFly.display();
  myFly2.move();
  myFly2.bounce();
  myFly2.display();
  myFly3.move();
  myFly3.bounce();
  myFly3.display();
  myFly4.move();
  myFly4.bounce();
  myFly4.display();
  myFly5.move();
  myFly5.bounce();
  myFly6.move();
  myFly6.bounce();
  myFly6.display();
}

class Fly {
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float Flysize;
  PImage ima;
  //PImage ima2;
  PImage ima3;

  Fly(float tempXpos, float tempYpos, float tempXspeed, float s) {
    xpos=tempXpos;
    ypos=tempYpos;  
    xspeed=tempXspeed;
    yspeed=tempXspeed;
    Flysize=s;
    ima=loadImage("fly.png");
    //ima2=loadImage("fly2.png");
    ima3=loadImage("fly3.png");
  }

  void move() {
    xpos += xspeed;
    ypos += yspeed;
  }

  void bounce() {
    if ((xpos>=width) || (xpos<=0)) {
      xspeed=xspeed*-1;
    }
    if ((ypos>=height) || (xpos<=0)) {
      yspeed=yspeed*-1;
    }
  }

  void display() {
    image(ima, xpos, ypos, Flysize, Flysize);
    //image(ima2, xpos+200, ypos+100, Flysize, Flysize);
    image(ima3, xpos-200, ypos-100, Flysize, Flysize);
  }
}


