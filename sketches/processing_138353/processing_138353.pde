
//  R.A. Robertson 2014.02 "Truchet 2" ~ www.rariora.org ~
// License: Creative Commons :: Attribution, Share Alike

int x, y, n, toggle, arcX, arcY, diameter, offset, strokeWeightVal;

void setup() {
  size(1000, 1000);
//  size(displayWidth, displayHeight);
  noFill();
  strokeCap(PROJECT);
//  stroke(0, 40);
  strokeWeightVal = 20;
  n = width / 80;
  diameter = width / n;
}

void draw() {
  if (!toggleMultiScale) { background(255); }
  if (toggleFill) { fill(200, 0, 0); } else { noFill(); }

  step = (toggleMultiScale) ? 2 : 1;
  strokeWeight(strokeWeightVal / n);

  for (y = 0; y < n; y++) {
    for (x = 0; x < n; x++) {
      toggle = int(random(2));
      arcX = x * width / n;
      arcY = y * height / n;
      if (toggle == 0) {
        arc(arcX, arcY, diameter + (offset / n), diameter + (offset / n), 0, PI / 2);
        arc(arcX + width / n, arcY + height / n, diameter + (offset / n), diameter + (offset / n), PI, PI * 1.5);
      }
      else {
        arc(arcX, arcY + height / n, diameter + (offset / n), diameter + (offset / n), PI * 1.5, PI * 2);
        arc(arcX + width / n, arcY, diameter + (offset / n), diameter + (offset / n), PI / 2, PI);
      }
    }
  }
  if (toggleBlur) { filter(BLUR, map(n, 1, 50, 12, 0)); }
  noLoop();
  toggleLoop = false;
  // println("n = " + n + "  " + 
  // "strokeWeight = " + strokeWeightVal + "/n" + "  " + 
  // "diameter = " + (diameter + offset));
}

/* ========================== UI ========================== */

boolean toggleLoop = true;
boolean toggleFill, toggleMultiScale, toggleBlur;
int step;

void mousePressed() {
  if (toggleLoop) {
    noLoop();
    toggleLoop = false;
  }
  else { 
    setup();
    loop(); 
    toggleLoop = true;
    toggleFill = toggleMultiScale = toggleBlur = false;
    offset = 0;
  }
}

void keyPressed() {
  if (key == 'i' || key == 'I') { // Saves an image file.
    saveFrame("images/SET_IMAGE_NAME_HERE_####.jpg");
  }

  if (key == '=' || key == '+') {
    n+= step;
    diameter = width / n;
    loop();
  }
  if (key == '-' || key == '_') {
    n-= step;
    diameter = width / n;
    diameter = (diameter < 1) ? 1 : diameter;
    n = (n < 1) ? 1 : n;
    loop();
  }
  if (key == 's') {
    strokeWeightVal-= 10;
    strokeWeightVal = (strokeWeightVal < 1) ? 1 : strokeWeightVal;
    loop();
  }
  if (key == 'S') { strokeWeightVal+= 10; loop(); }
  if (key == 'd') {
    offset-= 20 ;
    diameter = (diameter < 1) ? 1 : diameter;
    loop();
  }
  if (key == 'D') { offset+= 20 ; loop(); }  

  if (key == 'f' || key == 'F') { toggleFill = !toggleFill; loop(); }
  if (key == 'm' || key == 'M') {
    toggleMultiScale = !toggleMultiScale;
    loop(); }
  if (key == 'b' || key == 'B') { toggleBlur = !toggleBlur; loop(); }  
}

