
//practice

Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
Car myCar5;

void setup(){
  size(700,400);
  myCar1 = new Car(color(255,0,0),0,100,2);
  myCar2 = new Car(color(0,0,255),0,250,8);
  
  myCar3 = new Car(color(0,255,0),0,150,4);
  myCar4 = new Car(color(150,155,0),0,350,2);
  myCar5 = new Car(color(100,0,100), 0, 50, 6);
}

void draw(){
  background(255);
  myCar1.drive();
  myCar2.drive();
  myCar3.drive();
  myCar4.drive();
  myCar5.drive();
  
  
  myCar1.display();
  myCar2.display();
  myCar3.display();
  myCar4.display();
  myCar5.display();
  
}

class Car {
 
    //data for the class
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  
  //Constructor for the class
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed){
    c = tempC;
    xPos = tempXpos;
    yPos = tempYpos;
    xSpeed = tempXspeed;
  }
  
  //Functionality
  void display(){
    rectMode(CENTER);
    fill (c);
    rect(xPos, yPos, 20, 10);
    }
    
    void drive(){
      xPos = xPos + xSpeed;
      if (xPos > width){
        xPos = 0;
      }
     }
}

