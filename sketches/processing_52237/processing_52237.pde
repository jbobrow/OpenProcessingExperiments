
/******************************************************
 
 * Assignment 3
 * Name: Stephen Lazzaro
 * Email: slazzaro@haverford.edu
 * Course: CS110- Section 02
 * Submitted: 2/13/2012
 *
 * Since this assignment is due on Valentine's Day, the following file creates a background image of a heart, and the word love three times
 * (in 2 different sizes).  On top of that, with the use of loops, I have the letters L, O, V, and E bounce around the screen at random speeds.
 * Within the loops, each letter is depicted in an arc-like manner (it looks like going from PI/2 to PI) where the letter gets larger and less
 * transparent as the letter-arc approaches PI.
 * 
 * 
 
 *********************************************************/

float spdlx; // This variable gives the speed of the L's in the x direction
float spdly; // This variable gives the speed of the L's in the y direction
float spdox; // This variable gives the speed of the O's in the x direction
float spdoy; // This variable gives the speed of the O's in the y direction
float spdvx; // This variable gives the speed of the V's in the x direction
float spdvy; // This variable gives the speed of the V's in the y direction
float spdex; // This variable gives the speed of the E's in the x direction
float spdey; // This variable gives the speed of the E's in the y direction
float lsxex; // This variable is created in order to make the L's move in the x direction while being involved in a loop
float lsyex; // This variable is created in order to make the L's move in the y direction while being involved in a loop
float osxex; // This variable is created in order to make the O'S move in the x direction while being involved in a loop
float osyex; // This variable is created in order to make the O'S move in the y direction while being involved in a loop
float vsxex; // This variable is created in order to make the V'S move in the x direction while being involved in a loop
float vsyex; // This variable is created in order to make the V'S move in the y direction while being involved in a loop
float esxex; // This variable is created in order to make the E'S move in the x direction while being involved in a loop
float esyex; // This variable is created in order to make the E'S move in the y direction while being involved in a loop

/*The following commands draw an L where the starting x position is given by lsx, the starting y position by lsy,
 lw allows you to scale the width (where 1 is natural size, less than 1 is smaller and greater than 1 is bigger),
 lh allows you to scale the height, lr allows you to alter the red fill, and ltr allows you to alter the transparency
 */


void drawL (float lsx, float lsy, float lw, float lh, float lr, float ltr) {

  fill(lr, 0, 0, ltr);
  smooth();
  beginShape();
  vertex(lsx, lsy);
  vertex(lsx+lw*width/6, lsy);
  vertex(lsx+lw*width/6, lsy-lh*height/20);
  vertex(lsx+lw*width/6.5, lsy-lh*height/20);
  vertex(lsx+lw*width/7, lsy-lh*height/40);
  vertex(lsx+lw*width/20, lsy-lh*height/40);
  vertex(lsx+lw*width/20, lsy-lh*height/4);
  vertex(lsx+lw*width/15, lsy-lh*height/4);
  vertex(lsx+lw*width/15, lsy-lh*height/3.7);
  vertex(lsx, lsy-lh*height/3.7);
  vertex(lsx, lsy-lh*height/4);
  bezierVertex(lsx+lw*width/35, lsy-lh*height/3.7, lsx+lw*width/35, lsy-lh*height/40, lsx, lsy-lh*height/40);
  endShape(CLOSE);
}

/*The following commands draw an O where the starting x position is given by osx, the starting y position by osy,
 ow allows you to scale the width (where 1 is natural size, less than 1 is smaller and greater than 1 is bigger),
 oh allows you to scale the height, or allows you to alter the red fill, and otr allows you to alter the transparency
 */

void drawO (float osx, float osy, float ow, float oh, float or, float otr) {
  fill(or, 0, 0, otr);
  smooth();
  stroke(200);
  ellipse(osx, osy, ow*width/6, oh*height/3.7);
  fill(55);
  ellipse(osx, osy, ow*width/9, oh*height/4.7);
}

