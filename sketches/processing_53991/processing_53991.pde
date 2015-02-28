
void setup () {
  size (400, 400);
  smooth ();
  noStroke ();
  
}
void draw () {
  background (255);
   
  fill (200, 0, 200);

 for (int x=0; x<width; x+=10){

   for (int y=0; y<height; y+=10) {
      ellipse (x, y, 8, 8);
   }
}
}


