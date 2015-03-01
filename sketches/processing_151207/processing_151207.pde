
//stage one, creating grid of 25 squares
void setup() {
  size ( 200, 200 );
  background (0);
}
 
void draw() {
  squares();
}
 
void squares () {

  int cols = 4;
  int rows = 5;
  
  int d = 20; // size of the rectangle
  int x = (width - (d*cols))/(cols+1); // horizontal space between rectangles
  int y = (height - (d*rows))/(rows+1); // vertical space between rectangles
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      fill(random(255), random(255), random(255));
      rect(x+i*(d+x), y+j*(d+y), d, d);
    }
  }
}
