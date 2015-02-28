
void setup() {
  //sets the size of the sketch
  size (450, 450);
  //defaults the stroke to black
  stroke (0);
  //defaults to no fill
  noFill();
  //sets the background to black
  background (0);
}

void draw () {
  //constantly refreshes the background
  background (0);
  //calls the functions that draw the border
  //tried to get them all in one function, but was having issues
  drawBorder (0, 0);
  drawBorderBottom (0, 450);
  drawBorderRight (450, 0);
  //move the initial x and y co-ordinates to the center of the sketch
  translate (width/2, height/2);
  //variable that holds the function that rotates all artwork drawn after this point
  float newAngle = calculateAngle();
  rotate(newAngle);
  //calls the drawFlower function
  drawFlower (0, 0);
  //animates the position of all artwork drawn after this point based on the speed of the mouse
  float speed = abs(mouseX - pmouseX) + abs(mouseY - pmouseY);
  float speedX = abs(mouseX - pmouseX);
  float speedY = abs(mouseY - pmouseY);
  //if/else statement that animates the corner points when the mouse is pressed
  if (mousePressed) {
    //translates and rotates the stage to position each of the corners
    //sets their x and y positions so they animate as outlined above
    translate(-150, -150);
    rotate (radians(-135));
    drawCorner(speedX*5, speedY*5);
    translate(210, -210);
    rotate (radians(-90));
    drawCorner(speedX*5, speedY*5);
    translate(210, -210);
    rotate (radians(-90));
    drawCorner(speedX*5, speedY*5);
    translate (210, -210);
    rotate(radians(-90));
    drawCorner(speedX*5, speedY*5);
    //sets x and y positions so they are static when mouse is not pressed
  } 
  else {
    translate(-150, -150);
    rotate (radians(-135));
    drawCorner(0, 0);
    translate(210, -210);
    rotate (radians(-90));
    drawCorner(0, 0);
    translate(210, -210);
    rotate (radians(-90));
    drawCorner(0, 0);
    translate (210, -210);
    rotate(radians(-90));
    drawCorner(0, 0);
  }
}

//function that randomizes the color of the stroke each time the mouse is pressed
void mousePressed () {
  stroke (random(255), random(255), random(255));
}

//function that calculates the angle of the mouse in relation to the initial x, y coordinate 
//allows the artwork to rotate
float calculateAngle() {
  float xDiff = mouseX - (width/2);
  float yDiff = mouseY - (height/2);
  float angle = atan2(yDiff, xDiff);
  return angle;
}

/*BORDER*/

//function that uses a for loop to draw the top and left borders
void drawBorder (int xPos, int yPos) {
  //sets fill to black
  fill(0);
  //horizontal, top
  for (int c = xPos; c < (xPos + 440); c+=40) {
    for (int r = yPos; r < (yPos + 20); r+=20) {
      bezier (c, r, c+20, r+15, c+40, r+15, c+50, r);
    } 
  }
  //vertical, left
  for (int c = yPos; c < (yPos + 440); c+=40) {
    for (int r = xPos; r < (xPos + 20); r+=20) {
      bezier (r, c, r+15, c+20, r+15, c+40, r, c+50);
    } 
  }
  //removes fill so the other artwork won't have one
  noFill();
}

//function that uses a for loop to draw the bottom border
void drawBorderBottom (int xPos, int yPos) {
  fill (0);
  //horizontal, bottom
  for (int c = xPos; c < (xPos + 440); c+=40) {
    for (int r = yPos; r < (yPos + 20); r+=20) {
      bezier (c, r, c+20, r-15, c+40, r-15, c+50, r);
    } 
  }
  //removes fill so the other artwork won't have one
  noFill();
}

//function that uses a for loop to draw the right border
void drawBorderRight (int xPos, int yPos) {
  fill (0);
  //vertical, right
  for (int c = yPos; c < (yPos + 440); c+=40) {
    for (int r = xPos; r < (xPos + 20); r+=20) {
      bezier (r, c, r-15, c+20, r-15, c+40, r, c+50);
    } 
  }
  //removes fill so the other artwork won't have one
  noFill();
}

/*FLOWER*/

