
//pattern based off of Bard Borevitz's "pattern 5"

size(450,450);
background(255);
smooth();
 
// the spacing between points
int space = 7;
 
// a grid of points›
for (float x = 0; x<width; x+=space) {
  for (float y = 0; y<height; y+=space) {
    // note: must take absolute value b/c value could otherwise be negative
    strokeWeight(abs(2*sin(5*x/width)+(2*sin(5*y/height))));
    triangle(x, y, x*space, y,x*space,y*space);
    fill(255-3*space);
    stroke(255-space*35, 255-20*space, 255-20*space);

  }
}


