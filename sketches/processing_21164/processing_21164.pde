
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 18-2: Graphing comma separated numbers from a text file

int[] data;
PFont f;

// The radius of a circle
float r = 100;

// The width and height of the boxes
float w = 40;
float h = 40;
void setup() {
  size(520,520);
  smooth();
 // The text from the file is loaded into an array. 
  String[] stuff = loadStrings("data.txt");
  // This array has one element because the file only has one line. 
  // Convert String into an array of integers using ',' as a delimiter
  data = int(split(stuff[0], ',' ));
}

void draw() {
  background(255);
  stroke(0);
  //circle 
   translate(width/2, height/2);
  noFill();
  stroke(0);
  // Our curve is a circle with radius r in the center of the window.
  ellipse(0, 0, r*2, r*2); 
  float arclength = 0;
  for (int i = 0; i < data.length; i ++ ) {
    // The array of ints is used to set the color and height of each rectangle.
 arclength += w/2;
 
  float theta = arclength / r;
   pushMatrix();
    // Polar to cartesian coordinate conversion
    translate(r*cos(theta) , r*sin(theta));
    // Rotate the box
    rotate(theta);
  
  fill(data[i]); 
  rect(0,-10,(1+data[i]),10);
  popMatrix();
  
  arclength += w/2;
}

}

