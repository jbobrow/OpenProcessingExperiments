
//lots and lots of values
//this could be pruned. A LOT. But I'm glad it's working.

//red, green, blue, alpha, and values to be incremented in the button class
int r, g, b, a, sw;
int rinc = 0;
int ginc = 0;
int binc = 0;
int ainc = 255;
int swinc = 1;

int shapeScale = 9;
int triangScale = 4;

//switches for changing from line to shape
boolean squareStroke = false;
boolean circleStroke = false;
boolean triangleStroke = false;
boolean lineStroke = true;

//new buttons, two for each color
Buttons redButtonPos = new Buttons(120, 540, 20, 20);
Buttons redButtonNeg = new Buttons(100, 540, 20, 20);
Buttons greenButtonPos = new Buttons(120, 600, 20, 20);
Buttons greenButtonNeg = new Buttons(100, 600, 20, 20);
Buttons blueButtonPos = new Buttons(120, 660, 20, 20);
Buttons blueButtonNeg = new Buttons(100, 660, 20, 20);
Buttons alphaButtonPos = new Buttons(620, 600, 20, 20);
Buttons alphaButtonNeg = new Buttons(600, 600, 20, 20);
//stroke size
Buttons strokeButtonPos = new Buttons(700, 400, 20, 20);
Buttons strokeButtonNeg = new Buttons(680, 400, 20, 20);
//change shape
Buttons squareButton = new Buttons(680, 350, 20, 20);
Buttons circleButton = new Buttons(680, 310, 20, 20);
Buttons triangleButton = new Buttons(680, 270, 20, 20);
Buttons lineButton = new Buttons(680, 230, 20, 20);


void setup() {
  size(800, 700);
  background(255);
  rectMode(CENTER);
  frameRate(60); //reduces lag on button pressing
  smooth(); //anti-alias
}

void draw() {
  r=rinc;
  g=ginc;
  b=binc;
  a=ainc;
  sw=swinc;
  
  //updates button/increment state
  buttonUpdate();
  
  //draws the line
  mouseLine();
  
  strokeWeight(1);
  
  //the interface, placed over drawing area
  interfaceBox();
  
  //button images
  redButtonPos.pos();
  redButtonNeg.neg();
  greenButtonPos.pos();
  greenButtonNeg.neg();
  blueButtonPos.pos();
  blueButtonNeg.neg();
  alphaButtonPos.pos();
  alphaButtonNeg.neg();
  strokeButtonPos.pos();
  strokeButtonNeg.neg();
  squareButton.pos();
  circleButton.pos();
  triangleButton.pos();
  lineButton.pos();

  strokeWeight(2);
  rect(400, 600, 125, 125);
  
  strokeWeight(1);
  fill(r, g, b, a);
  rect(400, 600, 150, 150);
}

void keyReleased() {
  if (key == ENTER) {
    background(255);
  } 
}

/*void mousePressed() {
  redButtonPos.redCheckPos();
  redButtonNeg.redCheckNeg();
  greenButtonPos.greenCheckPos();
  greenButtonNeg.greenCheckNeg();
  blueButtonPos.blueCheckPos();
  blueButtonNeg.blueCheckNeg();
}*/

//takes advantage of the fact that Draw is a loop so it'll keep updating the respective
//inc as long as you're "pressing down" on the button.
void mouseReleased() {
   squareButton.squareCheck();
   circleButton.circleCheck();
   triangleButton.triangleCheck();
   lineButton.lineCheck();
}

void buttonUpdate() {
  if (mousePressed) {
    redButtonPos.redCheckPos();
    redButtonNeg.redCheckNeg();
    greenButtonPos.greenCheckPos();
    greenButtonNeg.greenCheckNeg();
    blueButtonPos.blueCheckPos();
    blueButtonNeg.blueCheckNeg();
    alphaButtonPos.alphaCheckPos();
    alphaButtonNeg.alphaCheckNeg();
    strokeButtonPos.strokeCheckPos();
    strokeButtonNeg.strokeCheckNeg();
  }
}

