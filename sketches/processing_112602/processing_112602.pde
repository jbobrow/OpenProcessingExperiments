
//Group 18 Sketch

void setup() {
  size(600, 600);
  background(0, 0, 0); //Sets the background to black.
}

void draw()
{
  smooth();
  fill(255, 255, 0); //Makes the text yellow
  textSize(200);
  text("TAXI", 60, 350);

  fill(255, 255, 255); //Makes both the rectangles white
  rect(0, 0, 600, 100);
  rect(0, 500, 600, 100);


  int oddx = 0;
  int oddy = -10;
  int evenx = -20;
  int eveny= -20;

  for (int i=0; i<5; i++) { //Draws 5 rows of black squares, which on white gives the checkered effect.
    eveny = eveny + 20;  
    evenx=0;
    for (int i2=0; i2<60; i2++) {
      fill(0);
      rect(evenx, eveny, 10, 10);
      evenx = evenx+20;
    }
  }

  for (int i=0; i<5; i++) { 
    oddy = oddy + 20;  
    oddx=10;
    for (int i2=0; i2<60; i2++) {
      fill(0);
      rect(oddx, oddy, 10, 10);
      oddx = oddx+20;
    }
  } 

  int oddx2 = 500;
  int oddy2 = 490;
  int evenx2 = -20;
  int eveny2 = 480;

  for (int i=0; i<5; i++) { //Draws another 5 rows of squares, but are staggered for the checkered effect.
    eveny2 = eveny2 + 20;  
    evenx2=0;
    for (int i2=0; i2<60; i2++) {
      fill(0);
      rect(evenx2, eveny2, 10, 10);
      evenx2 = evenx2+20;
    }
  }

  for (int i=0; i<5; i++) {
    oddy2 = oddy2 + 20;  
    oddx2=10;
    for (int i2=0; i2<60; i2++) {
      fill(0);
      rect(oddx2, oddy2, 10, 10);
      oddx2 = oddx2+20;
    }
  }
}
