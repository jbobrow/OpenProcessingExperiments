
/*
Project 02 | Computational Methods | System Study | Allison Etheredge

This simulation is looking at the interation between an "exploding" white comet and
smaller red comets randomly filling the field. As the white comet hits the horizontal
wall (along the y-axis) the comet changes direction, as the white comet hits the 
vertical wall (along the x-axis) the comet changes direction and "explodes" - creating 
an interaction with the red comets by erasing their trails. The system repeats.

Red comets react to a simple black and white image of pods 'hidden' in the system. 
The comets are told to take straight paths through the white space of the image, when 
the red comet hits the black space of the pod, the comet becomes trapped on a horizontal
path through the pod. The red comet works its way through the pod at a slightly slower
speed, when the red comet crosses the pod and reaches the edge of the pod the red comet
shoots out exiting on an angled, random path. It is interesting to study the behaviors 
of these comets and how they interact with one another.


Borrowed Code: Credit to Nick Senske for his imgWalker code (slightly modified below) 
Using Class Walker (from imgWalker) to set the dispersal of the Red Comets
*/




// --------------------- Declare Comet Variables ----------------------------------------------------------------------------------------------
int xPos;  //sets the x position
int yPos;  //sets the y position
int speed;  //sets the speed 
boolean xDirection;  //sets the x direction
boolean yDirection;  //sets the y direction

float xHit;  //sets variable when the comet hits x (vertical walls) 
float yHit;  //sets variable when the comet hits y (horizontal walls)
float xTotal;  //sets the x total 
float yTotal;  //sets the y total

int cometSize;  //sets the comet size 


// --------------------- Declare the Class Ball (Red comet Variables) -------------------------------------------------------------------------- 
PImage img;  //create the data container for the image
int num = 400;  //sets the number of variables of red comets
Walker [] Walkers = new Walker [num];





void setup() {
  frameRate(40);
  size(500, 500);
  smooth();


  // ------------------- Set Comet Variables --------------------------------------------------------------------------------------------------
  xPos = 1;  //starts the x position at 1
  yPos = 1;  //starts the y position at 1 
  speed = 1;  //starts the speed at 1 
  xDirection = true;  //sets x directional statement as true
  yDirection = true;  //sets y directional statement as true 
  cometSize = 11;  //sets the comet size 
  xTotal = (width/10) + 10;  //sets the x total 
  yTotal = (height/10) + 10;  //sets the y total 


  // ------------------ Load Image / Setup Red Comets (Class Ball) -----------------------------------------------------------------------------
  img = loadImage("pods.jpg");  //fills the container with the image data
  background(img);  //sets the image as the background of the sketch
  img.loadPixels();  //loads the pixels from the image

  for (int i=0;i<num;i++) {
    float x = random(width);  //starts Red Comet at a random width
    float y = random(height);  //starts Red Comet at a random height
    
    //if the color at pixel (x,y) is equal to black, change direction the comet 
    if (img.get(int(x), int(y)) == color(0, 0, 0)) { 
      i--;
    }
    else {
      Walkers[i] = new Walker(x, y);
    }
  }
}





