
Car myCar1;
Car myCar2;
Car myCar3;

float r;
float g;
float b;
float a;


void setup() {
  size(600,600);
  myCar1= new Car(color(255) ,50,75, random(1,20));
  myCar2 = new Car(color(255) ,50,200, random(2,20));
  myCar3 = new Car(color(255) ,50,300, random(3,20));

}

void draw() {
  background(155);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
}



class Car { 
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

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }

  void move() {
    xpos = xpos + xspeed;
    if(xpos > width-10 || xpos < 0+10) {
      myCar1.xspeed = myCar1.xspeed * -1;
      myCar2.xspeed = myCar2.xspeed * -1;
      myCar3.xspeed = myCar3.xspeed * -1;
      int r = int(random(0,255));
      int g = int(random(0,255));
      int b = int(random(0,255));
      c = color(r,g,b);

    }
  }
}


