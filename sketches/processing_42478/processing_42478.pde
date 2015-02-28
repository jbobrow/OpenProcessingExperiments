
Flower flower1;
Flower flower2;
Flower flower3;
Flower flower4;
Flower flower5;
Flower flower6;
Flower flower7;
Flower flower8;
Flower flower9;
Flower flower10;

void setup() {
  size (500, 500);
  
  flower1= new Flower(0, 30, color(236, 50, 250), 10, 2);
  flower2 = new Flower (50, 100, color(250, 170, 50), 5,3);
  flower3 = new Flower (200, 200, color(166, 50, 250), 0, 4);
  flower4 = new Flower (80, 150, color(50, 62, 250), 15, 1);
  flower5 = new Flower(400, 450, color(250, 70, 50), 20, 1);
  flower6 = new Flower (480, 480, color(50, 250, 178), 10, 6);
  flower7 = new Flower (250, 250, color(250, 192, 240), 15, 7);
  flower8 = new Flower (320, 320, color(136, 158, 224), 20, 4);
  flower9 = new Flower (140, 140, color(136, 224, 197), 30, 8);
  flower10 = new Flower (380, 380, color(186, 69, 245), 5, 9);
  smooth();
}

void draw() {
background(59, 183, 57);
  flower1.display();
  flower1.move();
  flower2.display();
  flower2.move();
  flower3.display();
  flower3.move();
  flower4.display();
  flower4.move();
  flower5.display();
  flower5.move();
  flower6.display();
  flower6.move();
  flower7.display();
  flower7.move();
  flower8.display();
  flower8.move();
  flower9.display();
  flower9.move();
  flower10.display();
  flower10.move();
}

class Flower {
  int posX;
  int posY;
  color c;
  int big;
  int speed;


  Flower (int _posX, int _posY, color _c, int _big, int _speed) {
    posX = _posX;
    posY =  _posY;
    c= _c;
    big = _big;
    speed=_speed;
  }

  void display () {
    stroke(c);
    fill(c);
    ellipse(posX+10, posY, 16+big, 13+big);
    ellipse(posX-10, posY, 16+big, 13+big);
    ellipse(posX, posY+10, 13+big, 16+big);
    ellipse(posX, posY-10, 13+big, 16+big);
    stroke(255, 250, 95);
    fill(255, 247, 95);
    ellipse(posX, posY, 10+big, 10+big);
  }

  void move() {
    posX= posX+speed;
    if (posX> width ) {
      posX=0;
    }
  }
}

