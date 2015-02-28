
//import processing.opengl.*;
Thing[] myList = new Thing[100];
int numThings;

void setup() {
  background(255);

  size(1000, 500);

  numThings = 80;
  smooth();

  // Create the thing object

  for (int i = 0; i < numThings; i++ ) {
    PVector a = new PVector(0.0, 0.125);
    PVector v = new PVector(0.0, 0.0);
    PVector l = new PVector( random(0, width), random(0, height));

    myList[i] = new Thing(a, v, l);
  }
}

void draw() {

  for ( int i = 0; i < numThings; i++) {

    myList[i].go();
  }



  if (mousePressed) {
    // Compute difference vector between mouse and object location
    // 3 steps -- (1) Get Mouse Location, (2) Get Difference Vector, (3) Normalize difference vector

    PVector m = new PVector(mouseX, mouseY);


   
    for ( int i = 0; i < numThings; i++) 
    {
      PVector diff = PVector.sub(m, myList[i].getLoc());
      diff.normalize();
      float factor = .35;  // Magnitude of Acceleration (not increasing it right now)
      
      diff.mult(factor);
      //object accelerates towards mouse
      myList[i].setAcc(diff);
    }
  } 

  else {

   
    for ( int i = 0; i < numThings; i++) 
    {
      myList[i].setAcc(new PVector(random(-1,1), random(-1,1)));
    }
  }
}



