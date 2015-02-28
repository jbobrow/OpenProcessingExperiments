
void setup() {
  size(800, 600);
  smooth();
  noStroke();
}

int colorR = 0;
int colorG = 0;
int colorB = 0;

boolean goColorR = false;
boolean goColorG = false;

void draw() {
  if (goColorR) {
   colorG = 0;
   colorR = colorR + 15;
   goColorR = false; 
  }
  
  if (goColorG) {
   colorB = 0;
   colorG = colorG + 15;
   goColorG = false; 
   if (colorG == 255) {
     goColorR = true;
   }
  }
  
  colorB = colorB + 15;
  
  if (colorB == 255) {
    goColorG = true;
  }  
  
  drawElipses(mouseX, mouseY, radians((second() * 6) + 270));
  
  if (colorR == 255) {
   colorR = 0; 
  }
}

void drawElipses(int theX, int theY, float angle) {
  fill(colorR, colorG, colorB);
  ellipse(theX, theY, 80, 80);
  fillToBorder(theX, theY, angle);
}

void fillToBorder(float theX, float theY, float angle) {
  while (theX > 0 && theX <= 800 && theY > 0 && theY <= 600) {
    theX = theX + (40 * cos(angle));
    theY = theY + (40 * sin(angle));
    ellipse(theX, theY, 80, 80);
  }
}


