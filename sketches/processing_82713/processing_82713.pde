
/**
 * Pan Demo
 *
 * Processing sketch illustrates how an off-screen buffer can be
 * used to create a panning tool to view an image larger than the
 * base canvas. Use the arrow keys to scroll to the limits of
 * the displayed image.
 *
 * @author Matt Patey
 */
 
PImage bkg;
int copyOffsetX;
int copyOffsetY;
int copyWidth;
int copyHeight;
 
void setup() {
  size(500, 400, P3D);
bkg = loadImage("1.gif");
// Create an off-screen buffer that will contain the entire image.
  
  
 
  copyOffsetX = 0;
  copyOffsetY = 0;
  copyWidth = width;
  copyHeight = height;
}
 
void draw() {
image(bkg, 0,0);
image(getBufSlice(), 0, 0);
}
 
/**
 * Updates the copied version of the off-screen buffer.
 */
PImage getBufSlice() {
  return bkg.get(copyOffsetX, copyOffsetY, copyWidth, copyHeight);
}
 
/**
 * Handle key presses.
 */
void keyPressed() {
  switch(keyCode) {
  case RIGHT:
    if(copyOffsetX < bkg.width - width) {
      copyOffsetX++;
    }
    break;
 
  case LEFT:
    if(copyOffsetX > 0) {
      copyOffsetX--;
    }
    break;
 
  
  }
}

