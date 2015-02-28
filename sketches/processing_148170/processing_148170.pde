
// Kevin Kuntz
// Project 2
// Etch-a-sketch

//USE THE ARROW KEYS TO DRAW ON THE ETCH A SKETCH SCREEN
//KNOBS ARE SUPPOSED TO ROTATE WITH THE MOVEMENT OF WHAT KEY IS PRESSED BUT DOES NOT FUNCTION
//SPACE BAR SAVES THE IMAGE AND WIPES THE SCREEN CLEAN

int sizeWidth = 800;
int sizeHeight = 800;

float drawSpaceRight = sizeWidth * .8;
float drawSpaceBottom = sizeHeight * .5;
float drawSpaceLeft = sizeWidth * .1;
float drawSpaceTop = sizeHeight * .2;
float dotPositionX = sizeWidth / 2;
float dotPositionY = sizeHeight / 2;
float[] trackDrawing;
float moveDot = 1;

void setup() {
  size(sizeWidth, sizeHeight);
  background(255, 238, 152);
    //red Frame
  noStroke();
  fill(255, 0, 0);
  rect(width*.05, height*.16, width*.9, height*.66, 15);

  //draw space
  strokeWeight(2);
  stroke(50);
  fill(200);
  rect(drawSpaceLeft, drawSpaceTop, drawSpaceRight, drawSpaceBottom);

  //Left knob
  stroke(0);
  fill(240);
  ellipseMode(CENTER);
  ellipse(sizeWidth * .12, sizeHeight * .76, sizeWidth * .1, sizeWidth * .1);

  //Right Knob
  stroke(0);
  ellipse(sizeWidth * .88, sizeHeight * .76, sizeWidth * .1, sizeWidth * .1);

}

void draw() {
  sketch();
  eraseSketch();
  rotateKnobs();
}

void rotateKnobs() {
  //Left knob
  stroke(0);
  fill(240);
  ellipseMode(CENTER);
  ellipse(sizeWidth * .12, sizeHeight * .76, sizeWidth * .1, sizeWidth * .1);  
  line(sizeWidth * .12, sizeHeight * .76, sizeWidth*.12,(sizeHeight * .76) - (.05 * sizeWidth));
  if (keyPressed == true & keyCode == RIGHT) {
    pushMatrix();
    translate(sizeWidth * .12, sizeHeight * .76);
    rotate(moveDot);
    ellipse(sizeWidth * .12, sizeHeight * .76, sizeWidth * .1, sizeWidth * .1);  
    line(sizeWidth * .12, sizeHeight * .76, sizeWidth*.12,(sizeHeight * .76) - (.05 * sizeWidth));
    popMatrix();
  }
  //Right knob
  stroke(0);
  fill(240);
  ellipseMode(CENTER);
  ellipse(sizeWidth * .88, sizeHeight * .76, sizeWidth * .1, sizeWidth * .1);  
  line(sizeWidth * .88, sizeHeight * .76, sizeWidth*.88,(sizeHeight * .76) - (.05 * sizeWidth));
  if (keyPressed == true & keyCode == RIGHT) {
    pushMatrix();
    translate(sizeWidth * .12, sizeHeight * .76);
    rotate(moveDot);
    ellipse(sizeWidth * .88, sizeHeight * .76, sizeWidth * .1, sizeWidth * .1);  
    line(sizeWidth * .88, sizeHeight * .76, sizeWidth*.88,(sizeHeight * .76) - (.05 * sizeWidth));
    popMatrix();
  }
  }

void sketch() {
  strokeWeight(3);
  stroke(80);
  point(dotPositionX ,dotPositionY);
  if (keyPressed == true & keyCode == RIGHT) {
    dotPositionX += 1;
  }
  else if (keyPressed == true & keyCode == LEFT) {
    dotPositionX -= 1;
  }
  else if (keyPressed == true & keyCode == UP) {
    dotPositionY += 1;
  }
  else if (keyPressed == true & keyCode == DOWN) {
    dotPositionY -= 1;
  }
  else
    dotPositionX = dotPositionX;
    dotPositionY = dotPositionY;
}

void eraseSketch() {
  if (keyPressed ==true & key == ' ') {
   // saveFrame("drawing.jpg");
    strokeWeight(2);
    stroke(50);
    fill(200);
    rect(drawSpaceLeft, drawSpaceTop, drawSpaceRight, drawSpaceBottom);
  }
}
