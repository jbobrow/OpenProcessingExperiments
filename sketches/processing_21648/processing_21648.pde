
 //ROUTES Infographic
  
  int[] data;
// The radius of the circle
  float r = 101.5;
  
  void setup() {
  size(900,800);
  smooth();
  noLoop();
// Load data from a txt file 
  String[] stuff = loadStrings("data.txt"); 
// Convert String into an array of integers using ',' as a delimiter
  data = int(split(stuff[0], ',' ));
}

  void draw() {
  background(222,216,190);
//circle 
  smooth(); 
  noStroke();
  translate(width/2, height/2);
// Insert data to effect rectangle placement.
  for (int i = 0; i < data.length; i ++ ) {
  float theta = (9+data[i]/r);
  pushMatrix();
// Polar to cartesian coordinate conversion
  translate(r*cos(theta) , r*sin(theta));
// Rotate the rectangle along circle
  rotate(theta);
// Draw rectangles according to data points (randomly defined height for texture)  
  smooth();
  fill(13,108,5,95); 
  noStroke();
  noLoop ();
  rect(0,-10,int(random(100,130)),5);
  popMatrix();
  /*noFill ();
  smooth();
  stroke(255);
  strokeWeight (7); 
  ellipse (0,0,275,275);*/
  }
}

