
//Copyright (c) Anna Malchow-Perryman   (my first project for the Coursera course Creative Programming, yeah!)

// This program allows the user to draw flowers, by clicking to pick a center and then dragging the mouse or their finger around that center
// It also has a rudimentary 'eraser' and the option to save pictures (saving only works in desktop mode - caution: will crash your Browser if you try it in JavaScript mode)

// variables for the 'eraser'
boolean eraserOn = false;
int eraserStartX;
int eraserStartY;

// variables for the flowers
int centerX;
int centerY;
color flowerColor;
int alpha;
int counter = 1;     // a running counter that allows me to draw a 'petal' at only every 3rd mouseDragged event

// variables for the toolbar
PImage toolbar;
int buttonSize = 0;


void setup() 
{
//  size(displayWidth, displayHeight);   // this is nice when run in desktop mode
  size(900, 800);
  background(#245A0A);

  toolbar = loadImage("toolbar.gif");   // Note that all 'buttons' are actually in a single image. The actual button functionality will be done by defining click zones above the icons.
  
  // buttonSize = toolbar.width;    // this doesn't work in JS mode, because the toolbar image doesn't get loaded fast enough
  buttonSize = 150;                 // so I'm setting the size here manually
}


void draw()
{
  // keep re-drawing the toolbar (so the flowers don't get drawn over it)
    drawToolbar();
}


void mousePressed() 
{
  if (eraserOn) {
    // if the 'eraser' tool is currently selected, remember where the mouse button was pushed down (if it ends up being dragged, this is from where the erasing rect will be drawn)
    eraserStartX = mouseX;
    eraserStartY = mouseY;
  } else {
    // if in 'flower drawing mode' change to a random color, and set the transparency so that the colour is more translucent, the further from the flower's center a drag started
    flowerColor = color(random(0, 255), random(0, 255), random(0, 255));
    alpha = round(map(dist(centerX, centerY, mouseX, mouseY), 0, width/2, 255, 0));

    // reset counter (just so it doesn't end up counting into the millions ...)
    counter = 1;
  }
}  

void mouseClicked() 
{
  if (mouseX > width-toolbar.width && (mouseY > 2*buttonSize && mouseY < 3*buttonSize)) {
    // mouse clicked over the 'save' icon: Save a png of the current frame 
    println("Sorry, saving is disabled in JavaScript Mode. Download the sketch, un-comment the line  \"saveFrame(\"output-####.png\") and run in Java Mode if you want to save pictures");
    //saveFrame("output-####.png");      // disabled for JavaScript mode!  Uncomment this line if you want to run in Java mode
    
    // button feedback so the user can see that they have successfully pressed the button (and, if running in Java mode, have saved a picture)
    grayOut(2*buttonSize);
    
  } else if (mouseX > width-toolbar.width && (mouseY > buttonSize && mouseY < 2*buttonSize)) {
    // mouse clicked over the eraser (scissors) icon: Turn eraser mode on & update the toolbar (to show that eraser mode is selected)
    eraserOn = true;
    drawToolbar();
  } else if (mouseX > width-toolbar.width && (mouseY < buttonSize)) {
    // mouse clicked over the flower icon: Turn eraser mode off  & update the toolbar (to show that flower-painting mode is selected)
    eraserOn = false;
    drawToolbar();
  } else {
    // mouse clicked anywhere else: Set the mouse position as the center for the next flower & mark it with a little yellow dot
    centerX = mouseX;
    centerY = mouseY;
    strokeWeight(10);
    stroke(#ffff00);
    point(centerX, centerY);
  }
}  

float getAngle(int x, int y)
{
  // To calculate the angle of the imaginary line between flower center and mouse position (relative to the vertical pointing up from the center), first get its length: 
  float h = dist(centerX, centerY, mouseX, mouseY);    // h is for hypotenuse  (the longest side of a right-angled triangle)
  // then get the length of the side opposite the angle you want to find:
  int o = mouseX - centerX;   //  o is for opposite
  // To get the actual angle you need the arc-sinus of the opposite divided by the hypotenuse  
  //  - except that if the mouse is below the center, the triangle would be flipped on its head - so in that case it needs to be -h 
  float angle = (mouseY < centerY) ? asin(o/h) : asin(o/-h);     // conditional assignment: convenient short form of "if (mouseY < centerY) { angle = asin(o/h) } else { angle = asin(o/-h) }"  

  return angle;
}


void mouseDragged() 
{
  if (eraserOn) {
    // if in eraser mode draw a green rectangle from the start of the drag to the current mouse position to 'delete' anything painted in that area
    noStroke();
    fill(#245A0A);
    rectMode(CORNERS);
    rect(eraserStartX, eraserStartY, mouseX, mouseY);
  } else {
    // if in flower-painting mode check the counter and only draw a petal every 3rd time (otherwise it gets a bit dense and doesn't look as 'flowery')
    //  (Note: reducing the frameRate doesn't have the same effect - mouse events seem to fire independant of the framerate)
    if (counter%3 == 0) {
      
      // draw an ellipse, like a petal, from the current center (center of the flower) to where the mouse is:   
      // (this involves a few steps, because you can't just draw an elongated elipse from poin A to B like a line)

      // create a space to store the coming transformations, so they can easily be reversed later (so that they always start from 0, rather than cumulative)
      pushMatrix();

      // calculate the position of the ellipse, half way between the mouse position and the flower center: 
      int ellipseX = (mouseX > centerX) ? centerX + (mouseX - centerX)/2 : centerX - (centerX - mouseX)/2;
      int ellipseY = (mouseY > centerY) ? centerY + (mouseY - centerY)/2 : centerY - (centerY - mouseY)/2;
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
      ellipse(0, 0, petalWidth, dist(centerX, centerY, mouseX, mouseY));

      // reset rotation & translation (automatically reset on draw(), but mouseDragged seems to fire more frequently than draw and rotation & translation end up accumulating, if not reset manually)
      popMatrix();

      // My first solution before I knew about push- & popMatrix
      //      rotate(-rotateAngle);
      //      translate(-ellipseX, -ellipseY);
    }
    counter++;
  }
}

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
}

void grayOut(int y)       // (since all 'buttons' are in one column, the grayOut function just needs to be called with the y position of the button)
{
  noStroke();
  fill(#775000, 150);
  rect(width - toolbar.width, y, buttonSize, buttonSize);
}




