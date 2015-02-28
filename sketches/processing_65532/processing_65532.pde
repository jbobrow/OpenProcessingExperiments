
//  R.A. Robertson 2012.07 "Foam" ~ www.rariora.org ~ 

boolean toggleLoop = true;
boolean showCursor;
float r, factor, scaleRange;

void setup() {
//  frame.setTitle("Foam");
//  frame.setResizable(true);
  frameRate(200);
//  float vertical = 480, aspect = 16.0 / 9.0;   // Parameters for aspect ratios.
//  size(int(vertical * aspect), int(vertical));
  size(900, 400);                            // HARD_CODE_INSTEAD_FOR_WEB
//  size(screen.width, screen.height);         // FULL_SCREEN
  background(0);
  noStroke();
  noFill();
  smooth();
}

oid draw() {
//  noLoop(); toggleLoop = false;  // USE_FOR_MOUSE_SINGLE_FRAME_ADVANCE
 
 if (!showCursor) { noCursor(); }   
 else { cursor(); showCursor = false; }
 
 stroke(200, 15);
 strokeWeight(random(12));
 
 for (int i = 0; i < 50; i++) {  // Play with i value.
 r = random(.1, 16);
 factor = 2;
 fill (0);
 ellipse (random(width), random(height), r, r);
 fill(255, random(15));                              // Play with alpha!
 ellipse (random(width), random(height), r * factor, r * factor);
 }
 
for (int i = 0; i < 1; i++) {  // Play with i value.
 fill(0, 5);
 scaleRange = 32;
 ellipse (random(width), random(height), r + scaleRange, r + scaleRange);
 fill(255, random(1));
 ellipse (random(width), random(height), r * factor + scaleRange, r * factor + scaleRange); 
}

 fill(0, 50);
 scaleRange = 64;
 ellipse (random(width), random(height), r + scaleRange, r + scaleRange);
 fill(255, random(1));
 ellipse (random(width), random(height), r * factor + scaleRange, r * factor + scaleRange);

 fill(0, 50);
 scaleRange = 128;
 ellipse (random(width), random(height), r + scaleRange, r + scaleRange);
 fill(255, random(1));
 ellipse (random(width), random(height), r * factor + scaleRange, r * factor + scaleRange);
 
 fill(0, random(20));
 scaleRange = 256;
 ellipse (random(width), random(height), r * factor + scaleRange, r * factor + scaleRange);
 fill(255, random(1));
 ellipse (random(width), random(height), r * factor + scaleRange, r * factor + scaleRange);
 
}

void mousePressed() {
  if (mouseButton == LEFT) {
//   filter(BLUR, 1);              // Optional blur on pause.
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
      saveFrame("foam_####.jpg");
  }    
}
