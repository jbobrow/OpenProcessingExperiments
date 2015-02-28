
// these are x and y values for levels
int x1;
int y1;
int x2;
int y2;
int x3;
int y3;
int x4;
int y4;
int x5;
int y5;
int x6;
int y6;
// x and y values for an ellipse
float xPos;
float yPos;
float w;
float h;
float rad;
float spdX;
float spdY;
float wind;
float gravity;

boolean cp1, cp2, cp3, cp4, cp5, cp6, cp7, cp8, cp9, cp10, cp11;


void setup() {
  size(600, 600);
  smooth();

  // these are defined x and y values for levels
  x1 = 600;
  x2 = 100;
  x3 = 0;
  x4 = 500;
  y1 = 100;
  y2 = 220;
  //y3 = 370; y3 looked too low, brought it up
  y3 = 350;
  y4 = 480;

  //size of ellipse
  xPos = 520;
  yPos = 20;
  w = 40;
  h = 40;
  rad = w/2;
  spdX = 0.0;
  spdY = 0.0;
  wind = 0.0;
  gravity = 0.5;

  cp1 = cp2 = cp3 = cp4 = cp5 = cp6 = cp7 = cp8 = cp9 = cp10 = cp11 = false;
}

void draw() {
  background(175, 99, 99, 10);
  strokeWeight(4);
  line(x1, y1, x2, y1);
  line(x3, y2, x4, y2);
  line(x1, y3, x2, y3);
  line(x3, y4, x4, y4);

  ellipse(xPos, yPos, w, h);

  // initial drop
  xPos += spdX;
  spdX += wind;
  yPos += spdY;
  spdY += gravity;

  // moves left on first level
  if (!cp1 && yPos > y1 - rad) {
    yPos = y1 - rad;
    spdY = 0;
    gravity = 0;
    wind = -0.03;
    cp1 = true;
    println("cp1");
  }

  // stops it from continuing to move to the left
  if (cp1 && !cp2 && xPos < x2 - rad) {
    spdX = 0;
    //remove wind, no need
    //wind = 0.03;
    cp2 = true;
    println("cp2");
  }

  // drops from first level to second level
  if (cp2 && !cp3 && yPos < y2 - rad) {
    spdX = 0;
    spdY = 1.0;
    gravity = 0.5;
    cp3 = true;
    println("cp3");
  }

  // causes barrel to move from left to right on second line
  if (cp3 && !cp4 && yPos > y2 - rad) {
    yPos = y2 - rad;
    spdY = 0.0;
    gravity = 0.0;
    wind = 0.03;
    cp4 = true;
    println("cp4");
  }

  // drops from second level to third level 
  if (cp4 && !cp5 && xPos > x4 + rad) {
    spdX = 0;
    spdY = 1.0;
    gravity = 0.5;
    //wind = -0.03;
    // wind was moved down
    cp5 = true;
    println("cp5");
  }

  // moves from right to left on third line
  if (cp5 && !cp6 && yPos > y3 - rad) {
    yPos = y3 - rad;
    spdY = 0.0;
    gravity = 0.0;
    wind = -0.03;
    cp6 = true;
    println("cp6");
  }

  // causes barrel to stop moving
  if (cp6 && !cp7 && xPos < x2 - rad) {
    spdX = 0;
    spdY = 0;
    gravity = 0.0;
    //remove wind, no need
    cp7 = true;
    println("cp7");
  }

  //doesn't work correctly from here on down

    //works correctly after making change in next if statement
  // should cause barrel to drop from third level to forth level
  if (cp7 && !cp8 && yPos < y4 - rad) {
    spdX = 0;
    spdY = 1.0;
    gravity = 0.5;
    cp8 = true;
    println("cp8");
  }

  // should cause barrel to move from left to right along forth line
  if (cp8 && !cp9 && yPos > y4 - rad) {
    yPos = y4 - rad;
    //left as y2, changed to y4 and started working correctly
    spdY = 0.0;
    gravity = 0.0;
    wind = 0.03;
    cp9 = true;
    println("cp9");
  }

  // should cause barrel to stop moving
  if (cp9 && !cp10 && xPos > x4 + rad) {
    spdX = 0;
    wind = 0.0;
    //remove wind, no need
    cp10 = true;
    println("cp10");
  }

  // drops from forth level off the screen
  if (cp10 && !cp11 && xPos > x4 + rad) {
    spdX = 0;
    spdY = 1.0;
    gravity = 0.5;
    cp11 = true;
    println("cp11");
  }
  //this currently does nothing, didn't work
  /*if (cp6 && yPos > y4 - rad) {
   spdX = 0;
   //spdY = 1.0;
   //gravity = 0.5;
   wind = 0.03;
   cp7 = true;
   }*/
  //this currently does nothing, didn't work
  /*
  if (cp7 && xPos > x4 + rad){
   //spdY = 1.0;
   //gravity = .5;
   //spdX = 1.5;
   cp8 = true;
   }
   */
   println("Thanks for all of your help James!");
}

