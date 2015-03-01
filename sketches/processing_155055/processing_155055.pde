
//Copyright (c) Anna Malchow-Perryman   (my first project for the Coursera course Creative Programming, yeah!)

// This program allows the user to draw flowers, by clicking to pick a center and then dragging the mouse or their finger around that center
// It also has a rudimentary 'eraser' and the option to save pictures (saving only works in desktop mode - caution: will crash your Browser if you try it in JavaScript mode)


color green = #245A0A;
ArrayList<PImage> prevStates;                   // allows to save the current state of the drawing
ArrayList<PVector> prevCenters;                 // allows to save the current flowerCenter

// variables for the 'eraser'
boolean eraserOn = false;    // eraser tool selected
boolean erasing = false;     // just made a selection with the eraser tool
int eraserStartX;
int eraserStartY;

// variables for the flowers
boolean painting = false;    // just painted something
PVector flowerCenter;
color flowerColor;
int alpha;
int counter = 1;     // a running counter that allows me to draw a 'petal' at only every 3rd mouseDragged event

// variables for the toolbar
PImage toolbar;
int buttonSize = 0;


void setup() 
{
  //  size(displayWidth, displayHeight);   // this is nice when run in desktop mode
  size(800, 600);
  background(green);

  toolbar = loadImage("toolbar.gif");   // Note that all 'buttons' are actually in a single image. The actual button functionality will be done by defining click zones above the icons.

  // buttonSize = toolbar.width;    // this doesn't work in JS mode, because the toolbar image doesn't get loaded fast enough
  buttonSize = 150;                 // so I'm setting the size here manually

  // initial center point for first flower, if not changed by user
  flowerCenter = new PVector(width/2, height/2);

  // save initial state
  prevStates = new ArrayList<PImage>();
  prevCenters = new ArrayList<PVector>();
  saveState();
}

void draw()
{
  // keep re-drawing the toolbar (so the flowers don't get drawn over it)
  drawToolbar();
}

/* Mouse functions ----------------------------------------------------------------------------------------------------------------- */

void mouseClicked() 
{
  // Clicks on Toolbar buttons

  if (mouseX > width-toolbar.width && (mouseY > 3*buttonSize && mouseY < 4*buttonSize)) {
    // mouse clicked over the 'save' icon: Save a png of the current frame 
    saveToFile();
  } else if (mouseX > width-toolbar.width && (mouseY > 2*buttonSize && mouseY < 3*buttonSize)) {
    // mouse clicked over the 'undo' icon: return to previous state 
    undo();
  } else if (mouseX > width-toolbar.width && (mouseY > buttonSize && mouseY < 2*buttonSize)) {
    // mouse clicked over the 'eraser' (scissors) icon: Turn eraser mode on & update the toolbar (to show that eraser mode is selected)
    eraserOn = true;
    drawToolbar();
  } else if (mouseX > width-toolbar.width && (mouseY < buttonSize)) {
    // mouse clicked over the 'flower' icon: Turn eraser mode off  & update the toolbar (to show that flower-painting mode is selected)
    eraserOn = false;
    drawToolbar();

    // Click on Paint surface
    
  } else if (!eraserOn && mouseX < width-toolbar.width) {
    setFlowerCenter();
  }
}  


void mousePressed() 
{
  if (eraserOn) {
    // if the 'eraser' tool is currently selected:
    prepEraser();
  } else {
    // in 'flower drawing mode':        
    prepPainting();
  }
}  

void mouseDragged() 
{
  if (eraserOn) {
    makeEraserSelection();
  } else {
    paint();
  }
}

void mouseReleased()
{
  if (erasing) {
    // complete the erasing of selected area
    erase();
  } else if (painting) {  
    onStopPainting();
  }
}

/* -----------------------------------------------------------------------------------------------------------------  END   Mouse functions  -- */


/* Functions for flower painting tool ----------------------------------------------------------------------------------------------------------------- */

