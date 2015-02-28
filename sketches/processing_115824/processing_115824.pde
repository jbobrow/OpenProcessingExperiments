
Car myCar1;
Car myCar2;
Car myCar3;// Three objects

void setup() {
  size(200,200);
  myCar1 = new Car(color(255,0,0),0,100,2); //Three different cars with different colors and speeds.
  myCar2 = new Car(color(0,0,255),0,50,3);
  myCar3 = new Car(color(255,255,0),0,10,1);
}

void draw() { //draws cars and puts them on canvas
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
}

class Car { //template for cars
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() { //general aesthetics of car
    stroke(0);
    fill(c);
    rectMode(CENTER);
    ellipse(xpos,ypos,20,10);
  }

  void move() { //interactions for each car when they hit left and right canvas walls (colors change and speed changes in opposite direction)
    xpos = xpos + xspeed;
    if ((myCar1.xpos > width) || (myCar1.xpos < 0)) {
      c = color(random(10,75), random(60,200), random(40,155));
      xspeed = xspeed * -1;
    }
    xpos = xpos + xspeed;
    if ((myCar2.xpos > width) || (myCar2.xpos < 0)) {
      c = color(random(20,190), random(45,200), random(30,110));
      xspeed = xspeed * -1;
    }
    xpos = xpos + xspeed;
    if ((myCar3.xpos > width) || (myCar3.xpos < 0)) {
      c = color(random(25,255), random(50,200), random(75,175));
      xspeed = xspeed * -1;
    }
  }

}



