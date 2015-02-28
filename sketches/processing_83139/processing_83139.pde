
int e;
Car bmw[] = new Car[100]; 


//__________SETUP_________

void setup () {
  size(400, 400); 


//frameRate(100);
  for (int i=0; i < bmw.length; i++) {
    int ranX = int(random(width));
    int ranY = int(random(height));
    int ranS = int(random(1, 5));
    bmw[i] = new Car(ranX, ranY, ranS);

    bmw[i].ColorCar(int(random(255)), int(random(255)), int(random(255)));
  }
}


//---------DRAW----------

void draw() {
  background(0); 

  for (int i=0; i < bmw.length; i++) {

    bmw[i].drive();
    bmw[i].display();
    //bmw[i].ColorCar(int(random(255)), int(random(255)), int(random(255)));
  }
}

//_________Klasse____________
class Car {

  int posX;
  int posY;
  int speed;
  color colorC = (255);

  Car(int getX, int getY, int getS) {
    posX = getX; 
    posY = getY;
    speed = getS;
  }


  //________Anzeigen_______

  void display() {
    fill(colorC);
    rect(posX, posY, 50, 20);
  }

  //________Fahren_________
  void drive() {
    if (posX >= width) {
      posX = -50;
    }
    else {
      posX+=speed;
    }
  }

  void ColorCar(int r, int g, int b) {
    colorC = color(r, g, b);
  }
}


//_________Klasse____________
class Car {

  int posX;
  int posY;
  int speed;
  color colorC = (255);

  Car(int getX, int getY, int getS) {
    posX = getX; 
    posY = getY;
    speed = getS;
  }


  //________Anzeigen_______

  void display() {
    fill(colorC);
    rect(posX, posY, 50, 20);
  }

  //________Fahren_________
  void drive() {
    if (posX >= width) {
      posX = -50;
    }
    else {
      posX+=speed;
    }
  }

  void ColorCar(int r, int g, int b) {
    colorC = color(r, g, b);
  }
}
