
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
    
int x = 40;                  // x coordinate
int y = 150;                 // y coordinate
int z = 200;                 // just for fun

//Draw code below  here
noStroke();

fill(255, 246, 173);
ellipse (600, 300, z+250, z+250); //white circle // increases size of circle

fill(49, 211, 142);
ellipse (130, x+250, 80-x, 80-x); //green circle // changes shape of circle, moves it along y-axis  

fill(252, 255-y, 77);
ellipse(450, x+115, 40+y, 40+y); //yellow circle // changes yellow to red, moves along y-axis

fill(49, 199, 211);
ellipse( 440, y+30, 20, 20); //blue circle // moves the circle along the y-axis







