
// main code starts here
Car redCar, blueCar, pinkCar;

void setup() {
  size(200,200);
  redCar = new Car(#F50A0A, 10, 40, 1);
  blueCar = new Car(#1540AA, 2, 80, 0.5);
  pinkCar = new Car(#FCC4F6, 20, 170, 1.3);
}

void draw() {
  background(255);
   redCar.drive();redCar.display();
   pinkCar.drive(); pinkCar.display();
   blueCar.drive(); blueCar.display();
  

}

class Car{
  color c ;
  float x ;
  float y ;
  float speed;
  float wheel = 5;

  //constructor defined
  Car(color carColor, float xPos, float yPos, float s){
    c = carColor;
    x =xPos;
    y = yPos;
    speed = s;
  }

  void drive(){
    x = x + speed;
    if (x > width){
      x = 0;
    }
  }
  
  void display(){
    noStroke();
    rectMode(CENTER);
    fill (c);
    rect(x, y, 20,10);
    rect(x-3,y-6, 12,5);
    ellipseMode(CORNER);
    ellipse(x+2,y+4,wheel,wheel);
    ellipse(x-7,y+4,wheel,wheel);

  }
}




