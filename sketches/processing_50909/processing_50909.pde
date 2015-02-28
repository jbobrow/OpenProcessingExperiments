
/*
 Ka Kit Cheong 
 Line Pattern v1
 01/29/2012
 */

// variables

// setup
size(900, 400);
smooth();

// draw
for(int i = 0; i < width; i++){
  float r = random(255);
  float g = random(255);
  float b = random(255);
  stroke(r, g, b);
  for(int j = 0; j< height; j++){
    point(i,j);
  }
}




