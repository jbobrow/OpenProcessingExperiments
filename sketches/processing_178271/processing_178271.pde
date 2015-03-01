
import ddf.minim.*;

// Declare global variables
Minim minim;
AudioPlayer player;
PImage template;
int appWidth, appHeight;
int imageWidth, imageHeight;
int drawingAreaLeft, drawingAreaWidth;
int drawingAreaTop, drawingAreaHeight;
int backgroundColor;
PFont drawFont;
String drawText;


void setup() {
// Set up screem
  appWidth = 900;
  appHeight = 600;
  size(appWidth, appHeight);
  
// Load image file
  template = loadImage("ChristmasTree.png");
  
// set up drawing parameters
  colorMode(HSB, 255, 255, 255);
  
  imageWidth = template.width;
  imageHeight = template.height;
  backgroundColor = 255;
  drawingAreaLeft = imageWidth;
  drawingAreaWidth = appWidth - 2 * imageWidth;
  drawingAreaTop = imageHeight;
  drawingAreaHeight = appHeight - 2 * imageHeight;
  drawText = "Merry Christmas!";
  drawFont = createFont("Arial", 12);
  textFont(drawFont);
  textAlign(CENTER, CENTER);
  
// Draw initial screen
  drawInitialScreen();


// Load audio files
  minim = new Minim(this);
  player = minim.loadFile("FinalProject.wav");
  player.loop();
}

// method to draw the initial screen, which is the Chrstmas tree 
// around the edge of the app
void drawInitialScreen() {
  background(backgroundColor); 
  // Draw the image around the border of the screen
  for (int i = 0; i < appWidth/imageWidth; i++) {
    image(template, i*imageWidth, 0, imageWidth, imageHeight);
  }
  for (int i = 1; i < appHeight/imageHeight-1; i++) {
    image(template, 0, i*imageHeight, imageWidth, imageHeight);
  }
  for (int i = 0; i < appWidth/imageWidth; i++) {
    image(template, i*imageWidth, appHeight-imageHeight, imageWidth, imageHeight);
  }
  for (int i = 1; i < appHeight/imageHeight-1; i++) {
    image(template, appWidth-imageWidth, i*imageHeight, imageWidth, imageHeight);
  }
}

// Draw method ensures that the drawing continues
void draw() {
}

// When the mouse moves into the drawing area, the mouse x is used to 
// select the font size for Merry Christmas! and the mouse y is used to
// select the color.  If the mouse is outside the drawing area, a big
// red Merry Christmas! is drawn
void mouseMoved() {
  clearDrawingArea();
  if (mouseX >= drawingAreaLeft && mouseX <= drawingAreaLeft + drawingAreaWidth &&
      mouseY >= drawingAreaTop && mouseY <= drawingAreaTop + drawingAreaHeight) {
    fill(color(map(mouseY,drawingAreaTop, drawingAreaTop + drawingAreaHeight, 0, 255), 255, 255));
    textSize(map(mouseX, drawingAreaLeft,drawingAreaLeft + drawingAreaWidth, 2, 100));
  }
  else
  {
  fill(color(10, 255, 255));
    textSize(100);
  }
  text(drawText, drawingAreaLeft, drawingAreaTop, drawingAreaWidth, drawingAreaHeight);
    
}  

// Clear the drawing area by painting it the background color
void clearDrawingArea() {
  fill(backgroundColor);
  rect(drawingAreaLeft, drawingAreaTop, drawingAreaWidth, drawingAreaHeight);
}


