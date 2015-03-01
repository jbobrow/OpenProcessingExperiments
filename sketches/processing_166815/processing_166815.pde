
ArrayList<Car> carList = new ArrayList();
Car car;
void setup() {
  size(300, 500);
  car = new Car(width/2, height/2);
  for (int i=0; i<6; i++) {
    int kx = (int)random(6);
    int ky = (int)random(5);
    Car P = new Car(20+40*kx, 60*ky);
    carList.add(P);
  }
}

void draw() {
  background(240);
  grid();
  if (left)car.x-=2;
  if (right)car.x+=2;
  car.show(#FFC800);
  showCar();
  checkCollision();
}

void showCar() {
  for (int i=0; i<carList.size (); i++) {  
    Car C = carList.get(i);
    C.show(200);
  }
}

void checkCollision() {
  for (int i=0; i<carList.size (); i++) {  
    Car C = carList.get(i);
    C.move();
    if (dist(C.x, C.y, car.x, car.y)<30) {
      fill(#FF0059);
      textSize(20);
      textAlign(CENTER);
      text("GAME OVER!", car.x, car.y);
    }
    if (C.y>height/2+60) {
      int kx = (int)random(9);
      if (carList.size()<6) {
        Car P = new Car(20+40*kx, -60);
        carList.add(P);
      }
    }
    if (C.y>height) carList.remove(i);
  }
}

void grid() {
  for (int x=0; x<width; x+=10) {
    for (int y=0; y<height; y+=10) {
      if (x==width/2 && y%4==0)fill(0,20);
      else fill(100, 10);
      stroke(0, 10);
      rect(x, y, 10, 10);
    }
  }
}
boolean right=false, left=false;
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) left = true;
    if (keyCode == RIGHT)right = true;
  }
}

void keyReleased()
{
  right = false;
  left = false;
}