//function that draws circles that make up the center of the flower
void flowerCenter(float xPos, float yPos) {
  ellipse (xPos, yPos-6, 7, 7);
  rotate(radians(70));
  ellipse (xPos, yPos-6, 7, 7);
  rotate(radians(70));
  ellipse (xPos, yPos-6, 7, 7);
  rotate(radians(70));
  ellipse (xPos, yPos-6, 7, 7);
  rotate(radians(70));
  ellipse (xPos, yPos-6, 7, 7);
}

//function that draws one petal
//allows me to set the size of the petal later
void drawPetal(float xPos, float yPos, float h) {
  float bezierH = h /3;
  float bezierV = h /3;
  bezier(xPos, yPos, xPos + bezierH, yPos + bezierV, xPos + bezierH, (yPos + h) - bezierV, xPos, yPos + h);
  bezier(xPos, yPos + h, xPos - bezierH, (yPos + h) - bezierV, xPos - bezierH, yPos + bezierV, xPos, yPos);
}

//function that draws a complete leaf 
//uses two different sized petals
void drawLeaf(float xPos, float yPos) {
  ellipse (xPos, yPos, 7, 7);
  ellipse (xPos, yPos, 34, 34);
  drawPetal(xPos,yPos+17, 90);
  drawPetal(xPos,yPos+17, 60);
}

//function that draws the teardrop flanked by two dots 
//when repeated, they surround the flower
void drawDotsAndDrop (float xPos, float yPos) {
  bezier (xPos, yPos, xPos-28, yPos+40, xPos+1, yPos+40, xPos, yPos);
  ellipse (xPos+3, yPos+26, 7, 7);
  ellipse (xPos-18, yPos+18, 7, 7);
}

//function that uses each of the above funtions to draw a complete flower
//repeats and rotates each leaf around the center
void drawFlower(float xPos, float yPos) {
  flowerCenter(xPos, yPos);
  drawLeaf(xPos, yPos);
  drawDotsAndDrop (xPos-30, yPos+70);  
  rotate(radians(45));
  drawLeaf(xPos, yPos);
  drawDotsAndDrop (xPos-30, yPos+70);
  rotate(radians(45));
  drawLeaf(xPos, yPos);
  drawDotsAndDrop (xPos-30, yPos+70);
  rotate(radians(45));
  drawLeaf(xPos, yPos);
  drawDotsAndDrop (xPos-30, yPos+70);
  rotate(radians(45));
  drawLeaf(xPos, yPos);
  drawDotsAndDrop (xPos-30, yPos+70);
  rotate(radians(45));
  drawLeaf(xPos, yPos);
  drawDotsAndDrop (xPos-30, yPos+70);
  rotate(radians(45));
  drawLeaf(xPos, yPos);
  drawDotsAndDrop (xPos-30, yPos+70);
  rotate(radians(45));
  drawLeaf(xPos, yPos);
  drawDotsAndDrop (xPos-30, yPos+70); 
}

/*CORNER PIECES*/

//function that draws the teardrop shapes that go inside each corner piece
void drawDrops (float xPos, float yPos) {
  bezier (xPos, yPos, xPos-13, yPos+65, xPos+13, yPos+65, xPos, yPos);
  bezier (xPos, yPos, xPos-25, yPos+30, xPos-2, yPos+30, xPos, yPos);
  bezier (xPos, yPos, xPos+25, yPos+30, xPos-2, yPos+30, xPos, yPos);
}

//function that draws each corner piece
//uses the drop function and the petal function from the flower section above
void drawCornerPiece (float xPos, float yPos) {
  drawDrops(xPos, yPos);
  drawPetal(xPos,yPos, 90);
  drawPetal(xPos,yPos, 70);
}

//takes the corner piece function and repeats it/rotates it to create a full corner
void drawCorner (float xPos, float yPos) {
  drawCornerPiece (xPos, yPos);
  rotate(radians(-90));
  drawCornerPiece (xPos, yPos);
  rotate(radians(-90));
  drawCornerPiece (xPos, yPos);
}


//captures and saves a .png of the artwork when the 'C' key is pressed
void keyPressed() {
  if (key =='c' || key == 'C') {
    save ("robin_animate.png");
  }
}



