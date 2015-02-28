
Car myCar1;
Car myCar2;
Car myCar3;

void setup() {
  size(800,800);
  myCar1 = new Car(random(0, width), random(0, height)); 
  myCar2 = new Car(random(0, width), random(0, height));
  myCar3 = new Car(random(0, width), random(0, height));
}

void draw() {
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display(); 
  
  if ((myCar1.xpos > width) || (myCar1.xpos < 0)) {
    myCar1.bounce();
    myCar2.bounce();
    myCar3.bounce();
  }
    else if ((myCar2.xpos > width) || (myCar2.xpos < 0)) {
    myCar1.bounce();
    myCar2.bounce();
    myCar3.bounce();
    }
    else if ((myCar3.xpos > width) || (myCar3.xpos < 0)) {
    myCar1.bounce();
    myCar2.bounce();
    myCar3.bounce();
    }
   
  
    
}

class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Car(float startXpos, float startYpos) {
    c = color(random(50, 240), random(50, 240), random(50, 240));
    xpos = startXpos;
    ypos = startYpos;
    xspeed = random(1, 5);
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }

  void move() {
    xpos = xpos + xspeed;
    if ((xpos > width) || (xpos < 0)) {
      c = color(random(50, 240), random(50, 240), random(50, 240));
    }
  }
  
  void bounce() {
    xspeed = xspeed * -1;
  }
}


