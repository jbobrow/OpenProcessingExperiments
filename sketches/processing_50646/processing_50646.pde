
int x;
int y;
int directionx;
int directiony;
int rectx;
int recty;
int rectdirectionx;
int smallx;
int smally;
int directionsmallx;
int directionsmally;

//runs once
void setup () {
  size (600, 600);
  x = 10;
  y = 150;
  directionx = 3;
  directiony = 3;
  rectx = 0;
  recty = 590;
  rectdirectionx = 5;
  smallx = 0;
  smally = 400;
  directionsmallx = 2;
  directionsmally = 2;
  smooth();
}

//runs every frame
void draw () {
  background (320);
  noStroke();
  x +=directionx;  // same as  x = x + directionx;
  y +=directiony;
  fill (0, 206, 205);
  ellipse (x, y, 50, 50);
  fill (99, 8, 250);
  ellipse (smallx, smally, 20, 20);
  smallx = smallx + directionsmallx;
  smally = smally + directionsmally;
  if (y > 590) {
   directiony = -1;
  } 
  if (x > 590) {
    directionx = -4;
  }   
  if (x < 10) {
   directionx = + 3; 
  }
  if (y < 10) {
   directiony = + 3; 
  }
  //small ellipse behavior
  if (smally > 590) {
   directionsmally = -2;
  } 
  if (smallx > 590) {
    directionsmallx = -6;
  }   
  if (smallx < 10) {
   directionsmallx = + 5; 
  }
  if (smally < 10) {
   directionsmally = + 5; 
  }
  fill (200, 200, 250);
  rect (rectx, recty, 200, 10);
  rectx = rectx + rectdirectionx;
  if (rectx >= 400) {
    rectdirectionx = -3;
   }
  if (rectx <= 0) {
    rectdirectionx = 3;
    }
  if ((y >= recty) && (x >= rectx) && (x < rectx + 200)) {
    directiony = - 15;
   }
   if ((smally >= recty) && (smallx >= rectx) && (smallx < rectx + 200)) {
    directionsmally = - 25;
   } 
  }

