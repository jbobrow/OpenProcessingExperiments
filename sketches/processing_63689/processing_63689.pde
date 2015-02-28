
//Controls:
//Left click draws a line of color color_left
//Right click draws a line of color color_right
//Space clears the screen.

//The colors
// "final" means that this variable can't be changed
// after it is given a value
final color color_left = color(0,0,0);
final color color_right = color(255,255,255);

//Keep track of whether the line has just started.
//This is so we know when to record the first point
//of the line.
boolean lineStarted = false;
//The first point of the line
int last_x, last_y;

//Initialize the program
void setup() {
  size(200,200);
  strokeWeight(4);
  background(204);
}

void draw() {
  if(mousePressed) {
    //Select the right color
    if(mouseButton == LEFT)
      stroke(color_left);
    else
      stroke(color_right);
      
    //Draw the line
    if(lineStarted) {
      //The line has been started, so save the mouse position
      int next_x = mouseX;
      int next_y = mouseY;
      
      //Then draw the line to the mouse's position
      line(last_x,last_y, next_x,next_y);
      
      //Then start the next line from the mouse's position
      last_x = next_x;
      last_y = next_y;
    }
    else {
      //Start the next line segment from the mouse
      last_x = mouseX;
      last_y = mouseY;
      
      //Remember that the line has started
      lineStarted = true;
    }
  }
  else {
    //The mouse isn't being pressed, so the next line
    //hasn't been started.
    lineStarted = false;
  }
}

//This function's called when a key is released.
//"key" stores the value of said key.
void keyReleased() {
  if(key == ' ') {
    //If the key was space, clear the screen.
    background(204);
  }
}

