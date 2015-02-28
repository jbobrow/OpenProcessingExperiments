
int moveTri=0;
int moveAmt=1;
float scaleRect=1.0;
float scaleAmt=.01;
int moveRect = 0;
int moveRectAmt = 1;
int stripeLen = -20;
int rotateStar = 0;
int rotateAmt = 1;


void setup()
{
  size(810, 520);
  colorMode(HSB, 360);
}

void draw()
{
  background(194, 80, 150); //reset background for animation 
  
  pushMatrix();
  translate(moveTri, 0); //move each triangle by a set distance each frame
  drawAllTri(); //draw grid of triangles
  moveTri+=moveAmt; //changes position of triangles after they are drawn

  if (moveTri > 5 || moveTri < 0) { //this if statement allows triangles to move back and forth
    moveAmt= -moveAmt; //if triangle hits the distance boundary, reverse its direction
  } 
  popMatrix();

  pushMatrix();
  translate(moveRect, 0); //move rectangle a certain distance
  scale(scaleRect, 1.0); //scale retangles in the x direction according to variable
  drawAllRect(); //draw grid of rectangles
  scaleRect+=scaleAmt; //add to amount that rectangles are scaled
  moveRect+=moveRectAmt; //move rectangles

  if (scaleRect > 1.2 || scaleRect < 1.0) { //sets boundaries for scale
    scaleAmt = -scaleAmt; //reverse scaling when boundary is hit
  } 
  if (moveRect > 0 || moveRect < -20) { //set boundaries for translate
    moveRectAmt = -moveRectAmt; //reverse translation when boundary is hit
  }
  popMatrix();
}

//This function uses loops to draw a grid of triangles pointing RIGHT
void drawAllTri() {
  for (int i=40; i<520; i+=160) { //row of triangles
    for (int j=width;j>stripeLen;j-=10) { //individual triangles in each row
      fill(121, 150, 260);
      pushMatrix();
      translate(j, i);
      drawTriangle();
      popMatrix();
    }
  }
  
  //This function uses loops to draw a grid of triangles pointing LEFT
    for (int i=200; i<600; i+=160) { //row of triangles
    for (int j=stripeLen;j<width;j+=10) { //individual triangles in each row
      fill(121, 150, 260);
      pushMatrix();
      translate(j+20, i-40); //translate to keep original position of triangle
      rotate(radians(180)); //rotate triangle 180 degrees to point left
      drawTriangle();
      popMatrix();
    }
  }
}

//This function draws a simple triangle at the origin.
void drawTriangle() {
  pushMatrix();
  beginShape();
  vertex(0, 0);
  vertex(20, 20);
  vertex(0, 40);
  endShape(CLOSE);
  popMatrix();
}

//Uses a loop to draw a grid of rectangles on the screen
void drawAllRect() {
  for (int i=0;i<520;i+=80) { //draw rows of rectangles
    for (int j=width; j>stripeLen; j-=10) { //draw individual rectangles in a row
      fill(158, 180, 200);
      pushMatrix();
      translate(j, i);
      drawRect();
      popMatrix();
    }
  }
}

//Function that draws a simple rectangle at the origin.
void drawRect() {
  pushMatrix();
  rect(0, 0, 20, 40);
  popMatrix();
}


