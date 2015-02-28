
/*****************************************
 * Assignment # 3
 * Name: Hao Wang
 * E-mail:hwang1@haverford.edu
 * Course:CS 110 - Section # 2
 * Submitted: 2/14/2012
 * This sketch is the Founders' Great Hall at night, especially on weekends,
 when students are partying!
 The sketch is divided into parts including: chimney, windows, outlines,
 roofs, chairs,stairs, cap, door,grassland and sky. Each of them is drawn with a different
 function.
 Iteration (for loop) is used in drawing each of the shapes within functions.
 The parameters of each function are in the form (locationx, locationy, width, height),
 and the locations and sizes are all set up so that they are proportional to the
 chosen screen size.
 The "chimney","windows", "windows2" functions has each been called twice to 
 show the variations of location of the shapes.
 ***********************************************/
float a, a1, a2, aa, a4;
float b, b1, b2, bb, b4;
float c, c1, c2, cc, c4;
float d, d1, d2, dd, d4;
float x, e1, e2, x1, x2;
float y, f1, f2, p2;
float w, w2, q2;
float h, h2, h3, m2;
float g2, j2;
//define variables
void setup () {
  size(800, 700); 
  background (198, 182, 134);
  textAlign(CENTER);
  textSize(35);
}
//setting up the size, background and the text format.

void draw() {
  chimney (width/13, height/2.3, width/13, height/2.6, width/8.5, height/2.6, width/8.5, height/2.3);
  chimney (width-width/13, height/2.3, width-width/13, height/2.6, width-width/8.5, height/2.6, width-width/8.5, height/2.3);
  windows(width/15, height/2, width/45, height/40);
  windows(width-width/7.5, height/2, width/45, height/40);
  outlines(width/10.4, height/1.5, width/7, height/2.8);
  smooth();
  fill(222, 203, 141);
  triangle (width/5.65, height/1.5-5*height/28, width/60, height/1.5-5*height/28, 1313*width/13560, height/1.5-height/3.8);
  triangle ((width-width/5.16)+width/28, height/1.5-5*height/28-height/55, (width-width/60)-width/28, height/1.5-5*height/28-height/55, width-1313*width/13560, height/1.5-height/3.8+height/50);
  //this triangle is drawn to cover part of the chimney to form the perspective.
  roofs (width/5.65, height/1.5-5*height/28, width/60, height/1.5-5*height/28, 1313*width/13560, height/1.5-height/3.8);
  windows2 (width/5, height/2, width/100, height/15);
  windows2 (width/5+width/54, height/2, width/100, height/15);
  stairs (width/2, height/1.23, width/15, height/80);
  cap (width/2, height/2.55, width/17, height/7);
  door(width/2.03+width/120, height/1.315, 0.031*width, height/11.5);
  grassland (0, height/1.18, width, height/6);
  sky (0, 0, width, height/4.1);
  text ( "HaverNight!", 0.75*width, width/10, height/4);
}

// Call all the functions one by one to draw this sketch of the Founders Hall.


void windows (float x, float y, float w, float h) {
  rectMode (CENTER);
  strokeWeight(2);
  for (int i=0; i<=3;i++) {
    frameRate (2);
    fill (random(255), random(255), random(255));

    rect(x, y+i*height/10, w, h);
    rect(x, (y+height/33)+i*height/10, w, h);
    rect(x+width/15, y+i*height/10, w, h);
    rect(x+width/15, (y+height/33)+i*height/10, w, h);
  }
}

//setting up function "windows" to draw windows in the sketch. The 
//windows are on the two sides of the buiding, and they are flickering with
//random colors.

void windows2 (float x1, float x2, float w2, float h3) {
  for (int i=0; i<=3;i++) {
    for (int k=0;k<=1;k++) {
      rectMode(CORNER);
      rect(x1+i*width/14, x2+k*height/8.2, w2, h3);  
      rect(width-x1-w2-i*width/14, x2+k*height/8.2, w2, h3);
    }
    for (int i1=0; i1<2;i1++) {
      for (int k1=0;k1<=1;k1++) {

        rectMode(CENTER);
        rect (width/2, height/1.92+k1*height/26+i1*height/8.3, width/40, (h3/2.5));
      }
    }
  }
}
//Set a new function that draws windows on the middle of the buiding, with
//solid black color inside. Loop is used to compile basic shapes.

