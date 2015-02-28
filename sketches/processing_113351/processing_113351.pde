
// drag from left to right to uncover screen
// press spacebar to slide closed


int shaded = 100;   // percentage of the screen area that is covered
boolean dragging = false; 
boolean slidingBack = false;

void setup() {
  size (600, 600);
}

void draw() {
  background (#93D0E0);
  
  
  // screen area
  stroke(0);
  fill(255);
  rect(160, 90, 320, 400);
  
  // stuff on the screen
  fill(0);
  textFont("Times", 45);  
  text("hello there!", 200, 200);
  
  if (dragging) {
    fill(100, map(shaded, 100, 0, 255, 200));
  } else {
    fill(100);
  }
  rect(160+320, 90, map(shaded, 0, 100, 0, -320), 400);
  
  if (mousePressed && !dragging) {
    if (shaded == 100 && 160 <= mouseX && mouseX <= 200) {
       dragging = true;
    } 
  } else if (mousePressed && dragging) {
    shaded = constrain(shaded - (mouseX - pmouseX)/2, 0, 100);
  } else if (dragging) {   // no mouse pressed - let go
    if (shaded < 20) { shaded = 0; }
    else { slidingBack = true; }
    dragging = false;
  } else if (slidingBack) {
    shaded = constrain(shaded + 10, 0, 100);
    if (shaded == 100) { slidingBack = false; }
  }
}


void keyPressed() {
  if (key == ' ') {
    slidingBack = true;
  }
}
