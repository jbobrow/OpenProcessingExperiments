
int num = 1000; //number of particles and rectangles at during one frame 

Barrier [] myBarrier = new Barrier [num]; //don't know why i called this barrier

void setup () {
  size(400, 400);


  for (int i=0; i<myBarrier.length; i++) { //iputting array
    myBarrier [i] = new Barrier ();
  }
}

void draw () {
  background(175, 175, 175);
  for ( int i=0; i<myBarrier.length; i++) {
    myBarrier[i].parameters();
    myBarrier[i].execute();
  }
}

class Barrier {

  int x = int (random(width)); //setting up parameters so points are spread across canvas
  int y = int (random(width)); //setting up parameters so points are spread across canvas

  Barrier() { 
  }

  void parameters () {
    x = x + int(random(-10, 10)); 
    y = y + int(random(-10, 10));
  }

  void execute () { //primary color composition
    stroke(255, 0, 0);
    point (x, random(90, 120)); //horizontal band of red particles
    stroke(255, 255, 0);
    point (random(355, 365), y); //vertical band of yellow particles
    stroke(0, 0, 255);
    noFill();
    rect(y, 120, (x)/64, x/4); //strong emphasis of rectangles towards the bottom of canvas
  }
}


