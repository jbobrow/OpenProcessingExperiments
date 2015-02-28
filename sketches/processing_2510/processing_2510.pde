
/*

 Colour Picker
 Evelyn_Johnson89@hotmail.com
 May,2009
 
 */

PImage myImage;
PFont myFont;

void setup(){

  size(650,600);
  background(0);

  //Load the image into the PImage object
  myImage = loadImage("flower.jpg");
  
  //Load the font for the color picker display
  myFont = createFont("Helvetica",24);
  textFont(myFont);
  textSize(24);
};

void draw(){
  background(0);
  //Draw the image to the screen
  image(myImage,0,0);
 //Run our color picker function
  pickColor();

};

void pickColor() {
  // find the color of the mouse
  color theColor = get(mouseX, mouseY);
  //Draw a box with that color
  noStroke();
  fill(theColor);
  rect(525,25,50,50);
  //Label the R,G,B values
  float  r = red(theColor);
  fill(255,0,0);
  text("R:" + r,525,100);
  
  float g = green(theColor);
  fill(0,255,0);
  text("G:" + g,525,150);
  
  float b = blue(theColor);
  fill(0,0,255);
  text("B:" + b,525,200);
  
  String h = hex(theColor,6);
  fill(255,255,255);
  text ("#" + h,525,250);


};