/*The following commands draw a V where the starting x position is given by vsx, the starting y position by vsy,
 vw allows you to scale the width (where 1 is natural size, less than 1 is smaller and greater than 1 is bigger),
 vh allows you to scale the height, vr allows you to alter the red fill, and vtr allows you to alter the transparency
 */

void drawV (float vsx, float vsy, float vw, float vh, float vr, float vtr) {
  fill(vr, 0, 0, vtr);
  smooth();
  stroke(200);
  beginShape();
  vertex(vsx, vsy);
  vertex(vsx+vw*width/10, vsy-vh*height/3.7);
  vertex(vsx+vw*width/16, vsy-vh*height/3.7);
  vertex(vsx, vsy-vh*height/14);
  vertex(vsx-vw*width/16, vsy-vh*height/3.7);
  vertex(vsx-vw*width/10, vsy-vh*height/3.7);
  endShape(CLOSE);
}

/*The following commands draw a V where the starting x position is given by vsx, the starting y position by vsy,
 vw allows you to scale the width (where 1 is natural size, less than 1 is smaller and greater than 1 is bigger),
 vh allows you to scale the height, r allows you to alter the red fill, and tr allows you to alter the transparency
 */

void drawE (float esx, float esy, float ew, float eh, float er, float etr) {
  fill(er, 0, 0, etr);
  smooth();
  stroke(200);
  beginShape();
  vertex(esx, esy);
  vertex(esx+ew*width/5, esy);
  vertex(esx+ew*width/5, esy-eh*.5*height/14.8);
  vertex(esx+ew*width/30, esy-eh*.5*height/14.8);
  vertex(esx+ew*width/30, esy-eh*1.7*height/14.8);
  vertex(esx+ew*width/5, esy-eh*1.7*height/14.8);
  vertex(esx+ew*width/5, esy-eh*2.2*height/14.8);
  vertex(esx+ew*width/30, esy-eh*2.2*height/14.8);
  vertex(esx+ew*width/30, esy-eh*3.5*height/14.8);
  vertex(esx+ew*width/5, esy-eh*3.5*height/14.8);
  vertex(esx+ew*width/5, esy-eh*4*height/14.8);
  vertex(esx, esy-eh*4*height/14.8);
  endShape(CLOSE);
}

void setup () {

  size(800, 800);
  spdlx = random(4, 7);
  spdly = random(3, 5);
  spdox = random(4, 7);
  spdoy = random(3, 5);
  spdvx = random(4, 7);
  spdvy = random(3, 5);
  spdex = random(4, 7);
  spdey = random(3, 5);
  lsxex = 0;
  lsyex = 0;
  osxex = 0;
  osyex = 0;
  vsxex = 0;
  vsyex = 0;
  esxex = 0;
  esyex = 0;
}

