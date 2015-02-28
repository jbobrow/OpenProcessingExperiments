
  void setup(){
  size (500, 500);
  background (0);
 
  noCursor ();
  }
  
void draw () {
 for (int a = 0; a < width; a = a + 11){
 for (int b = 0; b < mouseY; b = b + 11){
     float tamano = random(10);
 background (0);
 ellipse (a, b, tamano, tamano);

 }
 }
 }
