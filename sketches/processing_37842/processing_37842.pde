
/*****************************************
 * Self portrait - animated
 * Click mouse to animate
 * T Caulkins Sept 2011
 *****************************************/

// declare your variables here
float xCenter = 300;
float yCenter = 300;
float xEye = 300;
float yEye = 200;
float incrCenterX = 0.4;
float incrEyeX = 0.4;
float incrEyeY = 0.4;
float incrMirrorX = 0.4;
float incrHairStartX = 0.8;
float incrHairStartY = 0.8;
float incrHairEndX = 0.8;
float incrHairEndY = 0.;
float xMirror = 60.;
float xHairStart1 = 300.;
float yHairStart1 = 70.;
float xHairEnd1 = 160.;
float yHairEnd1 = 170.;
float   strokeHairX = 150;
float strokeHairY = 100;
float strokeHairZ = 100;


// setup() only happens once at the beginning of the sketch
void setup() {
  // this is where you set the initial properties
  size(600, 450);// size() should always go inside setup()
  smooth();// smooth() usually only needs to go here
}

// draw() happens over and over and over
void draw() {
  background(120, 120, 120, 150);// apply the background first

  if (mousePressed == false) {
    xEye = 300.;
    yEye = 200.;
    xMirror = 60.;
    xHairStart1 = 300.;
    yHairStart1 = 70.;
    xHairEnd1 = 160.;
    yHairEnd1 = 170.;
    xCenter = 300;
    strokeHairX = 150;
    strokeHairY = 100;
    strokeHairZ = 100;
  } 
  else {
    strokeHairX = random(0, 255);
    strokeHairY = random(0, 255);
    strokeHairZ = random(0, 255);
    xEye += incrEyeX;
    if ( xEye < 295 || xEye > 305 ) {
      incrEyeX *= -1;
      xEye += incrEyeX;
    }
    yEye += incrEyeY;
    if ( yEye < 195 || yEye > 205 ) {
      incrEyeY *= -1;
      yEye += incrEyeY;
    }
    xMirror += incrMirrorX;
    if ( xMirror < 50. || xMirror > 70. ) {
      incrMirrorX *= -1;
      xMirror += incrMirrorX;
    }
    xHairStart1 += incrHairStartX;
    if ( xHairStart1 < 290. || xHairStart1 > 310. ) {
      incrHairStartX *= -1;
      xHairStart1 += incrHairStartX;
    }
    yHairStart1 += incrHairStartY;
    if ( yHairStart1 < 60. || yHairStart1 > 80. ) {
      incrHairStartY *= -1;
      yHairStart1 += incrHairStartY;
    }
    xHairEnd1 += incrHairEndX;
    if ( xHairEnd1 < 150. || xHairEnd1 > 170. ) {
      incrHairEndX *= -1;
      xHairEnd1 += incrHairEndX;
    }
    yHairEnd1 += incrHairEndY;
    if ( yHairEnd1 < 165. || yHairEnd1 > 175. ) {
      incrHairEndY *= -1;
      yHairEnd1 += incrHairEndY;
    }
    xCenter += incrCenterX;
    if ( xCenter < 290. || xCenter > 310. ) {
      incrCenterX *= -1;
      xCenter += incrCenterX;
    }
  }

  // now draw or evaluate anything you want

  stroke(0); // Sets line value to black
  strokeWeight(2); // Sets line width to 5 pixels

  ellipseMode(CENTER);
  fill(255);
  /************************************************
   * ears
   ************************************************/
  ellipse(xCenter - xMirror - 55, 225, 35, 80); // Large circle
  ellipse(xCenter + xMirror + 55, 225, 35, 80); // Large circle
  /************************************************
   * head
   ************************************************/
  fill(255);
  ellipse(xCenter, 230, 220, 300);
  /************************************************
   * eyes
   ************************************************/

  ellipse(xEye - xMirror, yEye, 60, 27); // Large circle
  ellipse(xEye + xMirror, yEye, 60, 27); // Large circle
  //iris
  //fill(204);
  fill(170, 120, 120, 255);
  ellipse(xEye - xMirror, yEye, 27, 27); // Large circle
  ellipse(xEye + xMirror, yEye, 27, 27); // Large circle
  fill(1);
  ellipse(xEye - xMirror, yEye, 3, 3); // Large circle
  ellipse(xEye + xMirror, yEye, 3, 3); // Large circle


  /************************************************
   * nose
   ************************************************/
  line(xCenter-5, 200, xCenter-5, 285 );
  line(xCenter-5, 285, xCenter+10, 285 );

  /************************************************
   * mouth
   ************************************************/
  line(xCenter-30, 305, xCenter-40, 315);
  line(xCenter+30, 305, xCenter+40, 315);
  fill(255);
  bezier(xCenter-30, 315, xCenter-30, 330, xCenter+30, 330, xCenter+30, 315);
  fill(1);
  triangle(xCenter-5, 335, xCenter+5, 335, xCenter, 340 );

  /************************************************
   * hair
   ************************************************/
  stroke(strokeHairX, strokeHairY, strokeHairZ); // Sets line value to black
  strokeWeight(20); // Sets line width to 5 pixels
  line(xHairStart1-45, yHairStart1, xHairEnd1+60, yHairEnd1-60);
  line(xHairStart1-45, yHairStart1, xHairEnd1+40, yHairEnd1-40);
  line(xHairStart1-45, yHairStart1, xHairEnd1+40, yHairEnd1-20);
  line(xHairStart1-30, yHairStart1-10, xHairEnd1+40, yHairEnd1);
  line(xHairStart1-30, yHairStart1-10, xHairEnd1+60, yHairEnd1);
  line(xHairStart1-15, yHairStart1-20, xHairEnd1+80, yHairEnd1);
  line(xHairStart1-15, yHairStart1-20, xHairEnd1+100, yHairEnd1-10);
  line(xHairStart1, yHairStart1-20, xHairEnd1+120, yHairEnd1-20);
  line(xHairStart1, yHairStart1-20, xHairEnd1+140, yHairEnd1-30);
  line(xHairStart1, yHairStart1-20, xHairEnd1+160, yHairEnd1-20);
  line(xHairStart1+15, yHairStart1-20, xHairEnd1+180, yHairEnd1-10);
  line(xHairStart1+15, yHairStart1-20, xHairEnd1+200, yHairEnd1);
  line(xHairStart1+30, yHairStart1-10, xHairEnd1+220, yHairEnd1);
  line(xHairStart1+30, yHairStart1-10, xHairEnd1+240, yHairEnd1);
  line(xHairStart1+45, yHairStart1, xHairEnd1+240, yHairEnd1-20);
  line(xHairStart1+45, yHairStart1, xHairEnd1+240, yHairEnd1-40);
  line(xHairStart1+45, yHairStart1, xHairEnd1+220, yHairEnd1-60);
}


