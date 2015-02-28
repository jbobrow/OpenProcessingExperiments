
/*****************************************
 ** Assignment 3
 ** Name:        Gogo Wang
 ** E-mail:      hwang@haverford.edu
 ** Course:       CS 110 - 01
 **
 this is a drawing of three faces of random colors and random shapes and
 three boxes of random colors and shapes. If you put the mouse on different 
 parts of the screen they will move or appear on the screen
 ***********************************************/


//face1 
float faceX1 =random(50, 100);
float faceY1 =random(50, 100);
float faceWidth1 =random(50, 100);
float faceHeight1=random(50, 100);
color colorFace1 =color (random(255), random(255), random(255));
//face2 
float faceX2 = random(450, 450);
float faceY2 = random(200, 200);
float faceWidth2 = random(200, 400);
float faceHeight2 = random(100, 500);
color colorFace2 = color(random(255), random(255), random(255));
//face3 
float faceX3 = 300;
float faceY3 = 400;
float faceWidth3 = random(400, 500);
float faceHeight3 = random(100, 100);
color colorFace3 = color(random(255), random(255), random(255));
// box1 
float boxX1= random (200, 200);
float boxY1= random (400, 500);
float boxWidth1= 300;
float boxHeight1= 300;
color colorBox1=color(random(255), random(255), random(255));
// box2 
float boxX2= 50;
float boxY2= 50;
float boxWidth2= 100;
float boxHeight2= 100;
color colorBox2=color(random(255), random(255), random(255));
// box1 
float boxX3= random (200, 200);
float boxY3= random (400, 500);
float boxWidth3= 200;
float boxHeight3= 200;
color colorBox3=color(random(255), random(255), random(255));


void setup() {
  ellipseMode(CENTER);
  rectMode(CENTER);
  size (500, 500);
  smooth ();
}

void draw() {
  background(255);

  // draw face
  drawFace1(faceX1, faceY1, faceWidth1, faceHeight1, colorFace1);
  drawFace2(faceX2, faceY2, faceWidth2, faceHeight2, colorFace2);
  drawFace3(faceX3, faceY3, faceWidth3, faceHeight3, colorFace3);

  //draw box

  drawBox1(boxX1, boxY1, boxWidth1, boxHeight1, colorBox1);
  drawBox2(boxX2, boxY2, boxWidth2, boxHeight2, colorBox2);
  drawBox3(boxX3, boxY3, boxWidth3, boxHeight3, colorBox3);
}


/****************************************************************************
 **Funtion: drawFace1
 **Inputs: x, y, faceWidth, faceHeight, c
 **Outputs: return to draw a face
 ** face will move when mouse is at a certain position
 *****************************************************************************/
void drawFace1(float x, float y, float faceWidth, float faceHeight, color c) {
  //to make the face move
  float speed = 2;
  if ((mouseX <= 200) && (mouseY>=200)) {
    faceY1 = faceY1 + speed;
    //face settings
    fill(c);
    //face
    ellipse(faceX1, faceY1, faceWidth, faceHeight);
  }
}

/****************************************************************************
 **Funtion: drawFace2
 **Inputs: x, y, faceWidth, faceHeight, c
 **Outputs: return to draw a face
 ** face will disappear and reappear
 *****************************************************************************/
void drawFace2(float x, float y, float faceWidth, float faceHeight, color c) {
  //make face appear
  if ((mouseX >= 100) && (mouseY>=200)) {
    fill(0, 0, 255);
    //face
    ellipse(faceX2, faceY2, faceWidth, faceHeight);
  }
}

/****************************************************************************
 **Funtion: drawFace3
 **Inputs: x, y, faceWidth, faceHeight, c
 **Outputs: return to draw a face
 ** face will move when mouse is at a certain position
 *****************************************************************************/
void drawFace3(float x, float y, float faceWidth, float faceHeight, color c) {
  //make face move
  float speed = 3;
  if ((mouseX <= 500) && (mouseY<=100)) {
    faceX3 = faceX3 + speed;
    fill(c);
    //face
    ellipse(faceX3, faceY3, faceWidth, faceHeight);
  }
}


/****************************************************************************
 **Funtion: drawBox1
 **Inputs: x, y, boxWidth, boxHeight, c
 **Outputs: return to draw a face
 ** box will move when mouse is at a certain position
 *****************************************************************************/
void drawBox1(float x, float y, float boxWidth, float boxHeight, color c) {
  if ((mouseX <= 50) && (mouseY>=60)) {
    fill(0, 0, 255);

    rect(boxX1, boxY1, boxWidth1, boxHeight1);
  }
}


/****************************************************************************
 **Funtion: drawBox1
 **Inputs: x, y, boxWidth, boxHeight, c
 **Outputs: return to draw a face
 ** box will move when mouse is at a certain position
 *****************************************************************************/
void drawBox2(float x, float y, float boxWidth, float boxHeight, color c) {
  //make box move
  float speed = 2;
  if ((mouseX <= 50) && (mouseY>=50)) {
    boxY2 = boxY2 + speed;
  }
  fill(c);

  rect(boxX2, boxY2, boxWidth2, boxHeight2);
}


/****************************************************************************
 **Funtion: drawBox1
 **Inputs: x, y, boxWidth, boxHeight, c
 **Outputs: return to draw a face
 ** box will move when mouse is at a certain position
 *****************************************************************************/
void drawBox3(float x, float y, float boxWidth, float boxHeight, color c) {
  //make box move
  float speed = 2;
  if ((mouseX <= 200) && (mouseY>=300)) {
    boxY3 = boxY3 + speed;
    fill(c);

    rect(boxX3, boxY3, boxWidth3, boxHeight3);
  }
}
