


// Flags 
boolean boolHelpModus = false; 
// Mouse 
boolean hold = false;
// image 
PImage img;

// ArrayLists
ArrayList lines;
ArrayList floodFills;
// line Width
int lineWidth = 4;
// array of colors
color [] myNiceColors = { 
  color (255, 0, 0), 
  color (0, 255, 0), 
  color (0, 0, 255), 
  color (255, 0, 255), 
  color (255, 255, 255)
};
// current color 
int colorPointer = 2; 
//
// ------------------------------------------------
void setup () {
  size(850, 600, P3D);
  img = loadImage("japan.gif");
  lines = new ArrayList();
  floodFills = new ArrayList();
}
//
// ------------------------------------------------
void draw () {
  background(255);
  image(img, 0, 0); 
  addNewLine();
  drawLines();
  showAllFloodFills();
} 
// ----------------------


