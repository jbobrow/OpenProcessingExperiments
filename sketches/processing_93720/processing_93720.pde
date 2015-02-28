
//Wenda Lewis Teh
//Wk 8 Assignment
//Raining Cats and Dogs

PImage picturecat;
PImage picturedog;

int num = 50;
Rain [] cats = new Rain[num];
Rain [] dogs = new Rain[num];

void setup () {
  size(600, 600);
  for (int i = 0; i<num; i++) {
    cats[i]= new Rain(30+i*100, 120);
    dogs[i]= new Rain(i*100, 0);
  }
  picturecat = loadImage("cat.png");
  picturedog = loadImage("dog.png");
  smooth();
}

void draw () {
  background(255);
  for (int i = 0; i<num; i++) {
    cats[i].catDisplay();
    cats[i].imageMove();
    dogs[i].dogDisplay();
    dogs[i].imageMove();
  }
}

class Rain {
  int x;
  int y;
  float ySpeed;
  Rain(int xPos, int yPos) { //constructor statement
    x = xPos;
    y = yPos;
  }
  void catDisplay() {
    image(picturecat, x, y, 100, 100);
  }
  void dogDisplay() {
    image(picturedog, x, y, 100, 100);
  }
  void imageMove() {
    ySpeed = random(1,10);
    y += ySpeed;
    if (y>width) {
      y=0;
    }
  }
}


