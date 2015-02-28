
/*

Pixels and Images
Mike McNabb Sept, 2009

*/
PImage myImage;
PFont myFont;

void setup() {
  size (800,600);
  background(0);
  smooth();
  
  //load the image into a new PImage instance
  myImage = loadImage("inside.jpg");
  
  //create a font to display text
  myFont = createFont("Helvetica", 24);
};

void draw() {
  background(0);
  //draw the image to the stage
  image(myImage, width/2 - myImage.width/2, 
  height/2 - myImage.height/2);
  //find the colour under the mouse
  color mouseColor = get(mouseX, mouseY);
  //draw a rectangle filled with that colour
  fill(mouseColor);
  rect(0,0,25,25);
  //add the text labels
  textFont(myFont);
  textSize(16);
  fill(255, 0, 0);
  text( round( red(mouseColor) ), 50, 20);
  fill(0, 255, 0);
  text(round( green(mouseColor) ), 50, 40);
  fill(0, 0, 255);
  text(round( blue(mouseColor) ), 50, 60);
  fill(255);
  text( hex(mouseColor, 6), 50, 75);
};

