
/* 
 Code, Homework Week 3
 reference 
 "click & drag" http://www.openprocessing.org/sketch/26884
 "HW_7 A Game" http://www.openprocessing.org/sketch/75418
 */


float x, y;
float r; //radius of the ellipse
float v; //initial speed of the ellipse
float g; //acceleration of gravity

PFont fontVariable;
PImage hand; 
PImage sven, kyle, anthony, rory; 


void setup() {
  size(540, 540);

  x = width/2;
  y = height/10;
  r = 30;
  v = 0;
  g = .9;

  fontVariable = loadFont("BodoniBT-Book-48.vlw");
  textFont(fontVariable, 24);
  hand = loadImage("hand.jpg");
  sven = loadImage("sven.jpg");
  kyle = loadImage("kyle.jpg");
  anthony = loadImage("anthony.jpg");
  rory = loadImage("rory.jpg");
}


void draw() {
  background(255);
  smooth();

  image(hand, mouseX-35, mouseY-25);
  image(sven, 0, height-110);
  image(kyle, width/4, height-110);
  image(anthony, width/2, height - 110);
  image(rory, .75*width, height - 110);

  //header
  fill(80);
  text("Mirror mirror, who's the best teacher in DT?", 35, 55);

  //ellipse
  fill(#FF5E00, 200); 
  noStroke();
  ellipse(x, y, 2*r, 2*r); 
  v+= g;
  y+= v;

  //ball bounce back when impacts on the bottom 
  if (y >= height - r) {
    v*= -.8;
    y = height - r;
  }

  //name appears
  if ((y == height - r) && (x < width/4)) {
    text("Sven", 50, 400);
  }

  if ((y == height - r) && (x > width/4) && (x< width/2)) {
    text("Kyle", width/4+50, 400);
  }

  if ((y == height - r) && (x > width/2) && (x< .75*width)) {
    text("Anthony", width/2 +30, 400);
  }

  if ((y == height - r) && (x > .75*width) && (x<width)) {
    text("Rory", .75*width+50, 400);
  }
}


//Press mouse to drag the ball, otherwise the ball falls by gravity
void mouseDragged() {
  if ((mouseX > x-r) && (mouseX < x+r) && (mouseY > y-r) && (mouseY < y+r)) {
    x = mouseX;
    y = mouseY;
    v=g=0;
  }
}


void mouseReleased() {
  g=.9;
  v+= g;
  y+= v;
  if (y >= height - r) {
    v*= -.8;
    y = height - r;
  }
}



