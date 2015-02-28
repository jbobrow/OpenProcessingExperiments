
Car firstCar;
Car secondCar;
Car thirdCar;

int xDir = 1;

void setup() {
  background(255);
  size(500,300);
  firstCar = new Car(random(5, (width/2)),50,random(1,3)); 
  secondCar = new Car(random(5, (width/2)),150,random(1,3));
  thirdCar = new Car(random(5, (width/2)),200,random(1,3));
}

void draw() {
  background(255);
   if ((firstCar.xPos <= 0 + (firstCar.carWidth)/2) || (firstCar.xPos >= (width- (firstCar.carWidth)/2))){
    xDir = -xDir;
    firstCar.colorChange();
   }
   if ((secondCar.xPos <= 0 + (secondCar.carWidth)/2) || (secondCar.xPos >= (width - (secondCar.carWidth)/2))){
    xDir = -xDir;
    secondCar.colorChange();
   }
   if ((thirdCar.xPos <= 0 + (thirdCar.carWidth)/2) || (thirdCar.xPos >= (width - (thirdCar.carWidth)/2))){
    xDir = -xDir;
    thirdCar.colorChange();
   }
  firstCar.move(xDir);
  secondCar.move(xDir);
  thirdCar.move(xDir);
  firstCar.display();
  secondCar.display();
  thirdCar.display(); 
}
class Car { 
  float xPos;
  float ypos;
  float xSpeed;
  int carWidth = 20;
  int carHeight = 10;
  int carColor = color(random(255),random(255),random(255));

  Car(float tempxPos, float tempYpos, float tempxSpeed) {
    xPos = tempxPos;
    ypos = tempYpos;
    xSpeed = tempxSpeed;
  }

  void display() {
    stroke(0);
    fill(carColor);
    rectMode(CENTER);
    rect(xPos,ypos,carWidth,carHeight);
  }

  void move(int direction) {
    xPos = xPos + (xSpeed*xDir);
    }
  void colorChange(){  
      carColor = color(random(255),random(255),random(255));
    }
  }





