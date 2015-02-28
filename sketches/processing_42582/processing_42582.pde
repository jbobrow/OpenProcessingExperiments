
Car myCar1;
Car myCar2;
Car myCar3;

void setup() {
  size(500, 500);
  myCar1=new Car(color(255, 0, 0), 50, 5,90);
  myCar2=new Car(color(0, 0, 255), 150,10,60);
  myCar3=new Car(color(255, 255, 0), 400, 8,150);
}

void draw() {
  background(0);
  myCar1.move();
  myCar1.bounce();
  myCar1.display();
  myCar2.move();
  myCar2.bounce();
  myCar2.display();
  myCar3.move();
  myCar3.bounce();
  myCar3.display();
}

class Car {
  color c;
  float x;
  float y;
  float thesize;
  float x_speed;

  Car(color C, float Y, float X_speed, float S) {
    c=C;
    x=0;
    y=Y;
    x_speed=X_speed;
    thesize=S;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(x, y, thesize, thesize/2);
    fill(255);
    ellipse(x-thesize/4,y+thesize/4,thesize/4,thesize/4);
    ellipse(x+thesize/4,y+thesize/4,thesize/4,thesize/4);
  }

  void move() {
    x=x+x_speed;
  }
  void bounce(){
    if (x>width||x<0) {
      x_speed = x_speed * -1;
    }
  }
}
                                
