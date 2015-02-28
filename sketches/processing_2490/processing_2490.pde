
/*

Color Picker
sean_velasco@hotmail.com
may 2009

*/

PImage myImage;
PFont myFont;



void setup (){
  
  size(600, 600);
  background(0);
  
  //load image into the PImage object, notice that the image is not yet drawn//
  myImage = loadImage("flower.jpg");
  
  //load the font for the color picker display. 2 values = fontname and pt. size//
  myFont = createFont("Helvetica", 24);
  //default font selection//
  textFont(myFont);
  textSize(14);
  
  
};


void draw(){
  
  background(0);
  //draw image to screen. 3 variables = image name, x pos, y pos, and also width and height if you need to change its' default value//
  image(myImage,0,0);
  //run the color picker function//
  pickColor();
  
  
  
};

void pickColor() {
  
  //find the color under the mouse pointer//
  color theColor = get(mouseX, mouseY);
  //draw a box with the selected color//
  noStroke();
  fill(theColor);
  rect(525, 25, 50, 50);
  //label the RGB values//
  float r = red(theColor);
  fill(255,0,0);
  //draw the text. 3 values = what to display, x, y)
  text("R: " +  (int) r, 525, 100);
  float g = green(theColor);
  fill(0,255,0);
  text("G: " + (int) g, 525, 120);
  float b = blue(theColor);
  fill(0,0,255);
  text("B: " + (int) b, 525, 140);
  
  fill(255);
  text ("#" + hex(theColor, 6), 525, 160);
  
  
};