void outlines(float a, float b, float c, float d) {
  fill(183, 149, 87);
  rectMode(CORNER);
  rect (width/5.94, height/1.3, width/1.511, height/50); 
  noFill();
  rectMode(CENTER);
  noFill();
  rect (a, b, c, d);
  rect (width-a, b, c, d);
  strokeWeight(2);
  line (a-width/14, height/1.3, a+width/14, height/1.3);
  line (303.5*width/364, height/1.3, 355*width/364, height/1.3);
  rect (46.8*width/52, height/1.78, width/64, height/28);
  line (a, b+d/2, width-a, b+d/2);
  line (61*width/364, height/2, width-61*width/364, height/2  );
  line (61*width/364, height/1.5-5*height/28, width-61*width/364, height/1.5-5*height/28  );
  line ( 61*width/364, height/1.4, width-61*width/364, height/1.4 );
  line (61*width/364, height/1.43, width-61*width/364, height/1.43 );
  line (width/2.55, height/2, width/2.55, height/1.43);
  line (width-width/2.55, height/2, width-width/2.55, height/1.43);
  rectMode (CORNER);
  for  (int i=0;i<=2;i++) {
    fill(222, 203, 141);
    rect (width/4.1+i*width/14, height/1.4, width/100, height/7.6);
    rect (width-width/3.95-i*width/14, height/1.4, width/100, height/7.6);
  } 
  rect (width/2.2, height/1.4, width/120, height/9.7);
  rect (width-width/2.2-width/120, height/1.4, width/120, height/9.7);

  rect (width/2.1, height/1.4, width/120, height/10.7);
  rect (width-width/2.07, height/1.4, width/120, height/10.7);
}
//set up a function that draws the outline of the Founders Great Hall.

void roofs (float a1, float b1, float c1, float d1, float e1, float f1) {
  strokeWeight(2.0);
  for (int i=0;i<=1;i++) {
    smooth();
    triangle (a1-i*width/28, b1-i*height/55, c1+i*width/28, d1-i*height/55, e1, f1+i*height/50);
    triangle ((width-a1)+i*width/28, b1-i*height/55, (width-c1)-i*width/28, d1-i*height/55, width-e1, f1+i*height/50);
  }
  fill(0);
  quad (width/7.2, height/2.25, width-width/7.2, height/2.25, width/1.212, height/2.065, width/5.8, height/2.065);
}
//set up a function to draw the roofs of the buiding.

void chimney (float a2, float b2, float c2, float d2, float e2, float f2, float g2, float h2) {
  fill(0);
  quad (a2, b2, c2, d2, e2, f2, g2, h2);
}
//set up a function to draw the 2 chimneys of the building.

void stairs  (float a4, float b4, float c4, float d4) {
  noFill();
  for (int i=0;i<=2;i++) {
    rect (a4, b4+i*d4, c4+i*width/40, d4);
  }
}
//set up a function to draw the 3stairs that is on the first floor.

void door (float q2, float p2, float m2, float j2) {
  fill(70, 9, 23);
  rect (q2, p2, m2, j2);
}
// The function "door" is set up to draw the red door on sketch.

void cap (float aa, float bb, float cc, float dd) {
  smooth();
  strokeWeight(2.0);
  fill(222, 203, 141);
  rect (aa, bb, cc, dd);
  fill (random(255), random(255), random(255));
  rect (aa+width/1000, bb-height/100, cc*0.6, dd*0.6);
  line (width/4, height/2.25, width/1.8, height/2.25);
  fill(222, 203, 141);
  triangle(0.472*width, 0.32*height, 0.528*width, 0.32*height, 0.5*width, 0.3*height);
  line (0.5*width, 0.3*height, 0.5*width, 0.25*height);
  quad (0.472*width, height/2.25, 0.472*width, 0.321*height, 0.44*width, 0.325*height, 0.44*width, height/2.25);
  fill (random(255), random(255), random(255));
  quad (0.472*width-0.032*width/6, height/2.25-0.123*height/7, 0.472*width-0.032*width/6, 0.321*height+0.123*height/7, 0.44*width+0.032*width/6, 0.325*height+0.123*height/7, 0.44*width+0.032*width/6, height/2.25-0.123*height/7);
  fill(0);
  quad (width-0.47*width, height/2.25, width-0.47*width, 0.321*height, width- 0.44*width, 0.325*height, width-0.44*width, height/2.25);
  fill (random(255), random(255), random(255));
  quad (width-0.472*width+0.032*width/6, height/2.25-0.123*height/7, width-0.472*width+0.032*width/6, 0.321*height+0.123*height/7, width-0.44*width-0.032*width/6, 0.325*height+0.123*height/7, width-0.44*width-0.032*width/6, height/2.25-0.123*height/7);
  line (0.5*width, 0.3*height, 0.44*width, 0.325*height);
  fill(0);
  triangle (0.51*width, 0.305*height, 0.528*width, 0.32*height, width- 0.447*width, 0.3208*height);
  fill(222, 203, 141);
  triangle (0.44*width, height/2.25, 0.472*width, 0.4635*height, 0.472*width, height/2.25);
}
//"cap" function is defined to draw the top of the Founder's Hall.

void grassland (float a5, float b5, float c5, float d5) {
  fill (5, 57, 1);
  rectMode (CORNER);
  strokeWeight(1);
  rect (a5, b5, c5, d5);
}
//This function is used to draw the green grassland.

void sky (float a6, float b6, float c6, float d6) {
  fill (12, 32, 100);
  rectMode (CORNER);
  strokeWeight(1);
  rect (a6, b6, c6, d6);
  fill (255, 255, 0);
  ellipse (width/10, width/10, width/8, width/8);
}
//This function is used to draw the blue sky and the moon on the upper left.


