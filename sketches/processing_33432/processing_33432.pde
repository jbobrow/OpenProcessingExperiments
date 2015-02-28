
/*
A sketch demonstrating a mouse button being pressed. 

If you want to click on a specific area of the screen, you have to test 
where the mouseX and mouseY are. 
*/

int bg_value = 30;

void setup() {
  size(320, 240);
  noStroke();
  smooth();
}

void draw() {
  background(255);
  fill(45, 20, bg_value);
  ellipse(width*.5, height*.5, width, height);
}

void mousePressed() {
  //the mousePressed function will only activate once when the mouse button is pressed down.
  if (mouseButton == RIGHT) {
    bg_value = 0;
    println("Mouse Pressed --------------------- mouseX = " + mouseX + " mouseY = " + mouseY);
  } else {
    bg_value = 250;
      println("Mouse Pressed --------------------- mouseX = " + mouseX + " mouseY = " + mouseY);
  }
}

void mouseReleased() {
  //the mouseReleased function will only activate once when a held down mouse button is released
  bg_value = 30;
  println("Mouse Released -------------------- mouseX = " + mouseX + " mouseY = " + mouseY);
}

void mouseClicked() {
  //When a button is clicked and released in the same position
  println("Mouse Clicked --------------------- mouseX = " + mouseX + " mouseY = " + mouseY);
}
void mouseDragged() {
  //the mouseDragged function will activate as long as there is a mouse button down AND the mouse is moved.
  bg_value = 130;
  println("Mouse Dragged. mouseX = " + mouseX + " mouseY = " + mouseY);
}

void mouseMoved() {
  //the mouseMoved function activates whenever the mouse is moved. 
  //note that mouseMoved does not work when a mouse button is down.
  println("Mouse Moved. mouseX = " + mouseX + " mouseY = " + mouseY);
}


                
                                
