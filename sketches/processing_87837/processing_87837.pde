
/*
 *  Title: P05_06_Palettes
 *  By:    Barton Poulson (bartdoesart.com)
 *  Date:  01 February 2013
 *
 *  Assignment:
 *    Choose a color palette from Kuler: https://kuler.adobe.com/ 
 *    Create a sketch and put the hex codes for those colors in a
 *    color array, Make sure you give credit to the person who
 *    developed the palette and give the link to it in a comment
 *    in your sketch. Use that palette to color objects in your sketch,
 *    either randomly or systematically
 */
 
// This palette is "Vintage Ralph Lauren" by dianesteinberg.
// See https://kuler.adobe.com/#themeID/2216979
// Approximate HTML color names from WolframAlpha.com are:
// Wheat, Beige, Slate Gray, Indian Red, and Dark Salmon (base color)
color[] palette = {#E3CDA4, #7E827A, #2F343B, #703030, #C77966};
int dmin = 50;  // Minimum diameter for circles
int dmax = 400; // Maximum diameter for circles
 
void setup() {
  size(600, 600);
  strokeWeight(10);
  noFill();
  frameRate(1);
}

void draw() {
  background(palette[4]); // Sets background to palette base color
  
  // Circle 0
  stroke(palette[0]);
  float d1 = random(dmin, dmax);
  ellipse(random(width), random(height), d1, d1);
  
  // Circle 1
  stroke(palette[1]);
  float d2 = random(dmin, dmax);
  ellipse(random(width), random(height), d2, d2);
  
  // Circle 2
  stroke(palette[2]);
  float d3 = random(dmin, dmax);
  ellipse(random(width), random(height), d3, d3);
  
  // Circle 3
  stroke(palette[3]);
  float d4 = random(dmin, dmax);
  ellipse(random(width), random(height), d4, d4);
}
