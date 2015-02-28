
/*
 *  Title: P07_01_MouseTracking
 *  By:    Barton Poulson (artbybart.org)
 *  Date:  13 February 2013
 *
 *  Assignment: 
 *    Create a sketch that make a creative use of all of these variables:
 *    mouseX & mouseY, pmouseX & pmouseY
 *
 *  Notes:
 *    This palette is "Bahamas" by learnedt15
 *    See https://kuler.adobe.com/#themeID/2238023
 */

color[] palette = {#003056, #04518C, #00A1D9, #47D9BF, #F2D03B};

void setup() {
  size(600, 400);
  smooth();
  rectMode(CORNERS);
  frameRate(10);

  background(palette[0]);

  fill(palette[3]);
  text("move mouse quickly...", 10, 20);
}

void draw() {
  noStroke();

  fill(palette[int(random(1,4))], 40);
  rect(mouseX, mouseY, pmouseX, pmouseY);

  fill(palette[4], 80);
  ellipse(mouseX, mouseY, 5, 5);

  stroke(palette[4], 80);
  line(mouseX, mouseY, pmouseX, pmouseY);
}
