
int space = 20;
int xSin = 7;
int ySin = 7;
long xWidth = 10;
long yWidth = 10;
int xyWidthCombine = 2;

 void setup() {
 size(1080, 720);

 }
 
  void draw() {
// the spacing between points

background(30, 30, 30);
smooth();

 xyWidthCombine++;
  
 if (xyWidthCombine > 2) {
   xyWidthCombine = 1;
 }
 println("X:" + xyWidthCombine);
 xWidth+=xyWidthCombine;
 yWidth+=xyWidthCombine;
 

  if (xWidth > 1000000) {
   xWidth = 0;
 }
  if (yWidth > 1000000) {
   yWidth = 0;
 }
 
// a grid of points
for (float x = 0; x<width; x+=space) {
  for (float y = 0; y<height; y+=space) {
    // calculate the size of the point based on the sum of the sin of x and y coordinates
    // note: must take absolute value b/c value could otherwise be negative
    strokeWeight(abs(xSin*sin(xWidth*x/width)+(ySin*sin(yWidth*y/height))));
    stroke(0, 150, 0, 100);
    point(x, y);
  }
}
 }

 



