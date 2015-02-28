
class Car {
  PImage car;
  float carX;
  float carY;
  float carSpeed;
  float carSize=50;

  Car(float tempCarX, float tempCarY, float tempCarSpeed) {
    car=loadImage("car.png");
    carX=tempCarX;
    carY=tempCarY;
    carSpeed=tempCarSpeed;
  }
  void display() {
    image(car, carX, carY, carSize, carSize);
  }

  //use WASD keys to move car
  void animate() {
    if (keyPressed) {
      if (key=='w') {
        image(car, carX, carY, carSize, carSize);
        carY=carY-carSpeed;
      }
      if (key=='s') {
        image(car, carX, carY, carSize, carSize);
        carY=carY+carSpeed;
      }
      if (key=='a') {
        image(car, carX, carY, carSize, carSize);
        carX=carX-carSpeed;
      }
      if (key=='d') {
        image(car, carX, carY, carSize, carSize);
        carX=carX+carSpeed;
      }
      if (carX<0 || carX>600 || carY<0 || carY>600) {
        carX=width/2;
        carY=height-50;
      }
    }
  }
}


