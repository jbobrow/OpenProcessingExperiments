

//---Mandala Maze
//---by Amanda Thai


//Variables
int x, y;
int square = 26;
int circle = 10;
int circleNormal = 255;
int circlePressed = 120;
PImage img;

//Setup
void setup() {
  size(600, 600);
  img = loadImage("image.jpg");
}

//Draw
void draw() {
  background(242, 197, 105);
  image(img, 0, 0);
  x = mouseX;
  y = mouseY;

  //---------------MANDALA CIRCLE---------------
  fill(171, 252, 222); 
  noStroke();
  ellipse(width/2, height/2, 500, 500);

  //---------------TUNNELS---------------
  //tunnels to center
  fill(242, 197, 105);
  rectMode(CORNER);
  //left
  rect(25, height/2 - square/2, 262, 25);
  //right
  rect(313, height/2 - square/2, 262, 25);
  //top
  rect(width/2 - square/2, 25, 25, 262);
  //bottom
  rect(width/2 - square/2, 313, 25, 262);

  //---------------HORIZONAL TUNNELS INSIDE QUADS---------------
  //tunnel in top left quad
  fill(242, 197, 105);
  rectMode(CORNER);
  rect(50, height/4, 262 - 25, 25);

  //tunnel in top right quad
  fill(242, 197, 105);
  rectMode(CORNER);
  rect(312, height/4, 262 - 25, 25);

  //tunnel in bottom left quad
  fill(242, 197, 105);
  rectMode(CORNER);
  rect(50, height/2 + height/5, 262 - 25, 25);

  //tunnel in bottom right quad
  fill(242, 197, 105);
  rectMode(CORNER);
  rect(312, height/2 + height/5, 262 - 25, 25);

  //---------------VERTICAL TUNNELS INSIDE QUADS---------------
  //tunnel in top left quad
  fill(242, 197, 105);
  rectMode(CORNER);
  rect(width/4, 50, 25, 262 - 25);

  //tunnel in top right quad
  fill(242, 197, 105);
  rectMode(CORNER);
  rect(width/2 + width/5, 50, 25, 262 - 25);

  //tunnel in bottom left quad
  fill(242, 197, 105);
  rectMode(CORNER);
  rect(width/4, 312, 25, 262 - 25);

  //tunnel in bottom right quad
  fill(242, 197, 105);
  rectMode(CORNER);
  rect(width/2 + width/5, 312, 25, 262 - 25);



  //---------------CURSOR & CIRCLE---------------
  fill(circleNormal);
  ellipse(x, y, circle, circle);


  //---------------IF MOUSE TOUCHES SIDE OF TUNNELS & MOUSE RELEASED---------------
  if ((mousePressed == true) && (x > width/2 + width/5 + circle/2) && (x < width/2 + width/5 + square - circle/2)) {
   centerSquare();
  }
  else if ((mousePressed == true) && (x > width/4 + circle/2) && (x < width/4 + square - circle/2)) {
    centerSquare();
  }
  else if ((mousePressed == true) && (y > height/2 + height/5 + circle/2) && (y < height/2 + height/5 + square - circle/2)) {
    centerSquare();
  }
  else if ((mousePressed == true) && (y > height/4 + circle/2) && (y < height/4 + square - circle/2)) {
    centerSquare();
  }
  else if ((mousePressed == true) && (x > width/2 - square/2 + circle/2) && (x < width/2 + square/2 - circle/2)) {
    centerSquare();
  }
  else if ((mousePressed == true) && (y > height/2 - square/2 + circle/2) && (y < height/2 + square/2 - circle/2)) {
    centerSquare();
  }
  //Winning Message
  else if ((mousePressed == true) && (x > width/2 - square/2 && x < width/2 + square/2 && y > height/2 - square/2 && y < 
    height/2 + square/2)) {
    textSize(50);
    fill(90);
    text("Nice Job!", width/3, height/3);
  }
  //Red Warning
  else {
    fill(234, 50, 50);
    rectMode(CENTER);
    rect(width/2, height/2, square, square);
  }

  //---------------GAME DIRECTIONS---------------
  textSize(12);
  fill(0);
  text("While holding down the mouse, move through the maze without touching the blue parts.", 50, 15);

  //---------------SAVES IMAGE VERSIONS---------------
  save("mandala.tif");
  save("mandala.jpg");
}

 //---------------GREEN CENTER SQUARES---------------
void centerSquare() { //feed the x & y intergers in the function
    fill(111, 144, 63);
    rectMode(CENTER);
    rect(width/2, height/2, square, square);
}



