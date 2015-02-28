
int numSquares=20;
float sizeSquare; 
// declare variable in header to make it global
void setup() {
  size(500, 500);
  //we can only use "width" after size() is known
  sizeSquare = width/numSquares;
}
void draw() {
  for (int h=0;h<numSquares;h++) {
    for (int v=0;v<numSquares;v++) {
      //with map, you can map one range of values to another
      //map(variable, variable min, variable max, final min, final max)
      float red=map(h, 0, numSquares, 0, 255);//is the same as:
      //float red=float(h)/numSquares*255;
      //to get a float out of operations with ints, you need to
      // convert (at least) one of the ints into a float: float(my int)
      float green=map(v, 0, numSquares, 0, 255);
      float blue=map(mouseX,0,width,0,255);
      fill(red, green, blue);
      rect(h*sizeSquare, v*sizeSquare, sizeSquare, sizeSquare);
    }
  }
}



