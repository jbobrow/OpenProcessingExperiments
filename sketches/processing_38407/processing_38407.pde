
//set up background 
void setup() {
  size (500, 500);
  background (52, 37, 10);
  smooth();
}
//establish variables that dictate size, shape, and color of arcs
float count = 25;
float arcSize;
float start;
float stop;

//draw random arcs based on placement of mouse and clicking of mouse
void draw() {
  if (mousePressed == true) {

    if (count > 0) {
      arcSize = random (50, 450); //random between 10 and 50
      start = random (0, TWO_PI);
      stop = random (0, TWO_PI);
      randomColor();
      strokeWeight (3);
      stroke (18, 183, 143);
      arc (mouseX, mouseY, arcSize, arcSize, start, stop);
    }
  }
}

//makes fill a random color from a choice of three
void randomColor() {

  int randomNum = floor(random(1, 4));

  if (randomNum == 1) {
    fill(250, 210, 48, 50);
  }; 
  if (randomNum == 2) {
    fill(170, 3, 9, 50);
  }; 
  if (randomNum == 3) {
    fill(234, 132, 21, 50);
  };
}


