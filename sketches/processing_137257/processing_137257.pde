
// Global Variables
PImage img; // loading external images
int smallPoint, largePoint; // variables for primitive size
int shapeType = 1; // 1 for rect, 2 for ellipse
int picType = 1; // 1 for default pic, 2 for picture 2
int stopDrawing = 1; // 1 to continue drawing, 2 to stop drawing

// setup()
void setup() {
size (1024 , 720); // canvas size
colorMode(HSB, 360, 100, 100, 100); // HSB color mode
smallPoint = 25;
largePoint = 80;
imageMode(CENTER);
noStroke(); // no stroke to primitive
background(360); // white canvas background
}

// draw()
void draw(){
float pointillize = map(mouseX, 0, width, smallPoint, largePoint);

if (picType == 1){
  img = loadImage("impressionismPic.jpg");
  } else {
  img = loadImage("impressionismPic1.jpg");
}

int x = int(random(img.width)); 
int y = int(random(img.height));
color pix = img.get(x, y);
fill(pix, 128);

if (stopDrawing == 1){
  if (shapeType == 1){
    rect(x, y, pointillize, pointillize);
  } else {
    ellipse(x, y, pointillize, pointillize);
  }
}
}

// keyPressed()
void keyReleased(){
// clear the canvas
if (key == DELETE || key == BACKSPACE) background(360);
// save the current canvas as .png file
if (key == 's' || key == 'S') saveFrame("screenshot.png");
// key events
switch(key) {
  // key "c" or "C" is pressed
  case 'c': // toggle between drawing rects and circles
  case 'C':
    if (shapeType == 1){
      shapeType = 2;
    } else {
      shapeType = 1;
    }
    break;
  // key "p" or "P" is pressed
  case 'p': // toggle between loading picture 1 and picture 2
  case 'P':
    if (picType == 1){
      picType = 2;
    } else {
      picType = 1;
    }
    break;
  // key "e" or "E" is pressed
  case 'e': // toggle between drawing and stop drawing
  case 'E':
    if (stopDrawing == 1){
      stopDrawing = 2;
    } else {
      stopDrawing = 1;
    }
    break;
}
}

