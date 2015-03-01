
Car myCar1;
Car myCar2;
Car myCar3; 



void setup() {
  size(600,600);
  myCar1 = new Car(color(255),100,50); 
  myCar2 = new Car(color(255),200,50);
  myCar3 = new Car(color(255),300,50);
}

void draw() {
  background(150);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  
  if (myCar1.xpos > width || myCar1.xpos <0 ||
      myCar2.xpos > width || myCar2.xpos <0 ||
      myCar3.xpos > width || myCar3.xpos <0 ) {
      myCar1.xspeed = myCar1.xspeed*-1;
      myCar2.xspeed = myCar2.xspeed*-1;
      myCar3.xspeed = myCar3.xspeed*-1;
}
  
  
}

class Car { 
  float xpos;
  float ypos;
  int xspeed = (int)random(1,10);
  int r = 255;
  int g = 255;
  int b = 255;
  color c;


  Car( color tempC, float tempYpos, float tempXpos) {
    c = tempC;
    ypos = tempYpos;
    xpos = tempXpos;
  }

  void display() {
    if (xpos > width || xpos < 1){
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
    }
    fill(r,g,b);
    rect(xpos,ypos,20,15);
     
  }
   
  void move() {
    xpos = xpos + xspeed;
    }
    
}


