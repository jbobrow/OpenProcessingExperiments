
boolean mouseOnTop;
boolean mouseOnLeft;

void setup() {
  size(400, 300);
  background(255);
  rectMode(CENTER); // draw rect from center instead of top left

  mouseOnTop = false;
  mouseOnLeft = false;
}

void draw() {
  background(255);
  // compare mouse position
  if (mouseX >= width/2) {
    mouseOnLeft = false;
  } 
  else {
    mouseOnLeft = true;
  }
  if (mouseY >= height/2) {
    mouseOnTop = false;
  } 
  else {
    mouseOnTop = true;
  }

  print("mouseOnLeft: ");
  println(mouseOnLeft);
  print("mouseOnTop: ");
  println(mouseOnTop);

  if (mouseOnTop == true) {
    // mouse is on top
    fill(26, 104, 255); // blue
    if (mouseOnLeft == true) {
      // mouse is on top AND mouse is on left
      ellipse(mouseX, mouseY, 50, 50);
    } 
    else {
      // mouse is on top BUT mouse is on right
      rect(mouseX, mouseY, 50, 50);
    }
  }

  else {
    fill(41, 252, 67); // green
    // mouse on bottom
    if (mouseOnLeft == true) {
      // mouse is on bottom AND left
      ellipse(mouseX, mouseY, 50, 50);
    } 
    else {
      // mouse is on bottom AND right
      rect(mouseX, mouseY, 50, 50);
    }
  }
}
