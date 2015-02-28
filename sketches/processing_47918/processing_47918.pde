
/** pagestyler_zero © 2011 by peter bosshard<br />
 * is extended with a javascript interface that can be used for DOM-scripting with processingjs, css and html.
 * The grabber object is a circle with two satellites,<br />
 * one for the foreground color and one for the background color.<br />
 * click on one of the satellites, then move the mouse over the picture.<br />
 * click again to make the color under the mouse the fore- or background-color<br />
 * of the current grabber-object. you can move the grabber itself by clicking at its centre.<br />
 * To apply the colors press ENTER or RETURN. This only works, if embedded in a webpage and in combination with processing.js.
 */


PImage template_image;
String template_path = "colortemplate.jpg";
int grabber_size = 144;
grabber grab;
color defaultForeground = color(#AE9016);
color defaultBackground = color(#071C2F);
int   defaultPosx = 250;
int   defaultPosy = 250;
boolean grabbing = false;

// setup interface for communication with javascript for dom-scripting
// id 0 - 7 | curcol is a hexstring e.g. #000000
interface JavaScript {  
  void applyBgColour(String curcol);
  void applyFgColour(String curcol);
}  

void bindJavascript(JavaScript js) {  
  javascript = js;
}  

JavaScript javascript;  // instantiate processingjs


void setup() {
  size(500, 500, P2D);
  template_image = requestImage(template_path);
  grab = new grabber(defaultPosx, defaultPosy, grabber_size);
  smooth();
}

void draw() {
  background(0);
  if (template_image.width == 0) {
    // Image is not yet loaded
  } 
  else if (template_image.width == -1) {
    // This means an error occurred during image loading
  } 
  else {
    // Image is ready to go, draw it
    image(template_image, 0, 0);
  }
  
  int sat=0;
  if (grabbing) {
    color curr_clr = getCurrentColour(mouseX, mouseY);
    sat = grab.getSatellite();
    grab.setColor(sat, curr_clr);
  }
  
  grab.update(mouseX, mouseY);
  grab.display();
}

void mouseReleased() {

  int sat=0;
  if (grabbing) {
    sat = grab.getSatellite();
  }
  if (sat>0) {
    color curr_clr = getCurrentColour(mouseX, mouseY);
    switch(sat) {
    case 1:
      defaultForeground = curr_clr;
      break;
    case 2:
      defaultBackground = curr_clr;
      break;
    }
    grab.setColor(sat, curr_clr);
  }
  if (grab.click(mouseX, mouseY)) {
    grabbing = !grabbing;
  }
}

// Get Current Color from Image /////////////////////////////////////////////
color getCurrentColour(float xpm, float ypm) {
  color clr = color(51, 51, 51);
  boolean insideImage = false;
  if (template_image!=null) {
    template_image.loadPixels();
    //println(templImg.pixels.length);
    if ((xpm>=0)&&(xpm<template_image.width)&&(ypm>=0)&&(ypm<template_image.height)) {
      insideImage = true;
    }
    else {
      insideImage = false;
    }
    if (insideImage) {
      int zl = floor(ypm);
      int sp = floor(xpm);
      int idx = ((template_image.width)*(zl-1))+sp;
      clr = template_image.pixels[idx];
    }
    else {
      clr = color(0);
    }
    template_image.updatePixels();
  }
  return clr;
}

// apply changes to javascript with enter or return key
void keyPressed() {
  if ((key == ENTER)||(key == RETURN)) applyChanges();
}

// Send changes to javascript
void applyChanges() {
  if (javascript!=null) {     
    javascript.applyBgColour("#" + hex(defaultBackground, 6));
    javascript.applyFgColour("#" + hex(defaultForeground, 6));
  }
  else {    
    println("foreground: " + hex(defaultForeground, 6) + " background: " + hex(defaultBackground, 6));
  }
}



