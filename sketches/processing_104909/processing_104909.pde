
void setup() {
  int offsetx = 0;
  int offsety = 0;
  int sizeWidth = 512;
  int sizeHeight = 508;
  
  size(2*offsetx+sizeWidth, 2*offsety+sizeHeight);
  noStroke();
  background(255);
  fill(232, 235, 226);
  rect(offsetx, offsety, sizeWidth, sizeHeight);
  
  // Draw the red rect
  fill(219, 44, 25);
  rect(offsetx+61, offsety+63, 252, 250);
  rect(offsetx+480, offsety+390, 32, 118);
  
  // Draw the yellow rects
  fill(249, 207, 87);
  rect(offsetx+0, offsety+380, 61, 128);
  rect(offsetx+313, offsety+0, 177, 184);
  
  // Draw the blue rect
  fill(23, 28, 160);
  rect(offsetx+320, offsety+390, 160, 90);
  
  // Draw the black rects
  fill(37, 18, 22);
  rect(offsetx+61, offsety+323, 124, 118);
  rect(offsetx+194, offsety+451, 119, 29);
  
  
  // Draw the black lines
  fill(26, 11, 16);
  
  // Horizontal lines
  rect(offsetx+10, offsety+53, 480, 10); 
  rect(offsetx+10, offsety+185, 51, 10);
  rect(offsetx+313, offsety+185, 177, 10);  
  rect(offsetx+61, offsety+313, 429, 10);  
  rect(offsetx+6, offsety+380, 55, 10); 
  rect(offsetx+194, offsety+380, 318, 10);  
  rect(offsetx+61, offsety+441, 252, 10);  
  rect(offsetx+194, offsety+480, 286, 10);
  
  // Vertical lines
  rect(offsetx+51, offsety+63, 10, 431);  
  rect(offsetx+118, offsety+9, 10, 44);  
  rect(offsetx+184, offsety+323, 10, 178);  
  rect(offsetx+313, offsety+4, 10, 486);  
  rect(offsetx+403, offsety+194, 10, 119);  
  rect(offsetx+480, offsety+13, 10, 488);
}



