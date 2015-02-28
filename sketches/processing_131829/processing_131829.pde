
//global variables

int xLoc; //set value in setup because based on the screen size.
int yLoc; 
int rectWidth = 200;
int rectHeight = rectWidth/2;
int rectCornerRad = 10;
int ellipseDia = rectHeight/2;

void setup() {  //setup function called initially, only once
  size(600, 600);

     xLoc = width/2;
     yLoc = height/2;
}

void draw() {  //draw function loops 
  background(255);  //reset background to white and erase all previous contents
 strokeWeight(2);
 
 //create a set of shapes that are relative to one another
 fill(64);
 rectMode(CENTER);
 rect(xLoc, yLoc, rectWidth, rectHeight, rectCornerRad, rectCornerRad);
 fill(128);   
 ellipseMode(CENTER);
 ellipse(xLoc + rectWidth/2, yLoc, ellipseDia, ellipseDia);
 ellipse(xLoc - rectWidth/2, yLoc, ellipseDia, ellipseDia);
 
 //move set of shapes to the left;
 //xLoc--;
 
 //move set of shapes to the right;
 //xLoc++;
 
 //move set of shapes up;
 //yLoc--;
 
 //move set of shapes down;
 //yLoc++;
 
 //move set of shapes with the mouse;
 xLoc = mouseX;
 yLoc = mouseY;
 
}
