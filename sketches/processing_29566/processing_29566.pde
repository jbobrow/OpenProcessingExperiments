
PFont font;
float x = 0;
float y = 0;
float a = 0;
float b = 0;
float c = 0;
float d = 255;

void setup () {
  size (700, 400, P3D);
  smooth ();
  x = 250;
  y = 250;
  background (d);
}

void draw () {
  if(mousePressed) {
    fill (0);
  } else {
    fill (255);
  }    
  c = random (1, 100);
  font = createFont ("Verdana", 20);
  pushMatrix();
  translate(a, b, c);
  textFont (font, 24);
  textAlign (CENTER);
  text ("P U L S E", mouseX, mouseY);
  popMatrix();
  
}


