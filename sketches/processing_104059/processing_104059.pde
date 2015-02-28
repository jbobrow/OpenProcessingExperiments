
class Car {
  color c;
  float x;
  float y;
  float speed;
  int name;
  Car (color superc, float superx, float supery, float superspeed, int n) {

    c = superc;
    x = superx;
    y = supery;
    speed = superspeed;
    name = n;
  }

  void display () { 
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(x, y, 30, 20);
  }
  boolean isFinished() {
    if (x >= width) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    x = x + speed;
    if (x > width) {
      x = width;
    } else if (x < 0) {
      x = width;
    }
  }
}


//Car myCar;
//Car Car2; 
//Car Car3;

final int NEW_CARS = 5;
Car[] carList = new Car[NEW_CARS];
int winningCar = -1;

void setup () {
  size(400, 400);
  for (int i = 0; i < NEW_CARS; ++i) {
    carList[i] = new Car(color(0,150,200), 20, i *60 + 60, random (1, 10), i + 1);
  }
  
  //myCar = new Car (color(255, 0, 0), 0, 300, random(1,5);
  //Car2 = new Car (color(0, 255, 0), 0, 250, random(1,5)); 
  //Car3 = new Car (color(0, 0, 255), 0, 120, random(1,5);
}

void draw () {
  background (255);
  for (int i = 0; i < NEW_CARS; ++i) {
    //carList[i] = new Car(color(255,0,0), 20, i * 30 + 50, random (1, 10));
    
    carList[i].move();
    carList[i].display();
    if(carList[i].isFinished() && winningCar ==-1) {
      winningCar = carList[i].name;
    }
     
    
  }
  
  println (winningCar);
  if (winningCar != -1) {
    textSize(50);
    text("Car" + winningCar + "Won!!", 100, 50);
  }

     
  //myCar.display();
  //Car2.display(); 
  //myCar.move();
  //Car2.move();
  //Car3.move();
  //Car3.display();
}
