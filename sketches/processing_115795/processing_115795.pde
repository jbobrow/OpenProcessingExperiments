
Car car1;
Car car2;
Car car3;
  
void setup() {
  size(800, 600);
  car1 = new Car();
  car2 = new Car();
  car3 = new Car();
}
  
void draw() {
  background(255);
  car1.move();
  car1.display();
  car2.move();
  car2.display();
  car3.move();
  car3.display();
}


