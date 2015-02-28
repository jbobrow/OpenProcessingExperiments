
int xPos = 15;
int yPos = 15;
int d = 20;
float startRot = 0;
float endRot = 4.71;


//SET UP
void setup() {
  size(450, 450);
  smooth();
}


//DRAW
void draw() {
  background(25, 21, 22);
  noFill();
  stroke(#26A9E0);

  for (int c = 0; c < 21; c++)
    for (int r = 0; r < 21; r++) {
      drawArc(60 * c, 60 * r, d, startRot, endRot);
    }   
}


//FUNCTIONS
void drawArc(int xPos, int yPos, int d, float startRot, float endRot) {
  arc(xPos, yPos, d, d, startRot, endRot);
  fill(#0C4F66); 
  stroke(#0C4F66);
  arc(xPos + 30, yPos, d, d, startRot + HALF_PI, endRot + HALF_PI);
  fill(#26A9E0);
  stroke(#26A9E0);
  arc(xPos, yPos + 30, d, d, startRot + PI, endRot + PI);
  noFill();
  arc(xPos + 30, yPos + 30, d, d, startRot + PI+HALF_PI, endRot + PI+HALF_PI);
}





