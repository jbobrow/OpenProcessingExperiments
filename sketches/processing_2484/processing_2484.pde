
/*

cindy Ng
color picker
June 16, 2009
cindy.ng@cindysng.com
*/

PImage myImage;
PFont myFont;

void setup() {
  size (600,450);
  background(0);

  //load the image into the PImage object
  myImage = loadImage("rainbow.jpg");

//Load the font for the colorpicker display
myFont = createFont("Helvetica", 24);
textFont(myFont);
textSize(24);
};

void draw() {
  background(0);
  //Draw the image to the screen
  image(myImage,0,0);
  //Run our color picker function
  pickColor();
};

void pickColor() {
  //Find the color under the mouse
  color theColor = get(mouseX,mouseY);
  //Draw a box with that color
  noStroke();
  fill(theColor);
  rect(525,25,50,50);
  //Label the R,G,B values
  float r = red(theColor);
  fill(255,0,0);
  text("R: " + (int) r, 525,100);
 
  float g =green(theColor);
  fill(0,0,255);
  text("G:" + (int) g, 525,130);
 
  float b = blue(theColor);
  fill(0,255,0);
  text("B: " + (int) b, 525,160);
 
  String h = hex(theColor,6);
  fill(255);
  text("#" + h, 525,190);
  
  
  
  
};

