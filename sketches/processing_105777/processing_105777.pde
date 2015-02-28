
float []xPos1;
float []yPos1;
float []ySpeed1;
int sizeSquares;
int numSquares;
int colorR;
int colorG;
int colorB;

void setup() {
  size (600, 600);

  //set up color
  colorR = int(random(0, 255));
  colorG = int(random(0, 255));
  colorB = int(random(0, 255));

  //square color,shape and position
  numSquares = 10;
  xPos1 = new float[numSquares];
  yPos1 = new float[numSquares];
  ySpeed1 = new float[numSquares];


  // declare the xPos, yPos and ballSize
  for (int i=0; i<numSquares; i++) {
    for (int j=0; j<numSquares; j++) {
      xPos1[i] = i*(width/numSquares);
      yPos1[j] = j*(width/numSquares);
    }
  }
}

void draw() {
  for (int i=0; i<numSquares; i++) {
    for (int j=0; j<numSquares; j++) {
      if (!mousePressed) {
        stroke(colorR);
        strokeWeight(4);
        fill (colorR-mouseX, colorG-mouseY, colorB-mouseX);
        ellipseMode (CENTER);
        ellipse (xPos1[i]+30, yPos1[j]+30, width/numSquares, width/numSquares);
        fill (colorR-mouseX, colorG-mouseY, colorB-mouseX);
        noStroke();
        ellipseMode (CENTER);
        ellipse (xPos1[i]+60, yPos1[j]+60, width/numSquares, width/numSquares);
      }
      else if (mousePressed) {
        colorR = int(random(0, 200));
        colorG = int(random(0, 200));
        colorB = int(random(0, 200));
      }
    }
  }
}



