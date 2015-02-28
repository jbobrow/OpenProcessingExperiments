
/****************************\
|   Template for Gradients   |
|  Written by Dominik Schmid |
\****************************/

// Feel free to copy but it is nice to give people credit where it's due.


// !!! Please don't let the comments scare you, they're there to help !!!

void setup() {
  size(400, 550, P2D);  
  // You NEED to have this "P2D" option for the gradients to work.
  // "P2D" is your renderer, which is what actually draws things (when you call eg. line(...) )
  
  smooth();  // smooooth =]
  
  strokeWeight(10);  // So the lines are more visible
  
  //colorMode(HSB, TWO_PI, 100, 100);  
  
  colorMode(HSB, 360, 100, 100, 100);
  // "Hue, Saturation, Brightness" colour mode (instead of RBG)
  // The last 4 arguments (those things between the "( )" ) are the maxium values for the colours
  // HSB is very useful, especially if you only want to vary the hue.
  
  background(0, 0, 10);  // Darkish background (note: this is using the HSB mode)
  
  /* Simple example: a line that changes color      */
  beginShape();                   // This will indicate the start of the drawing
                                  // note: I'm indenting this part as it is a block of code
    stroke(137, 90, 89);          // Lime Green end
    vertex(width*.1, height*.1);  // this is the first (lime-green) end
    stroke(326, 90, 89);          // Man-ly Pink =]
    // ! Note: If you have no clue what numbers you want (which is likely),
    //         there is a neat tool called the color selector.
    //         it is under "Tools > Color Selector"
    vertex(width*.9, height*.1);  // The other end co-ordinates
  endShape();
  
  
  /* Simple example: a line that fades in           */
  beginShape(LINES);              // same deal here 
    stroke(0, 0, 0, 0);           // 100% transparent (only the 4th zero makes it transparent)
    vertex(width*.1, height*.2);  // again, first point
    stroke(42, 90, 89, 100);      // orange with 100% opacity
    vertex(width*.9, height*.2);  // note: I'm using width/height variables for scalability. you should too.
  endShape();
  
  
  
  
  /* More Complicated example: a coloured polygon   */
  
  float r = width/2;  // The radius of our polygon
  int sides = 5;      // The number of sides that the polygon has
  
  noStroke();         // No outline
  colorMode(HSB, TWO_PI, 100, 100);  // I'll be using radians for the hue
  
  pushMatrix();
    translate(width/2, height*.6);
    // Basically shift to the middle of the window
    
    beginShape();  // Draw the Polygon
      for (float t=0; t<TWO_PI; t+=TWO_PI/sides) { 
        // t is Theta (in radians), 
        // loop a whole circle, (note: I'm not specifying the first point twice)
        // go in certian increments so it is a regualar polygon
        
        fill(t, 75, 80);  
        // specifying the color for each specifyed point (vertex)
        // remember: these numbers are for the mode we specified earlier
        
        vertex(r*cos(t), r*sin(t));  // a bit of trig, note: sin and cos by default work in radians
        
        println(360*t/TWO_PI);  
        // prints out a line (therefore println) with the angle in degrees
        // in the bottom black pane of window (that is what it's for! )
        // println(...) is VERY useful to find out what's wrong with you'r code
      }
    endShape();
  popMatrix();

}


void draw() { }  // nothing to draw anymore, since we did it in setup()
                 // the reason i still have it here is that is makes the sketch 
                 // responsive to eg. clicking on the close window button.

