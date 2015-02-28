
size(500,500);
background(255);

 
// the spacing between points
int space = 20;
// max radius of dots
int ms = 8;
// frequency of pattern
int f = 10;
 
// a grid of points
for (float x = 0; x<width; x+=space) {
  for (float y = 0; y<height; y+=space) {
    // calculate the size of the point based on the sum of the sin of x and y coordinates
    // note: must take absolute value b/c value could otherwise be negative
    strokeWeight(abs(ms*sin(f*x/width)+(ms*sin(f*y/height))));
    point(x, y);
  }
}
