
/*
   KEYS
   a-z                  : text input (keyboard)
*/


PFont helvetica; 

 
void setup() { 
  size(1000, 700); 
  background(0);
  helvetica = loadFont("Helvetica-Bold-255.vlw"); 
  textFont(helvetica); 
  smooth(); 
} 
 
void draw() {
  float textsize = random (10,400);
   fill(255,85);
   noStroke ();
   textSize (textsize);
   if (textsize > 100) {
   fill (255,40);
   }
   if (textsize > 200) {
   fill (255,18);
   }
}

void keyReleased() {
   float x = random (width);
   float y = random (height);
   text(key, x, y);
}



