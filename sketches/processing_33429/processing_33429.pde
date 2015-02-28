
/*
A sketch demonstrating a mouse button being pressed. 
 
 If you want to click on a specific area of the screen, you have to test 
 where the mouseX and mouseY are. 
 */

int bg_value = 30;

void setup() {
  size(320, 240);
}

void draw() {
  background(bg_value);
}

void mousePressed() {
  //the mousePressed function will only activate once when the mouse button is pressed down.
  bg_value = 230;
  println("Mouse Pressed --------------------- mouseX = " + mouseX + " mouseY = " + mouseY);
}

void mouseReleased() {
  //the mouseReleased function will only activate once when a held down mouse button is released
  bg_value = 80;
  println("Mouse Released -------------------- mouseX = " + mouseX + " mouseY = " + mouseY);
}

void mouseDragged() {
  //the mouseDragged function will activate as long as there is a mouse button down AND the mouse is moved.
  bg_value = 130;
  println("Mouse Dragged. mouseX = " + mouseX + " mouseY = " + mouseY);
}

void mouseMoved() {
  //the mouseMoved function activates whenever the mouse is moved. 
  //note that mouseMoved does not work when a mouse button is down.
  bg_value = 190;

  println("Mouse Moved. mouseX = " + mouseX + " mouseY = " + mouseY);
}

void mouseClicked() {
  //the mouseClicked function activates whenever the mouse is clicked. 
  //it will not activate if the user moves the mouse at all during that click (considered a drag)  
  println("Mouse Clicked. mouseX = " + mouseX + " mouseY = " + mouseY);
}


