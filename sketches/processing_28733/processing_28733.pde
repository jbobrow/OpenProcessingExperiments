
// Global variables
// declare its name and assign it a value
int xPos = 225;
int yPos = 225;
int d = 40;
String firstname = "Shawn";

void setup() {
  size(450, 450);
  background(10,61,87);
  //background(188, 188, 188);
  smooth();
  stroke(144,129,250);
 //stroke(131, 131, 131);
  strokeWeight(.1);
  noFill();
}

void draw() {
  /*ellipse(20, 20, d, d);
   ellipse(35, 20, d, d);
   ellipse(20, 35, d, d);
   ellipse(35, 35, d, d);
   */

  for (int c = 0; c < 10; c++) {
    for (int r = 0; r < 10; r++) {
      drawTile(50 * c, 50 * r, d);
    }
  }
}

void drawTile(int xPos, int yPos, int d) {
  
  
  strokeWeight(1);
  stroke(25,179,205);
  noFill();
  rect(xPos + 6, yPos + 6, 27, 27);
  
  strokeWeight(.25);
  noStroke();
  fill(31,134,161);
  ellipse(xPos + 20, yPos + 20, 15, 15);
  fill(10,61,87);
  ellipse(xPos + 20, yPos + 20, 10, 10);
  
  strokeWeight(.01);
  stroke(25,179,205);
  point(xPos + 19, yPos + 18);
  //ellipse(xPos + 19, yPos + 19, 200, 200);
  //ellipse(xPos + 40, yPos + 20, d, d);
  //ellipse(xPos + 20, yPos + 40, d, d);
  
  strokeWeight(2);
  stroke(175,222,65);
  noFill();
  ellipse(xPos + 20, yPos + 20, 70, 70);
  
  strokeWeight(6);
  stroke(227,237,218);
  point(xPos + 5, yPos + 5);
  point(xPos + 33, yPos + 5);
  point(xPos + 5, yPos + 33);
  point(xPos + 33, yPos + 33);
  
  strokeWeight(2);
  point(xPos + 20, yPos + 45);
  point(xPos + 45, yPos + 20);
}

