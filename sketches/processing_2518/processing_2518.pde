
/*

June 15 2009
jenna@jennaledger.com

*/

PImage myImage;
PFont myFont;

void setup() {
  size(400,350);
  background(0);
  
  
  myImage = loadImage("pool.jpg");
  
  myFont = createFont("Times",14);
  textFont(myFont);
  textSize(16);
};


void draw() {
  
  background(0);
  image(myImage,0,0);
  pickColor();
  
};

void pickColor() {
  
  color theColor = get(mouseX, mouseY);
  noStroke();
  fill(theColor);
  rect(105,275,50,50);
  float r = red(theColor);
  fill(255,0,175);
  text("R" +(int) r,175,295);

  
  float g = green(theColor);
  fill(0,255,100);
  text("G" +(int) g,175,310);
  
  float b = blue(theColor);
  fill(0,100,255);
  text("B" +(int) b,175,325);
  
  String h = hex(theColor,9);
  fill(255);
  text("#" + h,225,310);
  
};

