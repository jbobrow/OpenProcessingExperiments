
// Artistic Description 

// sentence 1
// Wandering in search of inspirations, I have found a nice vector of a piggie (Inspirations links below).
// I had then the idea of recreate it as a polaroid. 
// sentence 2
// My primary goal with this project was to have fun learning, making experience about how solve situations.
// subsequent sentences
// I hope you will have a bit of fun too : )
//
// I submit a simplified version 
// (no interactions, no texts and without an additional picture that I used in my first version) 
// because I am not sure if we can attach a file (with the Attach a file button) or only paste code here.
// The only thing you can do interactively is rotate the image pressing the "t" key 
// (I hope will work on every keyboard in this Universe, but not sure about it...), 
// or alternatively you can see what happens in the linked pictures (Original version links). 
//
// There are at least twenty objects and a couple shapes in this project.
//
// IMPORTANT: No piggies were harmed in the process.
//
// Wish you a great course, a lot of fun and learning.

// Original version
// https://www.dropbox.com/s/2s9yvmz3odn6wcn/screenshot_4266.png
// https://www.dropbox.com/s/lf4mcvuc4kv63f1/screenshot_4281.png 

// Inspirations
// http://www.ianbarnard.co.uk/wp-content/uploads/2012/01/polaroid-template-vector-M.jpg
// http://flyingmeat.com/acorn/docs/vector%20pig.547b09d4-3cfb-448c-b2dd-041af6888185-vector_pig.png

PImage kiss;
PFont font16, font48, font48bold;

// framework coords
int gap, centerX, centerY;

// colors
color piggieBgSky, lightGreen, mediumGreen, darkGreen, bg, clouds;
color lightPink, mediumPink, darkPink, pinkYellow;

// rotate or no rotate, this is the problem!
boolean applyTransform = false;

