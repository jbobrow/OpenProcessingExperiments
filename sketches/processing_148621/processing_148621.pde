
rectangle Shape1;
rectangle Shape2;
rectangle Shape3;
rectangle Shape4;
rectangle Shape5;

void setup() {
  size(250,250);
  Shape1 = new rectangle(color(255,0,0),25,0,1); 
  Shape2 = new rectangle(color(220,0,0),75,0,2);
  Shape3 = new rectangle(color(180,0,0),125,0,3);
  Shape4 = new rectangle(color(140,0,0),175,0,4);
  Shape5 = new rectangle(color(100,0,0),225,0,5);
}

void draw() {
  background(0,200,0);
  Shape1.move();
  Shape1.display();
  Shape2.move();
  Shape2.display();
  Shape3.move();
  Shape3.display();
  Shape4.move();
  Shape4.display();
  Shape5.move();
  Shape5.display();
}

class rectangle { 
  color c;
  float xpos;
  float ypos;
  float yspeed;
  
  rectangle(color tempC, float tempXpos, float tempYpos, float tempYspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempYspeed;
  }
  void display() {
    stroke(1);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,25,25);
  }

  void move() {
    ypos = ypos + yspeed;
    if (ypos > height) {
      ypos = 0;
    }
  }
}



