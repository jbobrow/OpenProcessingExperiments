
//Problem Set 2.1 by Nathan Smofsky
//lerpColor: Shows the transition between two colours.

void setup() {
  size(200, 400);
  noStroke();
}
//-------------------------------------------------------

//make variables for 2 colors
color from = color(255, 0, 0);
color  to = color(0, 255, 0);

//make a variable for the number of rectangles
int bars = 8;

//make a variable for the change in color between rectangles
float amt;
//--------------------------------------------

void draw() {
  //create a loop that will draw the specified amount of rectangles
  for(int i = 0; i < bars; i++) {
    //the colour of each rectangle = the variable "i" times 1.0/the number of rectangles
    amt = i*(1.0/bars);
    //make a color variable for lerpColor, the syntax is lerpColor(clr 1, clr 2, amount of change);
    color x = lerpColor(from, to, amt);
    fill(x);
    //make a variable that divides the height of the canvas by the number of rectangles
    float h = height/bars;
    rect(0, i*h, width, h);
  }
}




