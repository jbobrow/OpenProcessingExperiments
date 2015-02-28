
class SuperCar extends Car {
  void move() {
    super.move();
    x+=(mouseY-y)/50;

  
  }
}

