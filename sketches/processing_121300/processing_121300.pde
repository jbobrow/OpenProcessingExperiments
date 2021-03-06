
/***********************
Assignment 02
Name: Meron Kasahun
E-mail: mkasahun@brynmawr.edu
Course: CS 110 - Section 001
Submitted: 9/18/12

This program simulates 3D outer space. A user will run the program
and will find a sun and some stars automatically generated. Clicks
generate either stars or planets, there is an 80% chance they will 
get a star and a 20% chance they will get a planet. Any key that
the user clicks will set them back to the original background.
************************/

//moving on curves
float beginX = 20.0;  // Initial x-coordinate
float beginY = 10.0;  // Initial y-coordinate
float endX = 570.0;   // Final x-coordinate
float endY = 320.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 4;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)

void setup() {
  size(500, 500);
  drawBackground ();
  smooth ();
}

void draw () 
//Moving on Curves
{{
  fill(0, 2);
  rect(0, 0, width, height);
  pct += step;
  if (pct < 1.0) {
    x = beginX + (pct * distX);
    y = beginY + (pow(pct, exponent) * distY);
  }
  fill(255);
  ellipse(x, y, 20, 20);
}
}

void keyPressed () {
  drawBackground();
}

void drawBackground(){
  //draw night sky with few stars and sun
  background(0, 0, 40);
  noStroke ();
  int i = 230;
  while (i>=1) {
    i-=2;
    fill (255-i,255-i,0);
    ellipse(450,100,i,i);
  }
  fill (240);
  ellipse (100,200, 3, 3);
  ellipse (200, 100, 3, 3);
  ellipse (300, 150, 3, 3);
  ellipse (50, 350, 3, 3);
  ellipse (250, 375, 3, 3);

}
//Randomize R,G,B and set random star diameters and planet diameters
void mousePressed () {{
  //Moving on Curves
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
}
  float planetDiam = random (10, 50);
  float starDiam = random (2, 6);
  int r = int (random (0, 255) );
  int g =int ( random (0, 255) );
  int b = int (random (0, 255) );


  int randomNum = int (random (0, 100));


  if (mouseY<200) {
    //draw planet
    if (randomNum > 80) {
      noStroke ();
      int i =  int (random(10,50));
      while (i>=1) {
        i-=2;
        ellipseMode (CENTER);
        fill (r-2*i,g-2*i,b-2*i);
        ellipse (mouseX,mouseY,i/2,i/2);
  }
    }

    //draw star 
    else {
      fill(240);
      ellipse (mouseX, mouseY, starDiam/2, starDiam/2);
    }
  }

  else {
    //change all the diams
    //draw planet
    if (randomNum > 80) {
      noStroke ();
      int i =  int (random(10,50));
      while (i>=1) {
        i-=2;
        ellipseMode (CENTER);
        fill (r-2*i,g-2*i,b-2*i);
        ellipse (mouseX,mouseY,i,i);
        }
    }

    //draw star 
    else {
      fill(240);
      ellipse (mouseX, mouseY, starDiam, starDiam);
    }
  }
}


