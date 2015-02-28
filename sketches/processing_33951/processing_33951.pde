
//FIELD DISTURBED BY MOUSE//
//by Kirilly Barnett
//Information gathered from Gennware Tutorials
//Original Coding created to luis gil
//http://www.legil.org

//this is a code I found on http://www.legil.org, 
//that I wanted to explore to undertand how this geometry is effected by a mouse
//before attempting the same idea with agents. 

//GLOBAL VARIABLES
int x;
int y;
//float ease = 0.05; 
int tolerance;
float redFactor;      //reduction factor
int opacity = 150;    //line transparency (0-255)
int sizeStroke = 8;   //line stroke size

//SETUP
void setup() {
  size(600, 600);
  smooth();
  noCursor();        //hides cursor
  tolerance = 50;    //size of disruption
  redFactor = 0.0125;
}
// DRAW
void draw() {
  background(255);
  for (int i = 50; i < (width-25); i += 25) {
    for (int j = 50; j < (height-25); j += 25) {
      stroke( 125, opacity);      //colour and opacity
      lineRot(i, j);
    }
  }
}

void mousePressed() {
  save("desktop.jpg");
}

void lineRot(int xPos, int yPos) {
  strokeWeight(sizeStroke);
  pushMatrix();             // so each translation is relevant to the last
  translate(xPos, yPos);
  float angle = atan2(mouseY-yPos, mouseX-xPos);     
  //the angle from a specified point to the coordinate origin
  float mouseDist = dist(mouseX, mouseY, xPos, yPos);
  //line below is test
  rotate(angle-PI);
  if (dist(mouseX, mouseY, xPos, yPos) < tolerance) {
    //rotate(angle);
    line(0, 0, mouseDist, 0);
  } 
  else {
    //rotate(angle-PI);
    line(0, 0, tolerance/(mouseDist*redFactor), 0);
  }
  popMatrix();
}


