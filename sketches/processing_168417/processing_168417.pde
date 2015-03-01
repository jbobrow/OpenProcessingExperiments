
void setup () {
  size (600,400);
  smooth ();
  frameRate (60);
  background (0);
}


void draw () {
  fill (255, 255, 255);
  ellipse (100, 100, 30, 30);
  
  for (int i= 2; i< 20; i++) {
   translate (0, 150); 
   drawX (int (noise (90, 255)),
        int (random (40, 90)),
        int (random (100, width)),
        int (random (200, height*1.2)), 
        int (random(200, 255)));
 }
}
  
void drawX (int gray, int exp, int x, int y, int size) {
  noStroke ();
  fill (x, y, size, PI);
  ellipse (x, y, x+gray, x+gray);
  ellipse (x+30, y+40, x+gray+30, x+gray+30);
}  
 


