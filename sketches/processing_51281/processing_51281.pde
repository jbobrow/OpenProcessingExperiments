
Car myCar;
Car myCar2;
Car myCar3;
Car myCar4;

StreetLine SL1;
StreetLine SL2;

color backGroundColor = color (89);

void setup() {
  size(400, 400);

  //instantiate 4 new instances of car at 4 specified positions with 4 specified sizes
  myCar = new Car(0, 330, 40, 20);
  myCar2 = new Car(0, 180, 60, 30);
  myCar3 = new Car(0, 28, 100, 10);
  myCar4 = new Car(0, 60, 50, 30);

  //instantiate 2 new instances of StreetLines and their y-locations.
  SL1 = new StreetLine(115);
  SL2 = new StreetLine(250);

  smooth();
  frameRate(30);
}

void draw() {
  background(backGroundColor);

  //displays Cars
  myCar.display();
  myCar2.display();
  myCar3.display();
  myCar4.display();

  //moves Cars at different speeds
  myCar.move(10);
  myCar2.move(-5);
  myCar3.move(-8);
  myCar4.move(2);

  //display StreetLines and give them dimensions
  SL1.display(40, 10);
  SL2.display(40, 10);
}

//if "c" is pressed on the keyboard the background color changes to a random colorcc
void keyPressed() {
  if (key == 'c'){
  backGroundColor = color (random(255),random(255),random(255));
  }
}



