
/* Natalia Monroy,
 Introduction to Digital Design G (8196)
  University of Canberra
 to demostrate mouse and keyboard interaction,
 each mouse key has a different setting and pressing any keyboard key clears the screen
 pressing 's' saves file in a jpg format with added millisecond number to be able to have more than one saved file in the folder
 */

void setup() { //this runs once at the beginning 
  size (500, 500); //size of the screen
  smooth(); //smooths edges of drawings
  stroke(255); //sets stroke colour to white
  strokeWeight(1);//set the stroke in pixels
  background(10, 184,245);// sets background colour to a light blue
}

void draw() { //runs in a loop until stop is pressed
  if (mouseButton == LEFT) {  // if left button on mouse is pressed draw following code
    fill(159, 242, 7, 120);  //fills with the given colour, fourth value is a transparency
    rect(mouseX, mouseY, 40, 40); //draws a rectangle with its x & y position on the mouse X & Y thus following the movement of the mouse. Width and height are at 40.
  } 
  else  if (mouseButton == RIGHT) { //exeception, when right button is pressed draw the following code
    fill (245, 10, 244, 120);
    ellipse (mouseX, mouseY, 40,40); //draws an ellipse with with its x & y position on the mouse X & Y.
  }
}
void keyPressed() { // runs when a key is pressed
  if (key == 's') save("drawing" + millis() + ".jpg"); // if s key is pressed saves file whith the name drawing on jpg format adding milliseconds so as to be able to save more than one file 
  if (key == ' '); //if any other key is pressed run following code
  background(10, 184,245); //clears screen
}


