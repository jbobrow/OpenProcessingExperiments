
//Code by Karen Vertierra//

//set up background
void setup() {
  size (400, 400);
  background (47, 41, 51);
  smooth();
}

//establish variables that dictate size, shape, and color of arcs
float count = 50;
float arcSize;
float start;
float stop;

//coloured lines alternating in background
void draw() {
  int m= millis()/5; 
  noFill();
  float x= random (height^2);
  float y= random(width^2);
  strokeWeight(0.2);
  stroke(x, y, 250, 150);
  triangle(y, y, x, y, x, y);
}

// when mouse is moved, circles of random colours are created
void mouseMoved() { 
  arcSize = random (50, 150); //random size selection
  start = random (0, TWO_PI);
  stop = random (0, TWO_PI);
  randomColor();
  strokeWeight (2);
  stroke(76, 230, 235, 30);
  arc(mouseX, mouseY, arcSize, arcSize, stop, start);
}

//makes fill a random color from a choice of three options
void randomColor() {
  int randomNum = floor(random(1, 4));
  if (randomNum == 1) {
    fill(224, 167, 207, 30);
    }
  if (randomNum == 2) {
    fill(100, 73, 115, 30);
    }
  if (randomNum == 3) {
    fill(76, 230, 235, 30);
    }
  }

//reset composition when clicked
void mouseClicked() {
setup();
}

