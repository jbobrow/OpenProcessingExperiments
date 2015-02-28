
PFont f;

void setup () {
  size (800, 600);
  stroke (0);
  background (255, 100, 100);
  f = createFont ("Verdana Bold", 16, true);
}

void draw (){
  line (25, 25, mouseX, mouseY);
  textFont (f, 32);
  fill (255, 235, 215, 100);
  text ("Kenny Rose Design", 440, 575);
  textFont (f, 16);
  fill (255, 235, 215, 100);
  text ("created with Processing and Processing.js", 20, 20);
}

void mousePressed () {
  background (255, 100, 100);
}