void draw () {

  background (55);

  drawL (width/5, height/4, .5, .5, 255, 20);
  drawO (2.1*width/5, height/5.5, .5, .5, 255, 20);
  drawV (3*width/5, height/4, .5, .5, 255, 20);
  drawE (3.7*width/5, height/4, .5, .5, 255, 20);
  drawL (3.8*width/10, height/2, .25, .25, 255, 20);
  drawO (4.8*width/10, height/2.15, .25, .25, 255, 20);
  drawV (5.6*width/10, height/2, .25, .25, 255, 20);
  drawE (6.1*width/10, height/2, .25, .25, 255, 20);
  drawL (width/5, 4*height/5, .5, .5, 255, 20);
  drawO (2.1*width/5, 4*height/5.45, .5, .5, 255, 20);
  drawV (3*width/5, 4*height/5, .5, .5, 255, 20);
  drawE (3.7*width/5, 4*height/5, .5, .5, 255, 20);

  // The following commands create a heart at the center of the screen

  fill(230, 0, 0, 150);
  beginShape();
  vertex(width/2, 3*height/4);
  bezierVertex(width, height/2, width, 0, width/2, height/4);
  bezierVertex(0, 0, 0, height/2, width/2, 3*height/4);
  endShape();

  /* The following commands draw the letters L, O, V, and E in arcs where the letters get smaller by using loops.
   These commands also make the arcs of letters bounce around the screen.
   */

  float i=.1;
  while (i<1) {

    drawL(350/(10*i)+lsxex, 3*height/4-i*height/4+lsyex, i/2, i/2, i*255, i*205);

    // The following code reverses the speed in the x direction when the L's hit the right side of the screen
    if ((350/(10*i)+lsxex+i*width/12) > width) {
      spdlx= -spdlx;
    }

    // The following code reverses the speed in the x direction when the L's hit the left side of the screen
    if ((350/(10*i)+lsxex) < 0) {
      spdlx= -spdlx;
    }

    // The following code reverses the speed in the y direction when the L's hit the bottom of the screen
    if (3*height/4-i*height/4+lsyex > height) {
      spdly= -spdly;
    }

    // The following code reverses the speed in the y direction when the L's hit the top of the screen
    if (3*height/4-i*height/4+lsyex-i*height/7.4 < 0) {
      spdly= -spdly;
    }

    drawO (400/(10*i)+width/7+osxex, 3*height/4-i*height/4+osyex, i/2, i/2, i*255, i*205);

    // The following code reverses the speed in the x direction when the O's hit the right side of the screen
    if (400/(10*i)+width/7+osxex+i*width/24 > width) {
      spdox= -spdox;
    }

    // The following code reverses the speed in the x direction when the O's hit the left side of the screen
    if (400/(10*i)+width/7+osxex-i*width/24 < 0) {
      spdox= -spdox;
    }
    // The following code reverses the speed in the y direction when the O's hit the bottom of the screen
    if (3*height/4-i*height/4+osyex+i*height/14.8 > height) {
      spdoy= -spdoy;
    }

    // The following code reverses the speed in the y direction when the O's hit the top of the screen
    if (3*height/4-i*height/4+osyex-i*height/14.8 < 0) {
      spdoy= -spdoy;
    }

    drawV (400/(10*i)+2*width/7+vsxex, 3*height/4-i*height/4+i*height/7+vsyex, i/2, i/2, i*255, i*205);

    // The following code reverses the speed in the x direction when the V's hit the right side of the screen
    if (400/(10*i)+2*width/7+vsxex+i*width/20 > width) {
      spdvx= -spdvx;
    }

    // The following code reverses the speed in the x direction when the V's hit the left side of the screen
    if (400/(10*i)+2*width/7+vsxex-i*width/20 < 0) {
      spdvx= -spdvx;
    }
    // The following code reverses the speed in the y direction when the V's hit the bottom of the screen
    if (3*height/4-i*height/4+i*height/7+vsyex > height) {
      spdvy= -spdvy;
    }

    // The following code reverses the speed in the y direction when the V's hit the top of the screen
    if (3*height/4-i*height/4+i*height/7+vsyex-i*height/7.4 < 0) {
      spdvy= -spdvy;
    }

    drawE (400/(10*i)+3*width/7+esxex, 3*height/4-i*height/4+i*height/7+esyex, i/2, i/2, i*255, i*i*i*205);

    // The following code reverses the speed in the x direction when the E's hit the right side of the screen
    if (400/(10*i)+3*width/7+esxex+i*width/10 > width) {
      spdex= -spdex;
    }

    // The following code reverses the speed in the x direction when the E's hit the left side of the screen
    if (400/(10*i)+3*width/7+esxex < 0) {
      spdex= -spdex;
    }
    // The following code reverses the speed in the y direction when the E's hit the bottom of the screen
    if (3*height/4-i*height/4+i*height/7+esyex > height) {
      spdey= -spdey;
    }

    // The following code reverses the speed in the y direction when the E's hit the top of the screen
    if (3*height/4-i*height/4+i*height/7+esyex-i*height/7.4 < 0) {
      spdey= -spdey;
    }

    i = 1.1*i;
  }

  lsxex = lsxex + spdlx;
  lsyex = lsyex + spdly;
  osxex = osxex + spdox;
  osyex = osyex + spdoy;
  vsxex = vsxex + spdvx;
  vsyex = vsyex + spdvy;
  esxex = esxex + spdex;
  esyex = esyex + spdey;
}


