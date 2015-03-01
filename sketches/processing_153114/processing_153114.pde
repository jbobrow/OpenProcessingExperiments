
/*
 * Creative Coding
 * Week 5, 01 - Basic Text
 * by Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows how to use text in Processing
 * It draws the current location in x and y of the mouse on the screen
 * and a red + centered at the mouse location
 * Note that this reqires that you have the "Arial" typeface installed on
 * your computer. This font is standard on Mac and Windows computers
 *
 */

PFont myFont;      // STEP 1: the font to be used
float xSize = 10;
float my_mouseX ;
float my_mouseY ;

void setup() {
  size(800, 600);

  String [] fonts = PFont.list();
  println("Fonts available:");
  println(fonts);

  // STEP 2: create the font object and reference it to myFont
  // Using the Arial font, 16 point with antialiasing (smoothing)
  myFont = createFont("Arial", 16, true); 

  // STEP 3: use myFont at size 24
  textFont(myFont, 24);

  // set the fill colour to white
  fill(255);
}

void draw() {
  // clear the screen to black
  background(0);

  // draw the red '+' at the mouse location
  stroke(255, 0, 0);
  line(mouseX - xSize, mouseY, mouseX + xSize, mouseY);
  line(mouseX, mouseY - xSize, mouseX, mouseY + xSize);

  // get the current mouse position as a string in the form "(x,y)"
  String mousePosition = "(" + str(mouseX) + "," + str(mouseY) + ")";

  // display the mousePosition string visible on the screen

  if (mouseX<=20 && mouseY<=20) {;
        text(mousePosition, mouseX+20, mouseY+20);
  } else if (mouseX>=700 && mouseY <=20) {;
        text(mousePosition, mouseX-100, mouseY+20);
  } else if (mouseX>=700) {
        text(mousePosition, mouseX-100, mouseY);
  } else if (mouseY<=50) {
        text(mousePosition, mouseX, mouseY+20);
  } else  
        text(mousePosition, mouseX, mouseY);
}









