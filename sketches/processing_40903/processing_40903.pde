
// infestation

int num = 75; 

Pen[] myPen = new Pen [num];

void setup() {
  size(500, 300);
  background(200);
  smooth();
  frameRate(30); 

  for (int i = 0; i < myPen.length; i++) {
    myPen[i] = new Pen();
  }
}

void draw() {

  for (int i = 0; i < myPen.length; i++) { 
    myPen[i].update();
    myPen[i].display();
  }
}

// stop the infestation by pressing the mouse
void mousePressed() { 
  noLoop();
}

// undo this command to restart the infestation upon releasing the mouse
/*
void mouseReleased() { 
 background(200); 
 loop(); 
 }*/


// set the class .............
// variables and default values to the class pen
class Pen { 

  int x = int(random(width));
  int y = int(random(height));

  // blank constructor - default variables doing the work
  Pen() {
  }

  // set methods (functions the object may use)
  void update() {
    x = x + int(random(0, 2));
    y = y + int(random(0, 2));
  }

  void display() {
    ellipse(random(x), random(y), 3, 3);
  }
}


