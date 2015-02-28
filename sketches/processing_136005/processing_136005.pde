
//jahaira rodriguez

Sprinkles mySprinkles;
Sprinkles mySprinkles2;
Sprinkles mySprinkles3;
Sprinkles mySprinkles4;
Sprinkles mySprinkles5;

void setup() {
  size(100, 100);
  noStroke();
  fill(255, 0, 255);
  mySprinkles = new Sprinkles(7, 0, 10);
  mySprinkles2 = new Sprinkles(25, 0, 10);
  mySprinkles3 = new Sprinkles(50, 0, 10);
  mySprinkles4 = new Sprinkles(70, 0, 10);
  mySprinkles5 = new Sprinkles(90, 0, 10);
}

void draw() {
  background(255);
  frameRate(1);
  translate(width/2, height/2);

//triangles
  mySprinkles.triBottomL();
  mySprinkles.triBottomR();
  mySprinkles.triTopR();
  mySprinkles.triTopL();

  //Candy
  mySprinkles.dispWrap();
  mySprinkles.secondWrap();
  mySprinkles.thirdWrap();
  mySprinkles.centerWrap();


  translate(-50, -50);

  mySprinkles.display();
  mySprinkles.move();
  mySprinkles.bounce();
  mySprinkles.randColor();

  mySprinkles2.display();
  mySprinkles2.move();
  mySprinkles2.bounce();
  mySprinkles2.randColor();

  mySprinkles3.display();
  mySprinkles3.move();
  mySprinkles3.bounce();
  mySprinkles3.randColor();

  mySprinkles4.display();
  mySprinkles4.move();
  mySprinkles4.bounce();
  mySprinkles4.randColor();

  mySprinkles5.display();
  mySprinkles5.move();
  mySprinkles5.bounce();
  mySprinkles5.randColor();
}


class Sprinkles { 
  //declare
  int xPos;
  int yPos;
  int ySpeed;
  int red;
  int grn;
  int blu;

  //constructor
  Sprinkles(int _xPos, int _yPos, int _ySpeed) {
    xPos = _xPos;
    yPos = _yPos;
    ySpeed = _ySpeed;
  }
  //methods
  void display() {
    fill(red, grn, blu);
    ellipse(xPos, yPos, 5, 10);
  }

  void dispWrap() {
    fill(255, grn, blu);
    ellipse(0, 0, 55, 55);
  }

  void secondWrap() {
    fill(255, 130, 200);
    ellipse(0, 0, 40, 40);
  }

  void thirdWrap() {
    fill(255, 170, 200);
    ellipse(0, 0, 20, 20);
  }

  void centerWrap() {
    fill(255);
    ellipse(0, 0, 8, 8);
  }

  void triBottomL() {
    fill(0, 100, 100);
    triangle(-23, 0, -44, 20, -44, 0);
  }

  void triBottomR() {
    fill(0, 100, 100);
    triangle(23, 0, 44, 20, 44, 0);
  }

  void triTopR() {
    fill(0, 178, 178);
    triangle(23, 0, 44, -20, 44, 0);
  }

  void triTopL() {
    fill(0, 178, 178);
    triangle(-23, 0, -44, -20, -44, 0);
  }

  void move() {
    yPos = yPos + ySpeed;
  }

  void bounce() {
    if (yPos > height) {
      yPos = 0;
    }
  }

  void randColor() {
    red = (int)random(100, 255);
    grn = (int)random(0, 255);
    blu = (int)random(50, 255);
  }
}

//everything from draw in the class



