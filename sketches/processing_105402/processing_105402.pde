
// Hippo by Jesse Day
// See http://www.openprocessing.org/sketch/104865

color gray;
color green;

int hippoX;
int hippoY;

void setup() {
  size(800, 600);
  gray = color(200);
  green = color(41, 224, 170);
  background(green);
  hippoX = 355;            // X-coordinate
  hippoY = 250;             // Y-coordinate
}

void draw() {
  //  drawHippo(hippoX, hippoY);
  //  background(green);
  //  drawHippo(100, 100);
  //  drawHippo(300, 300);
  if (mousePressed == true) {
    drawHippo(mouseX, mouseY);
  } 
}

void drawHippo(int x, int y) {

  fill(gray);

  //feet
  ellipse(x + 55, y +45, 25, 25);
  ellipse(x + 22, y +58, 25, 25);

  //body
  ellipse (x, y, 170, 130);
  ellipse(x-50, y+10, 110, 65);
  ellipse(x-50, y+ 50, 150, 75);

  //eyes
  fill(0);
  ellipse(x- 20, y+9, 4, 4);
  ellipse(x- 80, y+9, 4, 4);

  //nostrils
  ellipse(x- 40, y+70, 2, 2);
  ellipse(x- 60, y+70, 2, 2);
} 

//void mousePressed() {
//  drawHippo(mouseX, mouseY);
//}

