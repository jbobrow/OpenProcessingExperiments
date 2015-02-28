
// making progress...
// i'd like the shapes to be more excited but am happy that
// i made them blink the way i wanted them to
// www.builtecology.wordpress.com

boolean blink = false;

void setup () {
  size (200, 75);
  strokeWeight (2);
  smooth();
}

void draw () {
   translate (width/2, 0);
  background (0);
  if (blink == true) {
blinkmode (-40);
blinkmode (40);

} else { 
    if (blink == false) {
openeyemode (-40);
openeyemode (40);
}
  }
}

void keyPressed () {
  if ((key == 'B') || (key == 'b')) {
    blink = true;
  }

}
void keyReleased () {
  blink = false;
}

void blinkmode (int x) {
      fill (100);
arc (x, 30, 50, 25, 0, PI);
}

void openeyemode (int x) {
     fill (255, 100);
ellipse (x, 30, 50, 25);
fill (114, 168, 224);
ellipse (x, 30, 25, 25);
}

