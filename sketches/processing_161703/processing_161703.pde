
/*****************************************
 * Assignment <<< 03 >>
 * Name:         <<< Meghan Dooling and Tommy McBride >>>
 * Course:       CSC 103 - Creative Computing - Fall 2014
 * Submitted:    <<< September 17, 2014 >>>
 * 
 * This program makes planets rotate around the sun at the exact rate
 * at which they travel in space relative to Earth's orbit with stars
 * twinkling at random in the background.
 *
***********************************************/

int xS = 300;
int yS = 300;

int mercRadius = 83;
float mercAngle = 0;
float mercSpeed = -1.607;

int venRadius = 125;
float venAngle = 0;
float venSpeed = -1.174;

int earRadius = 190;
float earAngle = 0;
float earSpeed = -1;

int marRadius = 250;
float marAngle = 0;
float marSpeed = -0.802;


/*
  Create a sky with twinkling stars. An example of using arrays.
  Author: Charlie McDowell
  We got it from:  http://www.openprocessing.org/sketch/41150
 */
int[] starX = new int[1000];
int[] starY = new int[1000];
color[] starColor = new color[1000];



void setup() {
  size(600, 600);
   /*
  Create a sky with twinkling stars. An example of using arrays.
  Author: Charlie McDowell
  We got it from:  http://www.openprocessing.org/sketch/41150
   */
    for (int i = 0; i < 1000; i++) {
    starX[i] =(int)random(width);
    starY[i] = (int)random(height);
    starColor[i] = color((int)random(100,255));
  }
}

void draw() {
  background(0);
   /*
  Create a sky with twinkling stars. An example of using arrays.
  Author: Charlie McDowell
  We got it from:  http://www.openprocessing.org/sketch/41150
   */
   for (int i = 0; i < 1000; i++) {
    //fill(random(100,255));
    if (random(10) < 1) {
      starColor[i] = (int)random(100,255);
    }
    fill(starColor[i]);
    ellipse(starX[i], starY[i], 3, 3);
  }
 
  
  // Sun
  noStroke();
  fill(255, 249, 64, 255);
  ellipse(xS, yS, 125, 125);
  
  // Mercury
  drawMercury(xS+mercRadius*cos(radians(mercAngle)),
            yS + mercRadius * sin(radians(mercAngle))); 
  mercAngle = mercAngle + mercSpeed;
  if (mercAngle >= 360) mercAngle = mercAngle - 360;

  
  // Venus
  drawVenus(xS+venRadius*cos(radians(venAngle)),
          yS + venRadius * sin(radians(venAngle)));
  venAngle = venAngle +venSpeed;
  if (venAngle >= 360) venAngle = venAngle - 360;
  
  // Earth
  drawEarth(xS+earRadius*cos(radians(earAngle)),
          yS + earRadius * sin(radians(earAngle)));
  earAngle = earAngle + earSpeed;
  if (earAngle >= 360) earAngle = earAngle - 360;

  //Mars
  drawMars(xS+marRadius*cos(radians(marAngle)),
         yS + marRadius * sin(radians(marAngle)));
  marAngle = marAngle + marSpeed;
  if (marAngle >= 360) marAngle = marAngle - 360;

} 

  // Mercury
  void drawMercury(float x, float y) {
      noStroke();
      fill(155, 145, 110, 255);
      ellipse(x, y, 15.2, 15.2);
  }
  
  // Venus
  void drawVenus(float x, float y) {
      noStroke();
      fill(200, 180, 175, 255);
      ellipse(x, y, 38, 38);
  }
  
  // Earth
  void drawEarth(float x, float y) {
      noStroke();
      fill(10, 20, 210, 255);
      ellipse(x, y, 50, 50);
  }
  
  // Mars
  void drawMars(float x, float y) {
      noStroke();
      fill(210, 80, 10, 255);
      ellipse(x, y, 21.2, 21.2);
  }
  
    
  


