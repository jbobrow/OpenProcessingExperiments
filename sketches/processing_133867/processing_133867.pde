
/*
Teresa Koh
Creative Computing Section B
Benjamin Bacon
*/
PImage img;
  img = loadImage("galaxy.jpg");
  size(600, 500);
  image(img, 0, 0, 600, 500);

size(600, 500);
smooth();

//Declare variable here
    
int x = 12;                  // x coordinate
int y = 200;                  // y coordinate

//Draw code below  here
noStroke();

fill(255, 246, 173);
ellipse (600, 300, 250, 250); //white circle

fill(49, 211, 142);
ellipse (x+130, y+250, 80, 80); //green circle //moves along x, and y axis

fill(252, 255, 77);
ellipse(450, x+115, 40, 40); //yellow circle // moves along y axis

fill(49, 199, 211);
ellipse( 440, y+30, 20, 20); //blue circle // moves along y axis







