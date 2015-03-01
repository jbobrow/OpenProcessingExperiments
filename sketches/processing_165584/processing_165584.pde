
//Object Oriented Programming --> OOP, Constructors, Dot Notation
//Classes

//Class newName = new Class(); --> "new Class();" = the constructor
Object [] array = new Object [300];

//PVector objectPos = new PVector (xPos, yPos);
//PVector mousePos = new PVector (mouseX, mouseY);

float speed = random(1, 20);

void setup() {
  smooth();
  size(700, 700);
  //newName.FunctionName(arguements); --> Dot Notation

  for (int i=0; i<array.length; i++) { //"i<arrayName.length" -- allows you to change array length in Header
    array[i] = new Object();
    //source: http://www.landofcode.com/java-tutorials/java-random-numbers.php
    array[i].prime(int(random(0, width)), int(random(0, width)), int(random(10, 100)));
  }
}

void draw () {
  //Object.bubblesPopped();
  background(255);
  //newName.FunctionName(); --> Dot Notation

  for (int i=0; i<array.length; i++) {
    array[i].update();
  }
//  if (dist (objectPos.x, objectPos.y, mouseX, mouseY) > 5) {
//    lerp(objectPos.x, mousePos.x, 1);
//    lerp(objectPos.y, mousePos.y, 1);
//  }
}


class Object {

  int bigness;
  float xPos;
  float yPos;

  int forcefield;

  PVector objectPos;
  PVector mousePos = new PVector (mouseX, mouseY);

  int bubblesPopped;


  //to call in main script: EXAMPLE: Object.prime(10, 15, 30); --> Dot Notation
  void prime(int _xPos, int _yPos, int _bigness) {
    xPos = _xPos;
    yPos = _yPos;
    bigness = _bigness;
    objectPos = new PVector (xPos, yPos);
  }

  void update() {
    bubblesPopped = 0;

    forcefield = bigness + 20;

    //draw object
    strokeWeight(3);
    stroke(0);
    fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));

    ellipse(xPos, yPos, bigness, bigness);
    //ellipse(objectPos.x, objectPos.y, bigness, bigness);

    //    if (dist (objectPos.x, objectPos.y, mouseX, mouseY) < 5) {
    if (dist (xPos, yPos, mouseX, mouseY) > forcefield) {
      xPos = lerp(xPos, mouseX, .05);
      yPos = lerp(yPos, mouseY, .05);
    }
    if (dist (xPos, yPos, mouseX, mouseY) <= forcefield) {
      xPos = random(0-width, width*2);
      yPos = random(0-height, height*2);
      //xPos += 20;
      //yPos -= 20;
    }
  }

  void bubblesPopped() {
    if (dist (xPos, yPos, mouseX, mouseY) <= forcefield) {
      bubblesPopped += 1;
      print (bubblesPopped);
    }
  }
}



