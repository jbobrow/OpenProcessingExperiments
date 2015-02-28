
Zoog myZoog;

void setup() {
  size(200,200); //size of the canvas
  smooth();
  frameRate(50);

  // Initialize Zoog object
  myZoog = new Zoog();
}

void draw() {
  background(0,255,0);
  // Operate Zoog object.
  myZoog.move();
  myZoog.display();
}

class Zoog {

  color c;
  float xpos;
  float ypos;
  float xspeed;

  Zoog() {
    c = color(255);
    xpos = width/2;
    ypos = height/2;
    xspeed = 1;
  }

  void display() {
    // The Zoog is just a square
    rectMode(CENTER);
    fill(c);
    rect(xpos,ypos,100,100); //body
    rect(xpos,ypos-75,50,50); //head
    line(xpos-15,ypos-60,xpos+15,ypos-60); //mouth
    fill(0);
    rect(xpos-10,ypos-80,10,10); //left eye
    rect(xpos+10,ypos-80,10,10); //right eye
    line(xpos-85,ypos+10,xpos-50,ypos-20); //left arm
    line(xpos+75,ypos+10,xpos+50,ypos-20); //right arm
    line(xpos-25,ypos+50,xpos-25,ypos+90); //left leg
    line(xpos+25,ypos+50,xpos+25,ypos+90); //right leg
  }

  void move() {
    xpos = xpos + xspeed; //makes body move
    if (xpos > width) {
      xpos = 0;
    }
  }
}

