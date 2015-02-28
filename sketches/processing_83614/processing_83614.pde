
boolean goldrectclick = false; // statement for whether or not a rectangle will pop up after an action that sets it to true



void setup() {
  size(1600, 600);
} //size of screen



void draw () {
  rect(50, 100, 150, 100); //draw main 'button' rectangle

  if (goldrectclick == true) { //if this is true, make another rect
    rect(100, 150, 400, 300);
  }
}

void mouseClicked() { //if the mouse is clicked within the first button boundaries, set the boolean to true
  if ((mouseX > 50 && mouseX < 200) && (mouseY > 100  && mouseY < 200)) {
    goldrectclick = true;
  }
}
