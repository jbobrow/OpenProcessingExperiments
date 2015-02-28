
PImage theImage;
PFont myFont;

void setup() {
  size(700,500);
  background(0);
  
  //Load image into the PImage object
  theImage = loadImage("colours.jpg");
  
  //Load myFont for the colour display.
  myFont = createFont("Helvetica", 18);
  textFont(myFont);
  textSize(18);
  };

void draw() {
  
  background(0);
  
  //Draw the image to the screen 
  image(theImage,0,0,500,500);
  
  //Run our colour picker
  pickColor();
  };

void pickColor() {
  //Find the colour under the mouse
  color theColor = get(mouseX, mouseY);
  
  //Draw a box with that colour
  noStroke();
  fill(theColor);
  rect(550,150,50,50);
  
   if (mousePressed == true) {
    fill(theColor);
    }
  
  //Label rgb values
  float r = red(theColor);
  fill(255,0,0);
  text("R:" + (int) r, 550, 225);
  
  float g = green(theColor);
  fill(0,255,0);
  text("G:" + (int) g, 550, 255);
  
  float b = blue(theColor);
  fill(0,0,255);
  text("B:" + (int) b, 550, 285);
  
  String h = hex(theColor, 6);
  fill(255);
  text("#:" + h, 550, 315);
  };
  
 