void mouseLine() {
  stroke(r, g, b, a);
  strokeWeight(sw);
  if (mousePressed && lineStroke) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  else if (mousePressed && squareStroke) {
    noStroke();
    fill(r, g, b, a);
    pushMatrix();
    rect(mouseX, mouseY, shapeScale+sw, shapeScale+sw);
    popMatrix();
  } 
  else if (mousePressed && circleStroke) {
    noStroke();
    fill(r, g, b, a);
    pushMatrix();
    ellipse(mouseX, mouseY, shapeScale+sw, shapeScale+sw);
    popMatrix();
  } 
  else if (mousePressed && triangleStroke) {
    noStroke();
    fill(r, g, b, a);
    pushMatrix();
    beginShape(TRIANGLES);
    vertex(mouseX, mouseY-(triangScale+sw));
    vertex(mouseX+(triangScale+sw), mouseY+(triangScale+sw));
    vertex(mouseX-(triangScale+sw), mouseY+(triangScale+sw));
    endShape();
    popMatrix();
  } 
}

void interfaceBox() {
  stroke(0,0,0);
  fill(255, 240, 200);
  pushMatrix();
  translate(705, 245);
  rect(0,0,210,510);
  popMatrix();
  
  pushMatrix();
  translate(395, 605);
  rect(0,0,810,210);
  popMatrix();
}


class Buttons {
  
 int localX, localY, localW, localH;
 
 Buttons(int x, int y, int w, int h) {
   localX = x;
   localY = y;
   localW = w;
   localH = h;
 }
 
 void pos() {
   rect(localX, localY, localW, localH);
   line(localX, localY-(localH/4), localX, localY+(localH/4));
   line(localX-(localW/4), localY, localX+(localW/4), localY);
 }
 
 void neg() {
   rect(localX, localY, localW, localH);
   line(localX-(localW/4), localY, localX+(localW/4), localY);
 }

//each button checks whether the mouse position is within the area of each square.
//this accounts for the fact that rectangles are drawn from the center position

//red
 void redCheckPos() {
  if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
    rinc++;
     if (rinc > 255) {
       rinc = 255;
     }
   } 
 }
 
 void redCheckNeg() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     rinc--;
     if (rinc < 0) {
       rinc = 0;
     }
   } 
 }
 
 //green
 void greenCheckPos() {
  if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     ginc++;
     if (ginc > 255) {
       ginc = 255;
     }
   } 
 }
 
 void greenCheckNeg() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     ginc--;
     if (ginc < 0) {
       ginc = 0;
     }
   } 
 }
 
 //blue
 void blueCheckPos() {
  if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     binc++;
     if (binc > 255) {
       binc = 255;
     }
   } 
 }
 
 void blueCheckNeg() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     binc--;
     if (binc < 0) {
       binc = 0;
     }
   } 
 }
 
 //alpha
 void alphaCheckPos() {
  if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     ainc++;
     if (binc > 255) {
       ainc = 255;
     }
   } 
 }
 
 void alphaCheckNeg() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     ainc--;
     if (binc < 0) {
       ainc = 0;
     }
   } 
 }
 
 void strokeCheckPos() {
  if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     swinc++;
     if (swinc > 100) {
       swinc = 100;
     }
   } 
 }
 
 void strokeCheckNeg() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     swinc--;
     if (swinc < 1) {
       swinc = 1;
     }
   } 
 }
 
 void squareCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     squareStroke = true;
     circleStroke = false;
     triangleStroke = false;
     lineStroke = false;
   } 
 }
 
 void circleCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     circleStroke = true;
     squareStroke = false;
     triangleStroke = false;
     lineStroke = false;
   } 
 }
 
 void triangleCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     triangleStroke = true;
     circleStroke = false;
     squareStroke = false;
     lineStroke = false;
   } 
 }
 
 void lineCheck() {
   if (mouseX >= localX-(localW/2) && mouseX <= localX+(localW/2) && mouseY >= localY-(localH/2) && mouseY <= localY+(localH/2)) {
     lineStroke = true;
     squareStroke = false;
     circleStroke = false;
     triangleStroke = false;
   } 
 }
  
}

