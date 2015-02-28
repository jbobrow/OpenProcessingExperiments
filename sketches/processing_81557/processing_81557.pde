
/*
This program draws a starry sky with stars that twinkle. It also includes
randomly occuring shooting stars.
Author: Charlie McDowell
*/
 
// the twinlking star locations
int[] starX = new int[100];
int[] starY = new int[100];
color[] starColor = new color[1000];
float starSize = random(7); // the size of the twinkling stars


 PImage img;
 
void setup() {
  size(476,476);
  img = loadImage("in5.jpg");
  // create the star locations
  for (int i = 0; i < starX.length; i++) {
    starX[i] =(int)random(width);
    starY[i] = (int)random(height);
    starColor[i] = color((int)random(10,255));
  }
}
 
void draw() {
  image(img,0,0);
   
  // draw the stars
  // the stars seem to show best with black outlines that aren't really perceived by the eye
  noStroke();
  for (int i = 0; i < starX.length; i++) {
    fill(random(10,255),30); // makes them twinkle
    if (random(10) < 1) {
      starColor[i] = (int)random(100,255);
    }
    fill(starColor[i]);
     
    ellipse(starX[i], starY[i], starSize, starSize);
  }
}


