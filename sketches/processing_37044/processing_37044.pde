
size(400,400);
background(255);
smooth();

// the spacing between points
int space = 20;

// a grid of points
for (float x = 0; x<width; x+=space) {
  for (float y = 0; y<height; y+=space) {
    // calculate the size of the point based on the sum of the sin of x and y coordinates
    // note: must take absolute value b/c value could otherwise be negative
    strokeWeight(abs(5*sin(10*x/width)+(5*sin(10*y/height))));
    point(x, y);
  }
}


