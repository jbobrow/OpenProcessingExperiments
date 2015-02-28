
/*
 *  Title: P05_07_Transformations
 *  By:    Barton Poulson (bartdoesart.com)
 *  Date:  01 February 2013
 *
 *  Assignment:
 *    ...
 */
 
// This palette is "Vintage Ralph Lauren" by dianesteinberg.
// See https://kuler.adobe.com/#themeID/2216979
// Approximate HTML color names from WolframAlpha.com are:
// Wheat, Beige, Slate Gray, Indian Red, and Dark Salmon (base color)
color[] palette = {#E3CDA4, #7E827A, #2F343B, #703030, #C77966};

float a = PI;
float r = 175;

void setup() {
  size(600, 600);
  strokeWeight(10);
  ellipseMode(RADIUS);
}

void draw() {
  background(palette[4]); // Sets background to palette base color
  
  translate(width/2, height/2);  // MOves origin to center of sketch

  noStroke();
  fill(palette[0]);
  ellipse(0, 0, 20, 20);
  
  noFill();
  stroke(palette[1]);
  rotate(a);
  a += .005;
  line(0, 0, 0, r);
  ellipse(0, 0, r, r);
  
  translate(0, r);
  scale(0.5);

  noStroke();
  fill(palette[0]);
  ellipse(0, 0, 20, 20);
  
  noFill();
  stroke(palette[3]);
  rotate(a);
  a += .005;
  line(0, 0, 0, r);
  ellipse(0, 0, r, r);

  translate(0, r);
  scale(0.5);

  noStroke();
  fill(palette[0]);
  ellipse(0, 0, 20, 20);
  
  noFill();
  stroke(palette[2]);
  rotate(a);
  a += .005;
  line(0, 0, 0, r);
  ellipse(0, 0, r, r);
  
  translate(0, r);
  scale(0.5);

  noStroke();
  fill(palette[0]);
  ellipse(0, 0, 20, 20);


}
