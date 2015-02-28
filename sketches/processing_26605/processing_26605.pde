
// Scintillating Grid 
// Author: Rupert Russell
// October 2, 2010
// Schtauf, M., Lingelbach, B., Wrist, E.R. (1997)
// The scintillating grid illusion. Vision Research,
// 37, 1033-1038.

void setup() {
  size(283, 200);         
  background(0);          // black background
  strokeWeight(3);        // medium weight lines 
  smooth();               // antialias lines
  stroke(100, 100, 100);  // dark grey colour for lines
  noLoop();
}

void draw() {
  int step = 25;          // grid spacing
  
  //vertical lines
  for (int x = step; x < width; x = x + step){
    line(x, 0, x, height); 
  }
  
  //horizontal lines
  for (int y = step; y < height; y = y + step){
    line(0, y, width, y);
  }
  
  // Circles
  smooth();
  ellipseMode(CENTER);
  stroke(256, 256, 256);  // white circles
  for (int i = step; i < width -5; i = i + step) {
    for (int j = step; j < height -15; j = j + step) {
      strokeWeight(6); 
      point(i, j);
      strokeWeight(3); 
    }
  }
}

// Save tif when mouse is clicked
void mouseClicked(){   
  noLoop();
  save("scintillating.tif");
}

