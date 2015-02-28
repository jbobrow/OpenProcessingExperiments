
// variables for shape fill
int rf = 255;
int gf = 255;
int bf = 255;
int af = 255;
// variables for shape size
int x = 50;
int y = 50;
// 1 = circle, 2 = square
int shapeType = 1;
// variables for background fill
int pr = 255;
int pg = 255;
int pb = 255;
// variable for strokeweight 
int sw = 4;
// whether random colors is on or not
boolean randomOn = false;
 
void setup() {
  size(700, 700);
  background(255);
  smooth();
}
 
void draw() {
  drawShape();
}

// draw shape function because you can choose between a square and a circle 
void drawShape() {
  background(pr, pg, pb);
  fill(rf, gf, bf, af);
  // sets the colors to random when randomOn is true
  if (randomOn) {
    colorMode(HSB, 360);
    background(random(90, 320), 300, 360);
    fill(random(0, 90), 300, 360);
    colorMode(RGB, 255);
  }
  strokeWeight(sw);
  // chaotic variable, farther the mouse is to the right, the larger this variable is
  int rX = mouseX/20;
  // makes the grid of shapes, 9x9
  for (int col = 1; col <= 9; col++) {
    for (int row = 1; row <= 9; row++) {
      int c = (width/10)*col;
      int r = (height/10)*row;
      if (shapeType == 1) {
      // chaotic random placement restriced movement though
        ellipse(c+random(-rX, rX), r+random(-rX, rX), x, y);
      }
      if (shapeType == 2) {
        rect((c-x/2)+random(-rX, rX), (r-y/2)+random(-rX, rX), x, y);
      }
    }
  }
}

/* 
int pick(int a, int b) {
 return int(random(a*10, b*10));
}
*/
 
void keyPressed() {
  // color keys that work together for fill
  if (key == 'r') {
    if (rf < 0) {rf = 0;}
    rf -= 255;
  }
  if (key == 'g') {
    if (gf < 0) {gf = 0;}
    gf -= 255;
  }
  if (key == 'b') {
    if (bf < 0) {bf = 0;}
    bf -= 255;
  }
  if (key == 'a') {
    if (af < 100) {af = 100;}
    af -= 155;
  }
  // color keys that work together for background
  if (key == 't') {
    if (pr < 0) {pr = 0;}
    pr -= 255;
  }
  if (key == 'h') {
    if (pg < 0) {pg = 0;}
    pg -= 255;
  }
  if (key == 'n') {
    if (pb < 0) {pb = 0;}
    pb -= 255;
  }
  // change size of shape
  if (key == '-') {
    if ((x-5) < 2) { x=2; }
    if ((y-5) < 2) { y=2; }
    x -= 5;
    y -= 5;
  }
  if (key == '=') {
    if ((x+5) >= width) { x=width; }
    if ((y+5) >= height) { y=height; }
    x += 5;
    y += 5;
  }
  if (key == 'i') {
    filter(INVERT);
  }
  // change shapes
  if (key == '1') {
    shapeType = 1;
  }
  if (key == '2') {
    shapeType = 2;
  }
  // strokeweight
  if (key == 'o') {
    if (sw-1 < 2) {sw = 1;}
    sw--;
  }
  if (key == 'p') {
    if (sw+1 > x/2) {sw = x/2;}
    sw++;
  }
  // turn on the crazy ugly colors!
  if (key == 'c') {
    randomOn = !randomOn;
  } 
  // erases canvas
    if (key == ' ') {
    x = 50;
    y = 50;
    shapeType = 1;
    sw = 4;
    randomOn = false;
  } 

}
 
void keyReleased() {
  if (key == 'r') {
    rf = 255;
  }
  if (key == 'g') {
    gf = 255;
  }
  if (key == 'b') {
    bf = 255;
  }
  if (key == 'a') {
    af = 255;
  }    
  if (key == 't') {
    pr = 255;
  }
  if (key == 'h') {
    pg = 255;
  }
  if (key == 'n') {
    pb = 255;
  }
}               
