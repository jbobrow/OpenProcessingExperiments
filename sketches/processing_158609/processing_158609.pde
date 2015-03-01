
//mouseOvers inside a nested for-Loop
//jeg, coding for artists example

color ellFillOn = color(23, 244, 89); //this is th color to be used when the mouse is ON the ellipse
color ellFillOff = color(89, 23, 244); //this is the color to be used when the mouse is OFF the ellipse
color ellFill; //this variable will be the color of the ellipse, we will change its value

float across, down;

void setup() {
  size(600, 600); //pick a size for our canvas
  across =  50; //how wide are the circles
  down =  50; //and how tall are our circles
  smooth(); //smoothe it out . . .
}

void draw() {
  background(0);
  noStroke();
  for (int i = 0; i < width/across; i++) { //width of the canvas divided by width of the circle gives us the number of objects across
    for (int j = 0; j < height/down; j++) { //same goes for the y axis
      float distance = dist(mouseX - across/2, mouseY - down/2, across * i, down * j); //constantly computing the distance form the cursor/mouse to the center of the circle being drawn

      if (distance < across/2) { //check if the distance is less than half the diameter of the circle
        ellFill = ellFillOn; //if so, change the fill . . .
        println("Over the ellipse.");
      } else {
        ellFill = ellFillOff; //else, use that other color . . .
        println(" ");
      }
      ellipseMode(CORNER);
      fill(ellFill);      
      ellipse(i * across, j * down, across, down); //finally draw your ellipse . . .
    }
  }
}

/*Possible variations . . .
Use the iterator, the i and the j to change aspects of how the circles are drawn . . .
1. 'i' affects color and 'j' affects size of circle for example . . .
2. User another shape! (line, arc, rect, PShape)
*/