void setup() {
  size(600, 700);

  frameRate(8);

  // initialize fonts
  font16 = loadFont("AnonymousPro-16.vlw");
  font48 = loadFont("AnonymousPro-48.vlw");
  font48bold = loadFont("AnonymousPro-Bold-48.vlw");
  textFont(font16, 16);
  
  // initialize image
  kiss = loadImage("kiss.png");

  // initialize dims
  gap = 50;
  centerX = width / 2;
  centerY = height / 2;

  // Initialize colors
  bg = color(#404040);
  piggieBgSky = color(#89F6FF);
  lightGreen = color(#00ac26);
  mediumGreen = color(#009a44); 
  darkGreen = color(#228955);

  lightPink = color(#ffb6b1);
  mediumPink = color(#fc8987);
  darkPink = color(#f8544e);
  pinkYellow = color(#ffdfd6);

  clouds = color(#009cdf);

  // initialize modes
  imageMode(CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
  background(bg);
  
  // calls to noStroke() and noFill() to clean up the environment before each different drawing action 
  resetFillStroke();

  // if we ask to rotate the image
  if (applyTransform) {
    pushMatrix();
    rotate(-.5);
    translate(-200, 100);
    drawPolaroidBg();
    drawPiggieBg();
    drawPiggie();
    drawPolaroidFg();
    drawKiss();
    drawPolaroidText();
    popMatrix();
  } else {
    // otherwise ...
    drawPolaroidBg();
    drawPiggieBg();
    drawPiggie();
    drawPolaroidFg();
    drawKiss();
    drawPolaroidText();
  }
}

// draws the piggie, a part at once
void drawPiggie() {
  // ears
  // left
  fill(lightPink);
  pushMatrix();
  translate(centerX - 50, centerY - 135);
  rotate(.7);
  ellipse(0, 0, 70, 30);
  fill(mediumPink);
  ellipse(10, 0, 70, 20);
  popMatrix();
  // right
  fill(lightPink);
  pushMatrix();
  translate(centerX + 65, centerY - 135);
  rotate(-.7);
  ellipse(0, 0, 70, 30);
  fill(mediumPink);
  ellipse(-3, 1, 70, 20);
  popMatrix();

  // paws
  // first left
  fill(lightPink);
  pushMatrix();
  translate(centerX - 40, centerY + 3);
  rotate(.6);
  rect(0, 0, 25, 45, 10);
  fill(mediumPink);
  ellipse(10, 0, 10, 45);
  // second left
  rotate(-.3);
  fill(lightPink);
  rect(25, 10, 25, 45, 10);
  fill(mediumPink);
  ellipse(35, 10, 10, 45);
  popMatrix();

  // first right
  fill(lightPink);
  pushMatrix();
  translate(centerX + 40, centerY + 23);
  rotate(-.4);
  rect(0, 0, 25, 45, 10);
  fill(mediumPink);
  ellipse(-10, 0, 10, 45);
  // second right
  rotate(-.3);
  fill(lightPink);
  rect(25, 10, 25, 45, 10);
  fill(mediumPink);
  ellipse(15, 10, 10, 45);
  popMatrix();

  // tail
  pushMatrix();
  translate(390, 290);
  stroke(lightPink);
  //stroke(255, 0, 0, 75);
  strokeWeight(10);
  noFill();
  curve(0, 0, 0, 0, 20, 5, 25, 5);
  curve(-65, -85, 15, 5, 45, -25, 15, -15);
  //curve(65, -25, 55, - 15, 50, -20, 40, -10);
  popMatrix();

  // body
  resetFillStroke();
  fill(lightPink);
  ellipse(centerX + 10, centerY - 67, 182, 182);

  // eyes
  drawEyes(centerX - 22, centerY - 68);
  drawEyes(centerX + 41, centerY - 68);

  // nose
  fill(mediumPink);
  ellipse(centerX + 10, centerY - 35, 45, 25);
  fill(lightPink, 175);
  ellipse(centerX + 10, centerY - 35, 30, 20);
  fill(0, 155);
  ellipse(centerX + 16, centerY - 36, 5, 15);
  ellipse(centerX + 3, centerY - 36, 5, 15);

  // reflexes
  // left
  stroke(darkPink);
  fill(mediumPink);
  strokeWeight(1);
  ellipse(centerX - 44, centerY - 30, 25, 28);
  ellipse(centerX - 41, centerY - 30, 20, 26);
  fill(darkPink);
  ellipse(centerX - 38, centerY - 30, 13, 20);
  // right
  stroke(darkPink);
  fill(mediumPink);
  strokeWeight(1);
  ellipse(centerX + 61, centerY - 30, 25, 28);
  ellipse(centerX + 58, centerY - 30, 20, 26);
  fill(darkPink);
  ellipse(centerX + 55, centerY - 30, 13, 20);
}

void drawEyes(int x, int y) {
  resetFillStroke();
  fill(0);
  noStroke();
  ellipse(x, y, 15, 15);
  // sparkles
  fill(255);
  ellipse(x - 2, y - 2, 6, 6);
  ellipse(x + 3, y + 4, 3, 3);
}

void drawPiggieBg() {
  // sky
  fill(piggieBgSky);
  rect(centerX - 20, centerY - gap, 450, 450);
  // clouds
  // left
  resetFillStroke();
  fill(clouds);
  pushMatrix();
  translate(centerX - 80, centerY - 155);
  ellipse(0, 0, 100, 100);
  ellipse(-50, -3, 90, 70);
  ellipse(-55, 40, 70, 50);
  ellipse(30, -45, 60, 50);
  popMatrix();
  // right
  pushMatrix();
  translate(centerX + 85, centerY - 225);
  ellipse(0, 0, 50, 50);
  ellipse(-5, 40, 60, 50);
  ellipse(50, 45, 80, 50);
  ellipse(40, 0, 50, 40);
  ellipse(40, 20, 100, 50);
  popMatrix();

  // ground
  resetFillStroke();
  fill(lightGreen);
  beginShape();
  curveVertex(centerX - 280, centerY + 160);
  curveVertex(centerX - 280, centerY + 160);
  curveVertex(centerX - 300, centerY + 145);
  curveVertex(centerX - 230, centerY + 105);
  curveVertex(centerX - 210, centerY + 65);
  curveVertex(centerX, centerY);
  curveVertex(centerX + 220, centerY + 70);
  curveVertex(centerX + 210, centerY + 100);
  curveVertex(centerX + 250, centerY + 150);
  curveVertex(centerX + 215, centerY + 160);
  // bottom
  curveVertex(centerX + 230, centerY + 170);
  curveVertex(centerX + 230, centerY + 170);
  endShape(CLOSE);

  fill(mediumGreen);
  ellipse(centerX, centerY + 30, 200, 55);
  fill(darkGreen);
  ellipse(centerX, centerY + 25, 150, 50);
  fill(lightGreen);

  // trees
}

void drawPolaroidBg() {
  fill(255);
  rect(centerX - 20, centerY, 450, 600);
}

void drawPolaroidFg() {
  strokeWeight(30);
  stroke(255);
  noFill();
  rect(centerX - 20, centerY - gap, 420, 450);
}

// not used in this version - no fonts available
void drawPolaroidText() {
  fill(0, 75);
  pushMatrix();
  translate(centerX - 200, centerY + 180);
  text("014753987736", 0, 0);
  text("POLAROID", 300, 0);
  popMatrix();
}

void drawKiss() {
  pushMatrix();
  translate(centerX + 80, centerY + 200);
  rotate(-.5);
  // half real dims
  image(kiss, 0, 0, 200, 161);
  popMatrix();
}

// utilities - a couple methods helping when needed
void resetFillStroke() {
  noStroke();
  noFill();
}

void keyPressed() {
  if ( key =='t') {
    applyTransform = !applyTransform;
  }
  
  // NOTE : the following does not works
  // we have to use char type ( a single character between '' ) and NOT string ( "" )
  //if (key == "t") {
  //  drawGrid = !drawGrid;
  //}
}


