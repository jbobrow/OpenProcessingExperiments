
void setup() {
 
  size(500, 500);
}
 
void draw() {
  background (0);
  fill (200);
  for (int x = 10; x < 480; x = x + 30) { //width value/ how long will run/ and sets the width spacing between squares
    for (int y = 10; y < 480; y = y + 30) { //height value/ how long will run/ and sets the height spacing between squares
      rect(x, y, 20, 20); //Starting point and dimensions of the first square    
    }
  }
}



