
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
}

void draw() {
  // every frame, draw 3 hippos in random positions
  for (int i = 0; i < 3; i++) {
    drawHippo(int(random(width)), int(random(height)));
  } 
}

// define a new function called drawHippo
// when called, it needs to be passed 2 ints
// for the x and y positions, similar to rect()
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
