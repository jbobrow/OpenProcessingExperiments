
Car myRedCar;
Car myBlueCar;
Car myGreenCar;

void setup() {
  size(300, 300);
  background(0);
  smooth();
  myRedCar= new Car( 0, 120, #B42626, 1);
  myBlueCar=new Car(width-30, 180, #2D40E0, -2);
  myGreenCar=new Car(width-30, 220,#315A0C, -1.5);
}

void draw() {
  background(0);
  midLine(height/2-3, height/2+2);
  dashLine(height/2-50, height/2+50);
  greenPart();
  myRedCar.move();
  myRedCar.display();
  myBlueCar.move();
  myBlueCar.display();
  myGreenCar.move();
  myGreenCar.display();
}

void midLine(int y1, int y2) {
  fill(#FF9C21);
  noStroke();
  rect(0, y1, width, 2);
  rect(0, y2, width, 2);
}

void dashLine(int y3, int y4) {
  noStroke();
  fill(255);
  for (int i =0;i<7;i++) {
    float dashLineX = lerp(0, width, i/7.0);
    rect(dashLineX, y3, 25, 3);
    rect(dashLineX, y4, 25, 3);
  }
}

void greenPart() {
  noStroke();
  fill(#18270B);
  rect(0, 0, width, 50);
  rect(0, height-50, width, 50);
}

class Car {
  float x, y;
  color c;
  float speed;


  Car(float posx, float posy, color temp_c, float temp_speed) {
    x= posx;
    y= posy;
    c= temp_c;
    speed = temp_speed;
  }

  void move() {
    x+=speed;
    if (x>width) {
      x=-30;
    }
    if (x<-30) {
      x=width;
    }
  }

  void display() {
    fill(c);
    stroke(0);
    rect(x, y, 30, 12, 3);
    rect(x+8, y, 14, 12, 3);
  }
}



