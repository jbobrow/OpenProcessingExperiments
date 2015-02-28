
//Paint over everything with the new background color, depending on whether the button is on or off
// Write the text
//Put the TV frame over it
//Draw button



PFont comic;
PImage tv;

//button
boolean button = false;
int w = 50;
int h = 50;
int circleX;
int circleY;


void setup() {
  size(720, 550);
  circleX = 570; // xPos is 250
  circleY = 100; // yPos is 250
  
  comic = loadFont("Helvetica-120.vlw");
  tv = loadImage("tv.png");
  
  
}

void draw() {
  
  if (button) {
    background(255);
    stroke(0);
  } 
  else {
    background(0);
    stroke(255);
  }
  
fill(0);
  text("Hello!!!", 250, 200);
  image(tv, 0, 0);
  fill(255); 
  text("on/off",550,150);
  smooth();
  noStroke();
  fill(0, 255, 0);
  ellipse(circleX, circleY, w, h);
}

void mousePressed() {

  if (dist(mouseX, mouseY, circleX, circleY) < 25) {

    button = !button;
  }
}


