
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
  numSquares = 8;
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

        // lines
        stroke(colorR, colorG, colorB, 5+int((mouseX+mouseY)/2));
        strokeWeight(80);
        line(xPos1[i]+mouseX, yPos1[j]+mouseY, xPos1[i], yPos1[j]);
        noStroke();

        //circles
        stroke(colorR);
        strokeWeight(4);
        fill (colorR-mouseX, colorG-mouseY, colorB-mouseX);

        ellipse (xPos1[i]+40, yPos1[j]+40, width/numSquares+30, width/numSquares+30);
        fill (colorR-mouseX, colorG-mouseY, colorB-mouseX);
        noStroke();
        ellipse (xPos1[i]+80, yPos1[j]+80, width/numSquares+30, width/numSquares+30);

        // Add text explanation
        String s = "Use your mouse wisely.";
        
        fill(255);
        text(s, 70, 480, 300, 300);
      }
      else if (mousePressed) {
        colorR = int(random(0, 200));
        colorG = int(random(0, 200));
        colorB = int(random(0, 200));
      }
    }
  }
}



