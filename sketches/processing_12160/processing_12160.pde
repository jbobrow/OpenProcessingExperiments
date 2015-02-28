
/**
* Morandi Painting
* Greta Poulsen
* created 7 September 2010
*/

void setup() {
  size(600, 400);
  background(171, 151, 88);
  smooth();

  createPainting();
}

void createPainting() {

  // tan background square
  float r = 195;
  float g = 181;
  float b = 152;
  fill(r, g, b);
  noStroke();
  float x1 = 0;
  float y1 = 300;
  float x2 = 600;
  float y2 = 250;
  float x3 = 600;
  float y3 = 400;
  float x4 = 0;
  float y4 = 400;
  quad(x1, y1, x2, y2, x3, y3, x4, y4);


  //yellow rectangle

  strokeWeight(2);
  stroke(5);
  fill(208, 164, 99);
  float x = 250;
  float y = 200;
  float h = 125;
  float w = 100;
  rect(x, y, h, w);


  // yellow triangle

  r = 185;
  g = 160;
  b = 103;
  fill(r, g, b);
  x1 = 375;
  y1 = 200;
  x2 = 315;
  y2 = 125;
  x3 = 250;
  y3 = 200;
  triangle(x1, y1, x2, y2, x3, y3);


  // yellow triangle topper

  r = 134;
  g = 137;
  b = 110;
  fill(r, g, b);
  x = 315;
  y = 125;
  w = 20;
  h = 50;
  ellipse(x, y, w, h);


  // red square
  r = 198;
  g = 101;
  b = 94;
  fill(r, g, b);
  x = 375;
  y = 200;
  w = 95;
  h = 100;
  rect(x, y, w, h);


  // red circle
  r = 142;
  g = 93;
  b = 86;
  fill(r, g, b);
  x = 423;
  y = 200;
  w = 95;
  h = 25;
  ellipse(x, y, w, h);


  // brown square
  r = 73;
  g = 64;
  b = 69;
  fill(r, g, b);
  x = 153; 
  y = 200;
  h = 95;
  w = 97;
  rect(x, y, w, h);

  //brown oval thingy
  r = 73;
  g = 64;
  b = 69;
  fill(r, g, b);
  x = 190; 
  y = 175;
  h = 45;
  w = 20;
  ellipse(x, y, w, h);

  //inside brown oval thingy
  r = 162;
  g = 145;
  b = 75;
  fill(r, g, b);
  x = 190; 
  y = 175;
  h = 30;
  w = 10;
  ellipse(x, y, w, h);

  // brown circle
  r = 72;
  g = 72;
  b = 74;
  fill(r, g, b);
  x = 200;
  y = 200;
  w = 95;
  h = 50;
  ellipse(x, y, w, h);


  // green sphere top
  r = 192;
  g = 190;
  b = 116;
  fill(r, g, b);
  x = 195;
  y = 275;
  w = 75;
  h = 75;
  ellipse(x, y, w, h);


  //blue sphere bottom
  noStroke();
  r = 122;
  g = 160;
  b = 149;
  fill(r, g, b);

  // modified from code on processing.org
  float f = 0.0;
  beginShape(POLYGON);
  while(f < PI) {
    vertex(195 + cos(f)*37, 275 + sin(f)*37);
    f += PI/11.0;
  }
  endShape();

  // red line on sphere
  r = 173;
  g = 115;
  b = 114;
  stroke(r, g, b);
  x = 160;
  y = 275;
  w = 230;
  h = 275;
  line(x, y, w, h);
}


