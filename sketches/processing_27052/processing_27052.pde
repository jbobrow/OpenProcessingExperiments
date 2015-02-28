
Bug myBug1;
Bug myBug2;
Bug myBug3;
Bug myBug4;
Bug myBug5;

void setup() {
  size(700,400);
  myBug1 = new Bug(color(255,0,0),0,100,2); 
  myBug2 = new Bug(color(0,0,255),0,10,1);
  myBug3 = new Bug(color(0,255,0),0,50,4);
  myBug4 = new Bug(color(225,85,0),0,40,15);
  myBug5 = new Bug(color(0,0,0),0,40,8);
}

//Call Functions "draw" and "display"
void draw() {
  background(255);
  myBug1.drive();
  myBug1.display();
  myBug2.drive();
  myBug2.display();
  myBug3.drive();
  myBug3.display();
  myBug4.drive();
  myBug4.display();
  myBug5.drive();
  myBug5.display();
}

//Constructor, Global Variables
class Bug { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Bug(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  //Functions
  void display() {
    float angle = 0.0;
    angle += 0.1;

    stroke(0);
    smooth();
    fill(mouseX,255,mouseY);
    rotate(angle);
    rectMode(CENTER);
    ellipse(xpos,ypos,20,10);
    line(xpos+8,ypos-4,xpos+10,ypos-8);
    line(xpos+8,ypos+4,xpos+10,ypos+8);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width+50) {
      xpos = 0;
    }
    xpos += random(-xspeed, xspeed);
    ypos += random(-xspeed, xspeed);
  }
}


