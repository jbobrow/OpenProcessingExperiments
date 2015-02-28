
/**
This is a basic example of the bare bones you need to display text.

C. Andrews
2014-01-20
**/

// Text is stored in Strings
String str = "Bowties are very cool";

// We ened a font to tell the computer how to draw the text
PFont font;
void setup(){
 size(600,600);

// This creates a font object from a font available on your system
 font = createFont("Arial", 16, true); // Arial, 16 point, anit-aliasing on
  
  // Then we set the fonct the way we would set the fill color
  textFont(font);
}


void draw(){
  background(255);
  fill(0);
 
 // display the text at the position 50,50
  text(str,50,50);
  
  noFill();
  // the origin of the text is in the lower left hand corner
  // to illustrate this and the other dimensions of the text, here is a box around the text
  rect(50, 50 - textAscent(),textWidth(str), textAscent() + textDescent());
}


