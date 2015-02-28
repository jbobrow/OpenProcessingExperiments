
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

boolean button = false;

void setup () {
  size (500, 500);
  background (0);
  smooth ();
}

void draw () {
  r = random (255);
  g = random (255);
  b = random (255);
  a = random (255);
  diam = random (20);
  //x = random (width);
  //y = random (height);

  if (keyPressed) {
    background (0); 
  }

  if (button) {
    noStroke ();
    fill (r, g, b, a);
    ellipse (mouseX, mouseY, diam, diam);
  } 

}

void mousePressed () {
  button = !button;
}





