
/* funciona bien, proxima version con cambio de color en las letras */

int numHaces;
Haz[] h;
int counter;
boolean started;
int alphaRange = 500;

PImage img;

void setup () {
  numHaces = 100;
  img = loadImage ("u14.jpg");
  size (img.width, img.height);
  colorMode (HSB, 360, 100, 100, alphaRange );
  started = false;
  counter=0;
  h= new Haz[numHaces];
  for (int i=0; i<numHaces; i++) {
    h[i] = new Haz(); 
  }
  background(0);
  noStroke();
  smooth ();
}

void draw () { 
  if (started == true) {
    for (int i=0; i<counter; i++) {
      h[i].update();
    } 
  }
}

void mousePressed () {
    
  h[counter].start(mouseX, mouseY, int (random (30,100)), int (random (0,30)) );
  counter++;
  started = true;
}













