
int xsize = 7; //width of rings
int ysize = 3; //height of rings
int halfwsizex = 400; //sets the size of half the window (x axis)
int halfwsizey = 400; //sets the size of half the window (y axis)
/*
 [NOTE: REMEMBER TO DIVIDE YOUR DESIRED WINDOW SIZE BY 2 BEFORE 
 INPUTTING THE NUMBERS. I DO THIS B/C THE WINDOW SIZE MUST BE EVEN]
 */

/*
 interesting settings: feel free to add more if you find some cool ones!
 format: (xsize, ysize, halfwsizex, halfwsizey)
 (3, 7, 400, 900)
 (1, 1, 200, 200)
 (7, 2, 600, 600)
 */

float z = 1 / xsize;

/*
 the float "z" isn't always necessary, but it is used to make sure
 that there are enough rings to fill up the entire area, which is
 almost always true unless xsize and ysize are both 1 or 2
 */

int kyletan;

/*
 the kyletan variable is pretty much a boolean that pays
 homage to the legendary programmer kyletan, a personal 
 hero of mine. It can either be 0 or 1. It dictates whether
 the for loop has ran more an even or an odd number of times
 */

void setup() {
  size(halfwsizex * 2, halfwsizey * 2);
  strokeCap(SQUARE);
}
//the setup function sets misc sizes

/*
 the draw function is the base of my code, it does most of the number
 crunching, but calls on other functions to actually do the drawing,
 so the name is a bit counterintuitive
 */

void draw() {
  //this for-loop is executed as many times as it will ever be needed
  it controls pretty much the entire code
    for (int a = halfwsizex + halfwsizey; a > 0; a--) {
    kyletan = a % 2; //checks if the for-loop is on an even numbered rep. outputs == 1 or 0
    noStroke();
    if (kyletan == 0) {
      fill(0);
    } 
    else {
      fill(255);
    }
    //the if/else filter above uses the kyletan variable set the ring color
    //the combination of the above codes is what makes the colors of the rings alternate

    noStroke(); //an actual stroke width would make the sizing calculations innacurate
    drawEllipse(a);
    if (kyletan == 0) {
      fill(0);
      stroke(255);
    } 
    else {
      fill(255);
      stroke(0);
    }

    /*
     the if/else filter below is the same thing as the if/else loop above,
     except it changes the stroke color as well and it changes the fill
     to the opposite color. This code is responsible for the color
     of the lines differing from the colors of the rings
     */

    if (xsize > ysize) {
      strokeWeight(ysize);
    }
    else {
      strokeWeight(xsize);
    }
    drawLine(kyletan, a);
  }
  overlayDiamond();
  //calls the diamond-drawing function. only happens once per rotation.
}

void overlayDiamond() {
  stroke(0);
  fill(255);

  beginShape();
  // upper right
  vertex(halfwsizex, 0);
  vertex(halfwsizex * 1.5, 0);
  vertex(halfwsizex * 2, halfwsizey / 2);
  vertex(halfwsizex * 2, halfwsizey);
  vertex(halfwsizex, 0);
  endShape();
  
  beginShape();
  // lower right
  vertex(halfwsizex * 2, halfwsizey);
  vertex(halfwsizex * 2, halfwsizey * 1.5);
  vertex(halfwsizex * 1.5, halfwsizey * 2);
  vertex(halfwsizex, halfwsizey * 2);
  vertex(halfwsizex * 2, halfwsizey);
  endShape();
  
  beginShape();
  // lower left
  vertex(halfwsizex, halfwsizey * 2);
  vertex(halfwsizex / 2, halfwsizey * 2);
  vertex(0, halfwsizey * 1.5);
  vertex(0, halfwsizey);
  vertex(halfwsizex, halfwsizey * 2);
  endShape();
  
  beginShape();
  // upper left
  vertex(0, halfwsizey);
  vertex(0, halfwsizey / 2);
  vertex(halfwsizex / 2, 0);
  vertex(halfwsizex, 0);
  vertex(0, halfwsizey);
  endShape();
}

/*
 the code above is very self explanatory, it draws 
 the diamond shape that always appears over the
 rings because it is not part of the for-loop, and
 is called last 
 */

void drawLine(int bl, int b) {
  if (bl == 0) {
    line(halfwsizex - b * xsize - 1, halfwsizey, halfwsizex + b * xsize + 1, halfwsizey);
    line(halfwsizex, halfwsizey - b * ysize - 1, halfwsizex, halfwsizey + b * ysize + 1);
  }
  else {
    line(halfwsizex - b * xsize + 1, halfwsizey, halfwsizex + b * xsize - 1, halfwsizey);
    line(halfwsizex, halfwsizey - b * ysize + 1, halfwsizex, halfwsizey + b * ysize - 1);
  }
}

/* 
 this code is very self explanatory, it draws 
 the diamond shape that always appears over 
 the rings because it is executed last in the
 draw function, and is not part of the for-loop 
 */

void drawEllipse(int b) {
  ellipse(halfwsizex, halfwsizey, b * 2 * xsize, b * 2 * ysize);
}

/* 
 the code below is the ellipse drawing code, it repeats many times,
 but is executed before the line drawing code, and therefore appears
 to be underneath the lines 
 */
