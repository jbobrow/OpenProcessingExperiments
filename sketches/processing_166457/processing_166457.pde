
int  squareX,  squareY;      
// Position of square button
int circleX, circleY;  
// Position of circle button
int  squareSize = 90;     
// Diameter of rect
int circleSize = 93;   
// Diameter of circle
color  squareColor, circleColor, baseColor;
//sets color variables
color squareHighlight, circleHighlight;
//sets highlight variables
color currentColor;
//sets currrent color variable
boolean  squareOver = false;
//Datatype for the Boolean values true and false. It is common to use boolean values with control statements to determine the flow of a program
boolean circleOver = false;
//Datatype for the Boolean values true and false. It is common to use boolean values with control statements to determine the flow of a program

int w=400;
//width
int h=110;
//height

PFont f;
//font variable

PShape square;
//shape variable

void setup() {
  // runs the code only once
  size(500, 400, P2D);
  //sets the size of the sketch to 500 px in width and 400 px in height
  squareColor = color(0);
  //sets square color to black
   squareHighlight = color(51);
   //sets square hightlight color to dark gray
  circleColor = color(255);
  //sets circle color to white
  circleHighlight = color(204);
  //sets circle highlight color to light gray
  baseColor = color(102);
  //sets base color to gray
  currentColor = baseColor;
  //sets current color to gray
  circleX = width/2+circleSize/2+10;
  //circle x width
  circleY = height/2;
  //circle y height
  squareX = width/2- squareSize-10;
  //square x width
  squareY = height/2- squareSize/2;
  //square y hight
  ellipseMode(CENTER);
  //centers ellipise

  f = createFont("Arial",14,true); 
// set the FontSize to the height of the rect

 square = createShape(RECT, 0, 0, 90, 90);
 //creates Pshape
}

void draw() {
  // runs the code as a loop at the default frame rate
  update(mouseX, mouseY);
  background(currentColor);
  //sets background to current color which is gray
  
  String s = "Click shape to change the background color...";
  //first lint of text
  
  String b = "Black"; 
  //text under the square
  
  String c = "White";
  //text under the circle 
  
  fill(175);
  text(s,50+(w-textWidth(s))/2,50+h/2+2);
  //posistion for the first line of text
  
  fill (0);
  text(b,-5+(w-textWidth(b))/2,220+h/2);
  //posistion for the text under the square
  
  fill (255);
  text(c,105+(w-textWidth(c))/2,220+h/2);
  //posistion for the text under the circle
  
  shape(square, 150, 155);
  //square shape
  
  if ( squareOver) {
    fill( squareHighlight);
    //mouse over square change to highlight color
  } else {
    fill( squareColor);
    //if not square stays black
  }
  stroke(255);
  //white stroke around square
  rect(150, 155, 90, 90);
  //size & location of square
  
  if (circleOver) {
    fill(circleHighlight);
    //mouse over circle change to highlight color
  } else {
    fill(circleColor);
    //if not square stays white
  }
  stroke(0);
  //black stroke around circle
  ellipse(circleX, circleY, circleSize, circleSize);
  //size & location of circle
}

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    //if mouse over circle change color
   squareOver = false;
   //of mouse over square change color
  } else if ( oversquare(squareX, squareY, squareSize, squareSize) ) {
    squareOver = true;
    circleOver = false;
  } else {
    circleOver = squareOver = false;
  }
}

void mousePressed() {
  if (circleOver) {
    currentColor = circleColor;
    //if you click on the circle the background changes to the color of the circle, white
  }
  if (squareOver) {
    currentColor = squareColor;
    //if you click on the square the background changes to the color of the circle, black
  }
}

boolean oversquare(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
