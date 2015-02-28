
/*****************************************
 * Assignment 02
 * Name:         James Reingruber
 * E-mail:       jreingru@haverford.edu
 * Course:       CS 110 - Section 01
 * Submitted:    September 19, 2012
 * 
 * This is a sketch of a summer night time scene.  A more detailed description of the sketch can be found in the attached word document titled "sketch02jreingru.docx"  
 ***********************************************/


//Declare Variables
float starColor1;
float starColor2;
float starColor3;
float triangleVerticalPosition;
float triangleHorizontalPosition;
float mushroomRed;
float mushroomBlue;
float mushroomGreen;
float petalLength = 60;
float moonLocation;


void setup() {

  //set processing canvas
  size(500, 500);
  background(255);

  //generate random values in following variables
  starColor1 = random(0, 255);
  starColor2 = random(0, 255);
  starColor3 = random(0, 255);
  triangleVerticalPosition = random(-60, 0);
  triangleHorizontalPosition = random(-50, 0);
  mushroomRed = random (0, 255);
  mushroomBlue = random (0, 255);
  mushroomGreen = random (0, 255);
  petalLength = random (60, 85);

  //create grass
  fill (0, 200, 0);
  rect (0, 300, 500, 300);
  //create sky
  fill (1, 35, 124);
  rect (0, 0, 500, 300);

  //moon will follow mouse x- coordinate location
  moonLocation = mouseX;

  //Moon will go from crescent to full moon as mouse travels across screen 
  noStroke ();
  if (mouseX < 100) {
    fill (255);
    ellipse (moonLocation, 50, 50, 50);
    fill (1, 35, 124);
    ellipse (moonLocation - 10, 50, 50, 50);
  } 
  else if (moonLocation > 100 && moonLocation < width/2) {
    fill (255);
    ellipse (moonLocation, 50, 50, 50);
    fill (1, 35, 124);
    ellipse (moonLocation - 20, 50, 50, 50);
  } 
  else if (moonLocation > width/2 && moonLocation < 400) {
    fill (255);
    ellipse (moonLocation, 50, 50, 50);
    fill (1, 35, 124);
    ellipse (moonLocation - 30, 50, 50, 60);
  } 
  else if (moonLocation > 400 && moonLocation < 500) {
    fill (255);
    ellipse (moonLocation, 50, 50, 50);
  }
  //star colors will change everytime background is cleared
  fill (starColor1, starColor2, starColor3);

  //star locations will change everytime background is cleared
  float tx1 = 60 + triangleHorizontalPosition;
  float ty1 = 90 + triangleVerticalPosition;
  float tx2 = 70 + triangleHorizontalPosition;
  float ty2 = 70 + triangleVerticalPosition;
  float tx3 = 80 + triangleHorizontalPosition;
  float ty3 = 90 + triangleVerticalPosition;


  while (tx1 <= 480) {
    triangle (tx1, ty1, tx2, ty2, tx3, ty3);

    tx1 = tx1 + 30;
    tx2 = tx2 + 30;
    tx3 = tx3 + 30;
  }

  float ttx1 = 60 + triangleHorizontalPosition;
  float tty1 = 78 + triangleVerticalPosition;
  float ttx2 = 80 + triangleHorizontalPosition;
  float tty2 = 78 + triangleVerticalPosition;
  float ttx3 = 70 + triangleHorizontalPosition;
  float tty3 = 98 + triangleVerticalPosition;


  while (ttx1 <= 480) {
    triangle (ttx1, tty1, ttx2, tty2, ttx3, tty3);

    ttx1 = ttx1 + 30;
    ttx2 = ttx2 + 30;
    ttx3 = ttx3 + 30;
  }

  // create mushroom coordinates
  stroke (0);
  float mushroomX = 20;
  float mushroomy1 = 480;
  //color mushroom using randomly generated values
  stroke(0);
  fill (mushroomRed, mushroomGreen, mushroomBlue);
  //use while loop to create multiple mushrooms
  while (mushroomX <= 480) {

    line (mushroomX, mushroomy1, mushroomX, mushroomy1 + 10);
    ellipse (mushroomX, mushroomy1, 10, 5);
    mushroomX = mushroomX + 30;
  }

  //create flower stalk and center
  rectMode (CORNER);
  fill (0, 255, 0);
  rect (250, 220, 10, 150);
  fill (67, 24, 4);
  ellipseMode (CENTER);

  //create flower petals and have them randomly change petal length
  fill (250, 225, 30);
  ellipse (255, 275, 20, petalLength);
  ellipse (205, 225, petalLength, 20);  
  ellipse (305, 225, petalLength, 20);
  ellipse (255, 175, 20, petalLength);
  fill (67, 24, 4);
  ellipse (255, 225, 40, 40);
}