void draw() {

  // ------------------- Draws the Background --------------------------------------------------------------------------------------------------
  noStroke();
  fill(100, 20);
  rect(0, 0, width, height);
  /* 
  I couldn't figure out a way to maintain the integrity of the explosion while
  using 'background(img)' to reset the image into the picture after each 
  explosion. The ellipse sequence was the only solution I could find to mimic
  the original image visually. The rules follow the design of the image in memory.
  */
  fill(0, 5); 
  stroke(0, 1); 
  ellipse(303, 200, 300, 300); 
  ellipse(-45, 500, 500, 500); 
  
  // ------------------- Draws the Comet --------------------------------------------------------------------------------------------------------
  fill(255);
  ellipse(xPos, yPos, cometSize, cometSize);


  // ------------------ Conditional Statements for the Comet ------------------------------------------------------------------------------------
  if (xDirection) {
    xPos = xPos + speed + 2;
  } 
  else {
    xPos = xPos - speed - 2;
  }
  if (yDirection) {
    yPos = yPos + speed + 1;
  } 
  else {
    yPos = yPos - speed - 1;
  }


  // ------------------- Tells comet to reverse direction upon hitting vertical wall (x axis) ---------------------------------------------------- 
  if (xPos > (width - (cometSize/2))) {
    xDirection = false;
    xHit = xTotal;
  } 
  else if (xPos < (cometSize/2)) {
    xDirection = true;
    xHit = xTotal;
  }


  // ------------------- Tells comet to reverse direction upon hitting horizontal wall (y axis) ---------------------------------------------------  
  if (yPos > (height - (cometSize/2))) {
    yDirection = false;
    yHit = yTotal;
  } 
  else if (yPos < (cometSize/2)) {
    yDirection = true;
    yHit = yTotal;
  }


  // ------------------- Comet explodes and changes direction on x axis --------------------------------------------------------------------------
  if (xHit > 0) {
    strokeWeight(2); 
    fill(255, 70);
    ellipse(xPos, yPos, (xTotal - xHit)*15, (xTotal - xHit)*15);
    noStroke();
    xHit--;
  }

  for (int i = 0; i < num; i++) {
    Walkers [i].walk();
  }
}






/* 
Code Borrowed from Nick Senske imgWalker
Set Class for Walker (Red Comet) below
Slightly modified the code to fit the system
*/

// ------------------- Class Walker -------------------------------------------------------------------------------------------------------------

class Walker {
  float x;  //x position of the comet
  float y;  //y position of the comet
  float xv = random(2);  //x velocity, speed of the comet in the x direction
  float yv = random(2);  //y velocity, speed of the comet in the y direction 

  //comet constructor, x and y are local variables
  Walker (float x_, float y_) {
    x=x_;  //x position command, passes the local variable to the comet
    y=y_;  //y position command, passes the local variable to the comet
  }

  //a method of the comet, sets the motion of the comet
  void walk() {  //sets the movement of the comet 
    x+=xv;  //variable to move in the x position + velocity
    y+=yv;  //variable to move in the y position + velocity
    
    /*
    Optional Variation - makes the lines wander rather than follow straight paths
    TEST | create variation in the line.
    Remove this test for the comet to act in a straight line 
    The lower the number of the set points the less the variation in the wandering
    points, the higher the number of hte set of points the more variation in the 
    wandering... setting (-1, 1) makes wondering flagella roughly following a 
    straight path, while setting (-10, 10) creates scattering points leaving a 
    'trail' on each pixel it touches. Play with variations for different outcomes!
    x = x + random(-1, 1);  //unmark these two lines
    y = y + random(-1, 1);  //changes their variables for different outcomes
    */ 
    
    stroke(255, 0, 0);
    fill(255, 0, 0); 
    ellipse(x, y, 1, 1);

    //series of if statements keeps the walker within the boundaries of the sketch
    if (x > width) x = 0;
    if (x < 0) x = width; 
    if (y > height) y = 0;
    if (y < 0) y = height;

    
    //if the color of the pixel at the position of the comet is white
    //perform the random test of probability to one
    if (img.get(int(x), int(y)) != color(255, 255, 255)) {
      if (random(20) > 1) {
       
        /*
        Optional Variation - changes the direction of the red comet as it hits
        the round plates of the image.
        TEST | if(random(x) > 1) { changing the variable of this test statement
        changes the directionality of the comet's path through the round plates
        0 - 1.9 Vertical path through the round plate
        2 - 4.9 Random path through round plates
        5 - 20  Horizontal path through the round plate
        */ 
        
        yv = -yv;  //if - go in the opposite y direction
      }
      else {
        xv = -xv;  //else - go in the opposite x direction
      }
    }
  }
  
  //a method of the comet, sets the trail from the comet
  void trail() {
    for (int j = 10; j < height; j += 60) {
      if (img.get(int(x), int(y)) != color(255, 255, 255)) {
      }
      else {
        stroke(14, j, 133);
        strokeWeight(.5);
        point(x, y);
      }
    }
  }
}

