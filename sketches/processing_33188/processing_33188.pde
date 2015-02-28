
PFont myDisplayFont;
PImage bg;
PImage moon;
PImage star1;
PImage star2;
PImage star3;
int star1Radius=30;
int star2Radius=30;
int star3Radius=30;

// First Shape
int z = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

// Second Shape
int z2 = 80;       // Width of the shape
float xpos2, ypos2;    // Starting position of shape

float xspeed2 = 4;  // Speed of the shape
float yspeed2 = 4;  // Speed of the shape

int xdirection2 = 1;  // Left or Right
int ydirection2 = 1;  // Top to Bottom

// Third Shape
int z3 = 20;       // Width of the shape
float xpos3, ypos3;    // Starting position of shape

float xspeed3 = 3;  // Speed of the shape
float yspeed3 = 3;  // Speed of the shape

int xdirection3 = 1;  // Left or Right
int ydirection3 = 1;  // Top to Bottom

int counter;

void setup() 
{
  
  background(102);
  bg = loadImage("bg.png");
  moon = loadImage("moon.png");
  star1 = loadImage("star1.png");
  star2 = loadImage("star2.png");
  star3 = loadImage("star3.png");
  counter = 0;
  
  size(640, 200);
  noStroke();
  frameRate(30);
  smooth();
  myDisplayFont = loadFont("Aharoni-Bold-48.vlw");

  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
  
  // Set the starting position of the second shape
  xpos2 = 100;
  ypos2 = 100;
  
  // Set the starting position of the third shape
  xpos3 = 300;
  ypos3 = 100;
  
  star1.resize(50,50);
  star2.resize(80,80);
  star3.resize(20,20);

}

void draw() 

{
  
  imageMode(CENTER);
  image(bg, 320, 100);
  
  imageMode(CENTER);
  image(moon, 320, 100);
  
  imageMode(CENTER);
  image(star1, xpos+z/2, ypos+z/2);
  
  imageMode(CENTER);
  image(star2, xpos2+z2/2, ypos2+z2/2);
  
  imageMode(CENTER);
  image(star3, xpos3+z3/2, ypos3+z3/2);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Update the position of the second shape
  xpos2 = xpos2 + ( xspeed2 * xdirection2 );
  ypos2 = ypos2 + ( yspeed2 * ydirection2 );
  
  // Update the position of the third shape
  xpos3 = xpos3 + ( xspeed3 * xdirection3 );
  ypos3 = ypos3 + ( yspeed3 * ydirection3 );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  
  if (xpos > width-z || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-z || ypos < 0) {
    ydirection *= -1;
  }
  
  // Shape 2
  if (xpos2 > width-z2 || xpos2 < 0) {
    xdirection2 *= -1;
  }
  if (ypos2 > height-z2 || ypos2 < 0) {
    ydirection2 *= -1;
  }  
  
    // Shape 3
  if (xpos3 > width-z3 || xpos3 < 0) {
    xdirection3 *= -1;
  }
  if (ypos3 > height-z3 || ypos3 < 0) {
    ydirection3 *= -1;
  }
  fill(255, 255, 255);
  textFont(myDisplayFont, 20);
  text("Good Night ^^", 30, 40);
  
  //pushMatrix();
  //translate(xPos, yPos);
  //rotate(.01*counter); //the .01 is what is changing the speed of the rotation
  //image(moon, 0, 0); // where myImageName is whatever you named your image
  //popMatrix();
  
}


