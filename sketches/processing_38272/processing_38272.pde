
void setup() {
  // Controls page size
  size(500, 500);
}


void draw() {
  // Setting Defaults
  smooth();

  // Diagnal line maximium
  float rowMax = 510;

  // Color R G B
  float cR = 0;
  float cG = 0;
  float cB = 0;
  float cM = 10;


  for (float rowCount = -250; rowCount<rowMax; rowCount+=10) {

    cR = (255 - (cM * (rowCount / 10)));
    cG = 0;
    cB = 255;

    for ( float i = 0 ; i < 500 ; i+=10 ) {
      cR -= 5.1;
      cG += 5.1;
      cB -= 5.1;
      fill (cR, cG, cB);
      rect(i, rowCount, 10, 10);
    }

    cR = (0 + (cM * (rowCount / 10)));
    cG = 255;
    cB = 0;

    for ( float circleOne = 0 ; circleOne < 510 ; circleOne+=10 ) {
      cR += 3.86;
      cG -= 3.86;
      cB += 3.86;
      fill (cR, cG, cB);
      ellipse(circleOne, rowCount, 10, 10);
    }
    
  }
}


// Don't touch anything below this line!!! SERIOUSLY GUYS!!!
void mouseClicked() {
  println ("Mouse X Position: "+ mouseX +", Mouse Y Position: " + mouseY);
}


