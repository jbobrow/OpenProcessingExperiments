
//  THIS IS A TEMPLATE -- DO NOT OVERWRITE!
//  R.A. Robertson DATE "NAME_OF_SKETCH" ~ www.rariora.org ~
// License: Creative Commons :: Attribution, Share Alike

void setup() {
// frame.setTitle("SET_SKETCH_TITLE_HERE");     // IDE__APPLICATION_EXPORT_ONLY
// frame.setResizable(true);                    // USE_WITH_CAUTION!
 frameRate(2000);
// float vertical = 480, aspect = 16.0 / 9.0;   // Parameters for aspect ratios.
// size(int(vertical * aspect), int(vertical));
  size(960, 320);                            // HARD_CODE_INSTEAD_FOR_WEB
// size(screen.width, screen.height);         // FULL_SCREEN
  background(0);
  noStroke();
  noFill();
  smooth();
}

void draw() {
//  noLoop(); toggleLoop = false;  // USE_FOR_MOUSE_SINGLE_FRAME_ADVANCE
// noStroke();                     // USE_THESE_LINES_TO_REFRESH_CANVAS
// fill(0, 5);
// rect(0, 0, width, height);
  if (!showCursor) { noCursor(); }  // CURSOR_VISIBILITY:_SEE MOUSEMOVED_BELOW
  else { cursor(); showCursor = false; }  // WARNING: MAY SLOW SKETCH CONSIDERABLY!
 
 float r = random(1, 15);          // SAMPLE_CODE
 fill (random(0, 40), random (0, 50), random (255), random (5, 100));
 stroke (1, 1, 1, 10);
 ellipse (random(width), random(height), r, r);
}

/* ========================== UI ========================== */

boolean toggleLoop = true;
boolean showCursor;

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop();
      cursor();
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
 if (mouseButton == RIGHT) {
 setup();
 }
}

void mouseMoved() {
  showCursor = true;
}

void keyPressed() {
  if (key == 'i' || key == 'I') { // Saves an image file.
      saveFrame("SET_IMAGE_NAME_HERE_####.jpg");
  }    
}
