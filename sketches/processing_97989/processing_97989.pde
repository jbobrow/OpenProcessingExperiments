
Bike newBike;
void setup() {
  size(500, 700);
  newBike = new Bike();
}

void draw() {
  background(150);
  noStroke();
  fill(0, 255, 0);
  rect(0, 0, 80, 700);
  rect(420, 0, 500, 700);
  newBike.display();
}

class Bike{
  PImage bike;
  int y;
  int w;
  int h;

  Bike(){
    bike=loadImage("bike.png");
    y=595;
    w=80;
    h=100;
  }

  void display() {
    image(bike, mouseX-40, y, w, h);
  }
}



