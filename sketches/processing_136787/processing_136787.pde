
  void setup(){
  size (500, 500);
  background (0);
  smooth (5);
  noCursor ();
  }
  
void draw () {
 for (int a = 0; a < width; a = a + 11){
 for (int b = 0; b < height; b = b + 11){
  float d = dist(mouseX, mouseY, a, b);
      ellipse (a, b, d/15, -d/15);
 }
 }
 }

