
/*
Jason Moran
 Geometry Painting Sketch with text
 08/04/11
 */

PFont myDisplayFont;

void setup() {
  size(150, 119);
  smooth();
  myDisplayFont = loadFont("HoeflerText-Italic-48.vlw");
  textAlign(LEFT);
}


void draw() {

  noStroke();

  // upper left drab green
  fill(89, 132, 98);
  rect(0, 0, 37, 28);

  // large middle bright green
  fill(154, 245, 53);
  rect(47, 25, 68, 55);

  // upper middle, middle green
  fill(39, 119, 70);
  rect(37, 0, 69, 27);

  // neon green square on left
  fill(109, 227, 88);
  rect(0, 70, 16, 17);

  // far bottom left corner
  fill(53, 162, 97);
  rect(0, 86, 27, 33);

  // green vertical piece below black square
  fill(101, 209, 38);
  rect(15, 70, 12, 32);

  // large olive drab rectangle
  fill(121, 160, 50);
  rect(26, 68, 39, 51);

  // black square
  fill(72, 83, 87);
  rect(5, 26, 43, 48);

  // puke green sliver to left of black square
  fill(121, 160, 50);
  rect(0, 28, 5, 43);

  // soft green vertical sliver at bottom middle
  fill(102, 161, 107);
  rect(64, 68, 8, 51);

  // neutral green vertical rectangle at bottom middle
  fill(74, 159, 102);
  rect(72, 76, 25, 43);

  // teal green horizontal rectangle at bottom right
  fill(73, 182, 107);
  rect(96, 90, 45, 29);

  // grey sliver at bottom right
  fill(132, 162, 122);
  rect(140, 90, 10, 29);

  // soft green horizontal sliver at middle right
  fill(102, 161, 107);
  rect(96, 76, 54, 15);

  // neon green horizontal rectangle at middle right
  fill(109, 212, 46);
  rect(114, 29, 36, 47);

  // upper right drab green
  fill(89, 132, 98);
  rect(106, 0, 44, 30);

  //upper left font
  fill(255, 255, 255);
  textFont(myDisplayFont, 20);
  text("This", 1, 22);

  //bottom left font
  fill(255, 255, 255);
  textFont(myDisplayFont, 50);
  text("is", 32, 115);

  //"Y" font
  fill(0, 0, 0);
  textFont(myDisplayFont, 48);
  text("Y", 47, 65);

  //"ork" font
  rotate(PI/11.0);
  fill(0, 0, 0);
  textFont(myDisplayFont, 35);
  text("ork", 82, 35);

  //"New" font
  fill(0, 0, 0);
  textFont(myDisplayFont, 25);
  text("New", 20, 40);
}


