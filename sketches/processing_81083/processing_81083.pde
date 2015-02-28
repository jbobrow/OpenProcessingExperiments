
float a; //random color 1
float b; //random color 2
float c; //random color 3
float i = 0.1; //for rotation
int start=1; //to say if game has been run
int temp; //used if paused
int type; //choose action/shape
int ssX = 80; //original shapesize X
int ssY = 80; //original shapesize Y
void setup() {
  size(400, 400);
  type = 1; //set to rectangle
  smooth();
  background(153, 204, 255);
  fill(0);
  text("Instructions:", 50, 50);
  text("Press R to use rectangle", 50, 70);
  text("Press E to use ellipse", 50, 90);
  text("Press T to use triangle", 50, 110);
  text("Press P to pause/unpause", 50, 130);
  text("Press Any key now to start", 50, 150);
}

void draw() {
  if (start==1) { //runs until any key is pressed
    if (keyPressed==true) {
      start=2;
      background(130);
    }
  }
  if (start==2) { //after a key is pressed, start will always be 2.
    translate(mouseX, mouseY); //move origin to mouse location
    if (mousePressed) { //pick a random color to use as full if 
      a = random(0, 255); //mouse button is pressed or held.
      b = random(0, 255);
      c = random(0, 255);
      fill(a, b, c);
    } 
    else {
      fill(255); //else white shapes are drawn.
    }
    rotate(i++); //rotate shape
    strokeWeight(0.1);
    if (type==1) { //if r has been pressed
      rect(-ssX/2, -ssY/2, ssX, ssY);
    }
    if (type==2) { //if e has been pressed
      ellipse(-ssX/6, -ssY/2, ssX, ssY);
    }
    if (type==3) { //if t has been pressed
    triangle(0,40,-40,-40,40,-40);
  }
}}
void keyPressed() {
  if (key == 'r' || key == 'R') {
    if (type!=4) { //if game isnt paused
      type = 1;
    }
  }
  if (key == 'e' || key == 'E') {
    if (type!=4) {
      type = 2;
    }
  }
  if (key == 't' || key == 'T') {
    if (type!=4) {
      type = 3;
    }
  }
  if (key == 'p' || key == 'P') {
    if (type!=4) { //if game isn't already paused
      temp = type; //store shape type in temp location
      type = 4; //change state to paused
    } 
    else { //if game is already paused
      type = temp; //start drawing shapes based on last shape used.
    }
  }
}


