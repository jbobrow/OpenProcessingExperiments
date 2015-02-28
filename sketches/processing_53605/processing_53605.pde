
//Ryanne Holies
//PS2-1

//lerpColor = shows the variations in hue between two colours.

void setup() {
  size(400, 400);
  noStroke();
}

//--------------------------------------------


//start with 2 color variables
color color_1 = color(255, 0, 141);
color color_2 = color(0, 27, 255);
//make a variable for the amount of change in color between each object
float amt;

//make a variable for the number of bars you want
int bars = 12;

//--------------------------------------------

void draw() {
  //create a loop that will draw the 12 rectangles
  for(int i = 0; i < bars; i++) {
    
    //color of rectangle = variable i times 1.0 divided by the number of rectangles
    amt = i*(1.0/bars);
    
    //make a color variable for lerpColor
    //syntax is lerpColor(1st color, 2nd color, amount of color change);
    color colorX = lerpColor(color_1, color_2, amt);
    
    //fill the rectangles with the variable you just made
    fill(colorX);
    
    //make a variable that divides the width of the canvas by the number of rectangles
    float w = width/bars;
    
    //draw a rectangle for the loop
    rect(i*w, 0, w, height);
  }
}

