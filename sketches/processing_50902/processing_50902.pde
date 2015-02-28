
/*
 Ka Kit Cheong 
 Point Pattern
 01/29/2012
*/

// variables

// setup
size(800, 800);
smooth();

// draw
for (int i = 0; i < width; i++){
  for (int j = 0; j < height; j++){
    float r = map(i, 0, width, 0, 255);
    float b = map(j, 0, height, 0, 255);
    stroke(r, 0, b);
    point(i, j); 
  }
}



