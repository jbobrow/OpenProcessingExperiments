
/**********************
 Assignment 2
 Rachel Genovese
 rgenovese@brynmawr.edu
 CS 110, Section 2
 3/2/12
 This is an interactive program.  For every mouse click in the ocean, 
 a shark fin will appear, and for every mouse click in the sky, a flock of 
 seagulls will appear.  As you click closer to the horizon in the ocean and 
 the sky, the sharks and the clouds will appear smaller and smaller.
 *********************/

int horizonY = 200;
int r = 50; 
int g = 106;
int b = 255;

void setup () {
  size (500, 500);
  background (150, 255, 255);
  color (0);

  //Draw the horizon line
  line (0, horizonY, 500, horizonY);

  //Color the ocean as a rect
  fill (r, g, b);
  noStroke ();
  rectMode (CORNERS);
  rect (0, horizonY, 500, 500);

  //Sun
  fill (255, 255, 60);
  ellipse (425, 75, 50, 50);
  stroke (255, 255, 60); //Sunrays
  strokeWeight (5);
  line (425, 45, 425, 15); //Top sunray
  line (455, 75, 485, 75); //Left sunray
  line (425, 105, 425, 135); //Bottom sunray
  line (395, 75, 365, 75); //Right sunray
  line (400, 50, 380, 30); //NW sunray
  line (450, 50, 470, 30); //NE sunray
  line (450, 100, 470, 120); //SE sunray
  line (400, 100, 380, 120); //SW sunray
}

void draw () {
}

void mousePressed () {
  if (mouseY > horizonY) {  
    //hordist to scale triangles x's and y's
    int hordist = mouseY - horizonY;
    float xm25 = mouseX-(hordist/2); //half of triangle
    float xp25 = mouseX+(hordist/2);
    float yp25 = mouseY+hordist;
    float xm28 = mouseX-(hordist/2);
    float xp28 = mouseX+(hordist/2);
    float yp28 = mouseY+28;
    float yp15 = mouseY+15;

    //Shark fin
    stroke (0);
    strokeWeight (2);
    fill (random(0, 220)); 
    triangle (mouseX, mouseY, xm25, yp25, xp25, yp25);
  }

  //Seagulls!!!
  // horizonY - 60 because anything more would put birds in water!
  if (mouseY < horizonY - 60) {
    noFill ();
    strokeWeight (2);
    stroke (255);
    smooth ();
    int hordist = abs (mouseY - horizonY);
    float xm28 = mouseX-(hordist/2);
    float xp28 = mouseX+(hordist/2);
    float yp28 = mouseY+28;
    float yp15 = mouseY+15;
    //Making flock of three birds on top of each other
    for (int i = 0; i < 3; i++) {
      bezier (xm28, yp28, xm28, yp15, mouseX, yp15, mouseX, yp28);
      bezier (mouseX, yp28, mouseX, yp15, xp28, yp15, xp28, yp28);
      yp28 += 20;
      yp15 += 20;
    }
  }
}