void draw() {
}

void mousePressed() {
  if (mouseX > width/2 && mouseY < 300) {
    //create normal bee if mouse is clicked in upper right half of picture    
    //create bee wing by rotating ellipse
    fill(196, 206, 205);
    pushMatrix();
    translate (mouseX + 70, mouseY);
    rotate (radians(45));
    ellipse (-10, -25, 40, 70);
    popMatrix();

    // create bee head 
    fill (229, 229, 12);
    ellipse (mouseX, mouseY, 60, 60);
    line (mouseX + 10, mouseY - 20, mouseX + 40, mouseY - 50);
    line (mouseX - 10, mouseY - 20, mouseX -40, mouseY - 50);
    fill (0);
    ellipse (mouseX + 15, mouseY - 9, 20, 30);
    ellipse (mouseX - 15, mouseY - 9, 20, 30);
    fill (0);
    ellipse (mouseX + 40, mouseY - 50, 4, 4);
    ellipse (mouseX -40, mouseY - 50, 4, 4);

    // create bee body
    fill (229, 229, 12);
    ellipse (mouseX + 80, mouseY, 100, 50);
    strokeWeight (10);
    line (mouseX + 80, mouseY + 22, mouseX + 80, mouseY - 22);
    line (mouseX + 55, mouseY + 17, mouseX + 55, mouseY - 17);
    line (mouseX + 105, mouseY + 17, mouseX + 105, mouseY - 17);
    strokeWeight (1);

    //create second bee wing
    fill(196, 206, 205);
    pushMatrix();
    translate (mouseX + 80, mouseY);
    rotate (radians(45));
    ellipse (-10, -25, 40, 70);
    popMatrix();

    //create mutant bee if mouse is clicked in upper left half of picture
  } 
  else if (mouseX < width/2  && mouseY < 300) {

    //create bee wing
    fill(196, 206, 205);
    pushMatrix();
    translate (mouseX + 70, mouseY);
    rotate (radians(45));
    ellipse (-10, -25, 40, 70);
    popMatrix();

    //create bee head 
    fill (11, 219, 179);
    ellipse (mouseX, mouseY, 60, 60);
    line (mouseX + 10, mouseY - 20, mouseX + 40, mouseY - 50);
    line (mouseX - 10, mouseY - 20, mouseX -40, mouseY - 50);
    fill (0);
    ellipse (mouseX + 15, mouseY - 9, 20, 30);
    ellipse (mouseX - 15, mouseY - 9, 20, 30);
    fill (255, 0, 0);
    ellipse (mouseX + 40, mouseY - 50, 4, 4);
    ellipse (mouseX -40, mouseY - 50, 4, 4);

    // create bee body
    fill (159, 11, 219);
    ellipse (mouseX + 80, mouseY, 100, 50);
    strokeWeight (10);
    line (mouseX + 80, mouseY + 22, mouseX + 80, mouseY - 22);
    line (mouseX + 55, mouseY + 17, mouseX + 55, mouseY - 17);
    line (mouseX + 105, mouseY + 17, mouseX + 105, mouseY - 17);
    strokeWeight (1);

    //create bee wing
    fill(196, 206, 205);
    pushMatrix();
    translate (mouseX + 80, mouseY);
    rotate (radians(45));
    ellipse (-10, -25, 40, 70);
    popMatrix();
   
    // create tall worm creeping out of hole if mouse clicked in lower, left half of picture
  } 
  else if ( mouseX < width/2 && mouseY > 300) {
    //create worm hole
    fill (0); 
    ellipse (mouseX, mouseY + 10, 70, 20);
    //create tall worm body
    fill (106, 58, 18);
    rect (mouseX - 11, mouseY, 21, 16);
    stroke (106, 58, 18);
    strokeWeight (20); 
    strokeCap (ROUND);
    line (mouseX, mouseY, mouseX, mouseY - 80);
    strokeWeight (1);
    stroke (0);
    line (mouseX - 9, mouseY - 10, mouseX + 9, mouseY - 10);
    line (mouseX - 9, mouseY - 30, mouseX + 9, mouseY - 30);
    line (mouseX - 9, mouseY - 50, mouseX + 9, mouseY - 50);
    //create worm eyes and mouth
    fill (0);
    ellipse (mouseX - 4, mouseY - 80, 5, 12);
    ellipse (mouseX + 4, mouseY - 80, 5, 12);
    ellipse (mouseX, mouseY - 67, 10, 10);
    //if mouse is clicked in lower right half of picture, create short worm barely peeking out of hole
  } 
  else {
    //create worm hole
    fill (0); 
    ellipse (mouseX, mouseY + 10, 70, 20);
    //create worm body
    fill (106, 58, 18);
    rect (mouseX - 11, mouseY, 21, 16);
    stroke (106, 58, 18);
    strokeWeight (20); 
    strokeCap (ROUND);
    line (mouseX, mouseY, mouseX, mouseY - 15);
    strokeWeight (1);
    stroke (0);
    //create worm mouth and eyes
    fill (0);
    ellipse (mouseX - 4, mouseY - 15, 5, 12);
    ellipse (mouseX + 4, mouseY - 15, 5, 12);
    ellipse (mouseX, mouseY - 2, 10, 10);
  }
}
//if key is pressed, regenerate background (the follwoing code is almost identical to the coding found under void setup ()
void keyPressed() {
  size(500, 500);
  background(255);
  starColor1 = random(0, 255);
  starColor2 = random(0, 255);
  starColor3 = random(0, 255);
  triangleVerticalPosition = random(-60, 0);
  triangleHorizontalPosition = random(-50, 0);
  mushroomRed = random (0, 255);
  mushroomBlue = random (0, 255);
  mushroomGreen = random (0, 255);
  petalLength = random (60, 85);
  //grass
  fill (0, 200, 0);
  rect (0, 300, 500, 300);
  //sky
  fill (1, 35, 124);
  rect (0, 0, 500, 300);
  //moon
  moonLocation = mouseX;

  //Moon Grows Larger across page
  noStroke ();
  if (mouseX < 100) {
    fill (255);
    ellipse (moonLocation, 50, 50, 50);
    fill (1, 35, 124);
    ellipse (moonLocation - 10, 50, 50, 50);
  } 
  else if (moonLocation > 100 && moonLocation < width/2) {
    fill (255);
    ellipse (moonLocation, 50, 50, 50);
    fill (1, 35, 124);
    ellipse (moonLocation - 20, 50, 50, 50);
  } 
  else if (moonLocation > width/2 && moonLocation < 400) {
    fill (255);
    ellipse (moonLocation, 50, 50, 50);
    fill (1, 35, 124);
    ellipse (moonLocation - 30, 50, 50, 60);
  } 
  else if (moonLocation > 400 && moonLocation < 500) {
    fill (255);
    ellipse (moonLocation, 50, 50, 50);
  }
  //stars
  fill (starColor1, starColor2, starColor3);
  float tx1 = 60 + triangleHorizontalPosition;
  float ty1 = 90 + triangleVerticalPosition;
  float tx2 = 70 + triangleHorizontalPosition;
  float ty2 = 70 + triangleVerticalPosition;
  float tx3 = 80 + triangleHorizontalPosition;
  float ty3 = 90 + triangleVerticalPosition;


  while (tx1 <= 480) {
    triangle (tx1, ty1, tx2, ty2, tx3, ty3);

    tx1 = tx1 + 30;
    tx2 = tx2 + 30;
    tx3 = tx3 + 30;
  }

  float ttx1 = 60 + triangleHorizontalPosition;
  float tty1 = 78 + triangleVerticalPosition;
  float ttx2 = 80 + triangleHorizontalPosition;
  float tty2 = 78 + triangleVerticalPosition;
  float ttx3 = 70 + triangleHorizontalPosition;
  float tty3 = 98 + triangleVerticalPosition;


  while (ttx1 <= 480) {
    triangle (ttx1, tty1, ttx2, tty2, ttx3, tty3);

    ttx1 = ttx1 + 30;
    ttx2 = ttx2 + 30;
    ttx3 = ttx3 + 30;
  }

  // Mushrooms
  float mushroomX = 20;
  float mushroomy1 = 480;

  stroke(0);
  fill (mushroomRed, mushroomGreen, mushroomBlue);

  while (mushroomX <= 480) {

    line (mushroomX, mushroomy1, mushroomX, mushroomy1 + 10);
    ellipse (mushroomX, mushroomy1, 10, 5);
    mushroomX = mushroomX + 30;
  }

  //flower stem and center
  rectMode (CORNER);
  fill (0, 255, 0);
  rect (250, 220, 10, 150);
  fill (67, 24, 4);
  ellipseMode (CENTER);

  //flower petals

  fill (250, 225, 30);
  ellipse (255, 275, 20, petalLength);
  ellipse (205, 225, petalLength, 20);  
  ellipse (305, 225, petalLength, 20);
  ellipse (255, 175, 20, petalLength);
  fill (67, 24, 4);
  ellipse (255, 225, 40, 40);
}
