
// I give all credits to Alberto Bustillos the guy who I use his code to modify
// This is his processing sketch http://www.openprocessing.org/sketch/65490



// Project rectangle brushes + rectangle bg.
// By Decho Pitukcharoen N00206696

// Let's start
// this is the place where I declare all variables
float r, g, b, a; // The Declarations of red,green,blue & alpha color variables for rectangles brush
float rr, gg, bb, aa; // The Declarations of red,green,blue & alpha color variables for rectangles bg
float randomX, randomY, randomSizes; // The Declarations of red,green,blue,alpha color and sizes variables for rectangles bg
float sizeWidth, sizeHeight; // The Declarations of width & height Sizes for rectangles brush


void setup() { // In order to setup everything we create void setup
  size(700, 700); // This is the canvas size
  smooth(); // Make smooth shapes
  background (255); // Background color
  mouseX=width/2; // this is where the mouse start in the middle (half of the width) 
  mouseY=height/2; // this is where the mouse start in the middle (half of the height)
}


void draw() { // Let's make things move by setting up void draw
  // This is the code for the random rectangles background
  rr=random(20); // random color for red color
  gg=random(30); // random color for green color
  bb=random(30); // random color for blue color
  aa=random(20); // random color for alpha color

  randomSizes = random(35); // random positions
  randomX = random(width); // random position with width position
  randomY = random(height); // random position with height position

  //drawing rectangles background
  noStroke(); // I don't need stroke on shape
  fill(rr, gg, bb, aa); // fill random colors + alpha
  rect(randomX,randomY, randomSizes, randomSizes); // make random  x,y positions and sizes

    // Let's make drawing brushes
  if (mousePressed) { // create a condition when you press on mouse button 

    // generating random numbers for r,g,b,a (to make random colors)
    r=random(255);
    g=random(255);
    b=random(255);
    a=random(255);

    //generating randoms for rectangles position
    sizeWidth = random(35); // make random width of rectangle 
    sizeHeight = random(50); // make random heigh of rectangle 




    // generating drawing brushe shapes
    noStroke(); // I don't need any stroke in the shapes
    fill(r, g, b, a); // fill random colors from red, green, blue and alpha (transperency)
    rectMode(CENTER); // set the starting point in the middle (center) of rectangles

    rect(mouseX, mouseY, sizeWidth, sizeHeight); 
    // mouseX, mouseY =  X & Y positions for rectangles follow the cursor 
    // sizeWidth, sizeHeight = width and height with random sizes
  }
}



void keyPressed() { // to make some functions when I press keys on computer keyboard 

  if (key==' ') { // key==' '  means press space  to reset
    setup(); // restart to the setup (beginning)
  }
  if (key == 's') { // press s to save picture in the folder
    saveFrame("Pic-##.GIF"); // Pic = name  ## = number of files and .GIF = file type
  }
}

// end


