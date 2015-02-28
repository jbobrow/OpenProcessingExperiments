

/* Always start sketch with a comment that labels the sketch
 Conor Russomanno
 Day 1 Sketch
 */
 
//go to processing.org if you have questions

//one line comment

/*multiple line comment
 adsf
 adsf
 asdf
 */

// [comand]+t will correctly format everything in the document (but be careful)

void setup() {  //setup happens once first
  background(150); //bachground color
  size(600, 400); //sketch size (horizontal, vertical)
  smooth();
  frameRate(1); /* changes the rate (1/second in this case) that text 
  is printed in the console (black text box at the bottom)
  sometimes referred to as test window*/
  //colorMode(HSB); ... change color mode (hue, saturation, brightness)
}


void draw() {  //the draw continues to happen in a loop

  print("hi there! "); //prints out whatever you put in there at the specified frame rate in the console
  println("hi there! [new line]"); // println automatically prints new line
  //print("hi there! \n"); is the same as println

  //rect(x-coordinate, y-coordinate, width, height); 
  fill(#ffd2d4); // takes hex values
  stroke(0);
  rect(20, 20, 20, 20);

  fill(255, 100, 0); /*also takes RGB.  
   Also, fill works in a way that everything afterwords
   is that color until you change the fill*/

  stroke(255); //changes the border color of the rectangle
  //works similarly to fill in that you have to change it or else it will persist

  rect(80, 20, 20, 20);

  fill(#ffd2a1); // takes hex values
  stroke(0);
  ellipse(400, 300, 50, 70);
}


