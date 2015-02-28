
void setup() {
  size(800, 1000);
}

void draw() {
  
  noStroke();
  //gets rid of borders on all below shapes
  
  fill(185, 99, 99); //0-255 black to white. For color input 3 colors RGB (use Color Selector). Fill color applies to all below this line of code
  ellipse(300, 300, 300, 300); 
  //center X, center Y, width, height
  
  fill(121, 39, 39, 100); // 0-255 transparent-opaque (no number = it assumes opaque)
  rect(200, 200, 300, 300); 
  // top x, top y, width, height
  
   fill(95, 178, 151, 150);
  triangle(15, 350, 200, 200, 375, 350);
  // corner 1 x, corner 1 y, corner 2 x...
  
  stroke(255); // 0-255 black to white. Like Fill color, this applies to everything below this line of code.
  fill(44, 75, 65);
  ellipse(175, 100, 10, 10);
  ellipse(200, 100, 10, 10);
  ellipse(225, 100, 10, 10);
  ellipse(175, 75, 10, 10);
  ellipse(200, 50, 10, 10);
  ellipse(225, 25, 10, 10);
  
  fill(183, 232, 216, 50);
  triangle(150, 15, 100, 100, 300, 20);
  
 
  
  
}


