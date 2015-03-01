
void setup () {
  //size and background
 size (450, 400);
 triangle (x, y, 80, 40, 40, 40) ;
}
//draw
void draw () {
  //local variables go inside code blocks
 
  background (#E54D00) ; 
  line (0, height, width, height) ;
  float r = random (1,4) ; 
  strokeWeight (30);
  triangle (x, y, 70, 20, 20, 20);
 if (key==CODED) {
   if (keyCode == DOWN) {
   if (keyPressed) {y +=10;}
   }
   if (keyCode == UP) {
   if (keyPressed) {y-=15;}
   }
 }
}
