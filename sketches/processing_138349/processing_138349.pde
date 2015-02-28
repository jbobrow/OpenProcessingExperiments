
//  R.A. Robertson 2014.02 "Truchet 1" ~ www.rariora.org ~
// License: Creative Commons :: Attribution, Share Alike

float x, y, n, startX, startY, endX, endY, toggle;

void setup() {
size(800, 800);
background(150, 0, 0);
n = width / 16;
strokeWeight(250 / n);
strokeCap(PROJECT);
startX = startY = endX = endY = 0;
}

void draw() {
for (y = 0; y < n; y++) {
  for (x = 0; x < n; x++) {
    toggle = int(random(2));
    startX = (toggle == 0) ? x * (width / n) : x * (width / n) + (width / n);
    endX = (toggle == 1) ? x * (width / n) : x * (width / n) + (width / n);
    startY = y * (height / n);
    endY = y * (height / n) + (height / n);
    line(startX, startY, endX, endY);
  }
}
noLoop();
toggleLoop = false;
}

/* ========================== UI ========================== */

boolean toggleLoop = true;

void mousePressed() {
    if (toggleLoop) { 
      noLoop();
      toggleLoop = false;
    }
    else { 
      setup();
      loop(); 
      toggleLoop = true;
    }
}

void keyPressed() {
  if (key == 'i' || key == 'I') { // Saves an image file.
      saveFrame("SET_IMAGE_NAME_HERE_####.jpg");
  }
  
  if (key == '=' || key == '+') {
    background(150, 0, 0);
    strokeWeight(250 / n);
    loop();
    n++;
  }
  if (key == '-' || key == '_') {
    background(150, 0, 0);
    strokeWeight(250 / n);
    loop();
    n--;
    n = (n < 1) ? 1 : n;
  }
}
