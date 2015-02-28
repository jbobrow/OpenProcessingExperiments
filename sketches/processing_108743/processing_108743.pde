
size(800,400);
background(255);
 
// a grid of points with uneven spacing
// note that this is sensitive to the initial value of the counter (x,y)
// if they start at 0 you create an infinite loop!
for (float x = 5; x<width; x*=1.5) {
  for (float y = 5; y<height; y*=1.125) {
    strokeWeight(2);
    point(x, y);
  }
}
