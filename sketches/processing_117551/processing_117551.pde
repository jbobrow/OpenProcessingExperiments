
// Learning Processing Example 9-9.

final int NUMBER_OF_CARS = 100;

Car[] cars = new Car[NUMBER_OF_CARS];

void setup() {
  size(200, 200);
  generateTraffic();
}

void draw() {
  background(200);
  drawTraffic();
}

void generateTraffic() {
  for (int i = 0; i < NUMBER_OF_CARS; ++i) {
    cars[i] = new Car(color(i * 2), 0, i * 2, i / 20.0);
  }
}

void drawTraffic() {
  for (int i = 0; i < NUMBER_OF_CARS; ++i) {
    cars[i].move();
    cars[i].display();
  }

}

// A simple car class.
class Car {

  color c;
  float x;
  float y;
  float speed;

  public Car() {
    c = color(100);
    x = 0;
    y = height / 2;
    speed = 1;
  }

  public Car(color c, float x, float y, float speed) {
    this.c = c;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  void display() {
    rectMode(CENTER);
    stroke(0);
    fill(c);
    rect(x, y, 20, 10);
  }

  void move() {
    x += speed;
    if (x > width) x = 0;
  }

}