void setFlowerCenter()
{
  // mouse clicked anywhere else: Set the mouse position as the center for the next flower & mark it with a little yellow dot
  flowerCenter = new PVector(mouseX, mouseY);
  strokeWeight(10);
  stroke(#ffff00);
  point(flowerCenter.x, flowerCenter.y);

  // save current state
  saveState();
}

void prepPainting()
{
  // change to a random color, and set the transparency so that the colour is more translucent, the further from the flower's center a drag started
  flowerColor = color(random(0, 255), random(0, 255), random(0, 255));
  alpha = round(map(dist(flowerCenter.x, flowerCenter.y, mouseX, mouseY), 0, width/2, 255, 0));

  // reset counter (just so it doesn't end up counting into the millions ...)
  counter = 1;
}

void paint()
{
  // if in flower-painting mode check the counter and only draw a petal every 3rd time (otherwise it gets a bit dense and doesn't look as 'flowery')
  //  (Note: reducing the frameRate doesn't have the same effect - mouse events seem to fire independant of the framerate)
  if (counter%3 == 0) {

    // draw an ellipse, like a petal, from the current center (center of the flower) to where the mouse is:   
    // (this involves a few steps, because you can't just draw an elongated elipse from poin A to B like a line)

    // create a space to store the coming transformations, so they can easily be reversed later (so that they always start from 0, rather than cumulative)
    pushMatrix();

    // calculate the position of the ellipse, half way between the mouse position and the flower center: 
    float ellipseX = (mouseX > flowerCenter.x) ? flowerCenter.x + (mouseX - flowerCenter.x)/2 : flowerCenter.x - (flowerCenter.x - mouseX)/2;
    float ellipseY = (mouseY > flowerCenter.y) ? flowerCenter.y + (mouseY - flowerCenter.y)/2 : flowerCenter.y - (flowerCenter.y - mouseY)/2;
    // move the current 0,0 point there (otherwise the ellipse won't be rotated around it's own center, but with the canvas 0,0 as pivot)
    translate(ellipseX, ellipseY);

    // calculate the rotation required & apply
    float rotateAngle = getAngle(mouseX, mouseY);
    rotate(rotateAngle);

    // make the width of the ellipse (petal) dependant on the current speed of the mouse (the faster the wider) 
    float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
    int petalWidth = round(speed);

    // draw the ellipse
    noStroke();
    fill(flowerColor, alpha);
    ellipse(0, 0, petalWidth, dist(flowerCenter.x, flowerCenter.y, mouseX, mouseY));

    // reset rotation & translation (automatically reset on draw(), but mouseDragged seems to fire more frequently than draw and rotation & translation end up accumulating, if not reset manually)
    popMatrix();

    painting = true;
  }
  counter++;
}

// helper function for paint()
float getAngle(int x, int y)
{
  // To calculate the angle of the imaginary line between flower center and mouse position (relative to the vertical pointing up from the center), first get its length: 
  float h = dist(flowerCenter.x, flowerCenter.y, mouseX, mouseY);    // h is for hypotenuse  (the longest side of a right-angled triangle)
  // then get the length of the side opposite the angle you want to find:
  float o = mouseX - flowerCenter.x;   //  o is for opposite
  // To get the actual angle you need the arc-sinus of the opposite divided by the hypotenuse  
  //  - except that if the mouse is below the center, the triangle would be flipped on its head - so in that case it needs to be -h 
  float angle = (mouseY < flowerCenter.y) ? asin(o/h) : asin(o/-h);     // conditional assignment: convenient short form of "if (mouseY < flowerCenter.y) { angle = asin(o/h) } else { angle = asin(o/-h) }"  

  return angle;
}

void onStopPainting()
{
  painting = false;

  // save current state
  saveState();
}
/* ----------------------------------------------------------------------------------------------------------------- END   Functions for flower painting tool -- */


/* Functions for eraser tool ----------------------------------------------------------------------------------------------------------------- */

void prepEraser()
{
  // remember where the mouse button was pushed down (if it ends up being dragged, this is from where the erasing rect will be drawn)
  eraserStartX = mouseX;
  eraserStartY = mouseY;
}

void makeEraserSelection()
{
  image(prevStates.get(prevStates.size()-1), 0, 0);
  stroke(153);
  strokeWeight(1);
  noFill();
  rectMode(CORNERS);
  rect(eraserStartX, eraserStartY, mouseX, mouseY);

  erasing = true;
}

void erase()
{
  // fill the selected area with green
  noStroke();
  fill(green);
  rectMode(CORNERS);
  int eraserEndX = (eraserStartX < mouseX) ? mouseX+1 : mouseX;
  int eraserEndY = (eraserStartY < mouseY) ? mouseY+1 : mouseY;

  eraserStartX = (eraserStartX < mouseX) ? eraserStartX : eraserStartX+1;
  eraserStartY = (eraserStartY < mouseY) ? eraserStartY : eraserStartY+1;

  rect(eraserStartX, eraserStartY, eraserEndX, eraserEndY);

  erasing = false;

  // save current state
  saveState();
}
/* ----------------------------------------------------------------------------------------------------------------- END   Functions for eraser tool  -- */

/* Functions for Undo  ----------------------------------------------------------------------------------------------------------------- */

void saveState() 
{
  // add the current painting as an image to the ArrayList of previous states
  prevStates.add(get(0, 0, width-toolbar.width, height));

  // add the current center point to the ArrayList of previous center points
  prevCenters.add(flowerCenter);  

  // Limit the number of undo levels   (not sure how many levels it would take to cause memory problems ...)
  if (prevStates.size() > 20) {
    prevStates.remove(prevStates.get(0));
    prevCenters.remove(prevCenters.get(0));
  }
}


void undo() 
{
  if (prevStates.size() > 1) {   // i.e. there must be at least the current and one previous state
    // remove the current state from the list of saved states
    prevStates.remove(prevStates.size()-1);
    prevCenters.remove(prevCenters.size()-1);
    // restore to the previous state by placing the saved image  
    image(prevStates.get(prevStates.size()-1), 0, 0);
    flowerCenter = prevCenters.get(prevCenters.size()-1);

    // button feedback so the user can see that they have successfully pressed the button
    // TODO: turn buttons into individual objects so they can have up/down states for feedback

    // gray out the button if no more undos are possible
    if (prevStates.size() <= 1) {
      grayOut(2*buttonSize);
    }
  }
}
/* ----------------------------------------------------------------------------------------------------------------- END   Functions for Undo  -- */


/* Toolbar functions -----------------------------------------------------------------------------------------------------------------  */

void drawToolbar() 
{
  // draw the brown toolbar area 
  fill(#775000);
  stroke(#2a1d03);
  strokeWeight(10);
  rectMode(CORNER);
  rect(width - toolbar.width - 10, -5, toolbar.width + 20, height +10);   // offsetting it a bit, so that only the stroke on the left is visible (I guess a single line would have done the same .... :-))
  
  // add the image with the 3 icons  
  image(toolbar, width - toolbar.width, 0);

  // gray out the tool that is currently selected, by drawing a semi-transparent square over it 
  if (eraserOn) {
    grayOut(buttonSize);
  } else {
    grayOut(0);
  }

  // gray out the Undo if there is nothing left to undo
  if (prevStates.size() <= 1) {
    grayOut(2*buttonSize);
  }
}

void grayOut(int y)       // (since all 'buttons' are in one column, the grayOut function just needs to be called with the y position of the button)
{
  noStroke();
  fill(#775000, 150);
  rect(width - toolbar.width, y, buttonSize, buttonSize);
}

/* ----------------------------------------------------------------------------------------------------------------- END   Toolbar functions  -- */

void saveToFile() 
{
  println("Sorry, saving is disabled in JavaScript Mode. Download the sketch, un-comment the line  \"saveFrame(\"output-####.png\") and run in Java Mode if you want to save pictures");
  //saveFrame("output-####.png");      // disabled for JavaScript mode!  Uncomment this line if you want to run in Java mode

  // button feedback so the user can see that they have successfully pressed the button (and, if running in Java mode, have saved a picture)
  grayOut(3*buttonSize);
}




