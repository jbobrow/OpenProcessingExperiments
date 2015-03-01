
//Color works
//canvas is shifted
//toggle background colors
//get background behind squares (preserve squares on bg change)
//dispersion
import processing.video.*; 
import processing.pdf.*;

int image_counter = 0;



int sx = 0;
int sy = 0;
int grabx = 0;
int graby = 0;
Capture cam;
PGraphics filled;
PGraphics outlines;
PGraphics drag;
boolean saveOneFrame;


float initialsat;

void setup () {
  size(1620, 540);

  filled = createGraphics(width, height);
  filled.beginDraw();
  filled.endDraw();

  outlines = createGraphics(width, height);
  outlines.beginDraw();
  outlines.background(255, 0);
  outlines.endDraw();

  drag = createGraphics(width, height);
  drag.beginDraw();
  drag.background(255, 0);
  drag.endDraw();

  grabx = mouseX;
  graby = mouseY;
  color c = get(grabx, graby);
  fill(c);
  background(c);

  cam = new Capture(this);
  cam.start();
}

void draw () {

  if (saveOneFrame == true) {
    beginRecord(PDF, "Line.PDF");
  } else

    //creates disappearing effect, how to have object trails?--------
  //  fill(255,255,255,20);
  //  rect(500,0,500,500);


  if (cam.available()) { 
    // Reads the new frame
    cam.read();
  } 

  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);

  pushMatrix();
  scale(-1, 1);
  translate(-cam.width, 0);
  image(cam, 470, 0, 810, 540); 
  popMatrix();

  resetMatrix();

  image(filled, 0, 0);
  image(outlines, 0, 0);
  image(drag, 0, 0);
}


void keyPressed() {
  //green top left
  if (key == 'c') {
    cam.stop();
  }

  if (key == 'p') {
    cam.start();
  }

  //press n key to start over
  if (key == 'n') {
  }

  if (key == 'b') {


    grabx = mouseX;
    graby = mouseY;
    color c = get(grabx, graby);
    fill(c);
    background(c, 255);
  }

  if (key == 's') {
    image_counter += 1;

    saveFrame("portrait"+ image_counter + ".jpg");
    endRecord();
  }

  if (key == ' ') {
    println("space");
    outlines.beginDraw();
    outlines.background(255,0);
    outlines.endDraw();
    
    drag.beginDraw();
    drag.background(255,0);
    drag.endDraw();
    
    
    outlines.beginDraw();
    outlines.background(255,0);
    outlines.endDraw();
  }
}


void mousePressed () {
  grabx = mouseX;
  graby = mouseY;
  color c = get(grabx, graby);
  if (mouseX<= 800) {

    sx = mouseX;
    sy=mouseY;
  }
}

void mouseDragged() {
  drag.beginDraw();
  drag.background(255, 0);
  drag.noFill();
  drag.stroke(255, 255, 255, 255);
  drag.strokeWeight(1);
  drag.rect(sx, sy, mouseX-sx, mouseY-sy);
  drag.endDraw();
}

void mouseReleased () {
  //rectangles are placed strangly? off the grid?-----------------  
  //also need eyedropping capabilities
  //can changing dimensions be seen in dragging process?
  translate(width/2f, 0);
  noStroke();


  color c = get(grabx-1, graby-1);
  println(green(c));
  float intialsat = saturation(c);
  println(initialsat);

  float sat = initialsat * 10;
  color newcolor = color(hue(c), sat, brightness(c));

  //---------------------------------------filled rectangles
  filled.beginDraw();
  filled.noStroke();
  filled.fill(c);
  filled.rect(width/2+sx, sy, mouseX-sx, mouseY-sy);
  filled.scale(-1, 1);
  filled.endDraw();

  //-------------------------------------outlined rectangles
  outlines.beginDraw();
  outlines.noFill();
  outlines.stroke(255, 255, 255, 255);
  outlines.strokeWeight(1);
  outlines.rect(sx, sy, mouseX-sx, mouseY-sy);
  outlines.endDraw();
}



