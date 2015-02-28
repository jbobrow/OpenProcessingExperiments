
/*
* Monalisa
* drag the mouse to see the eyes of mona lisa pursue you!
* a little joke based on 'Directional' example of light.
*
* Vinicius Franco - ESDI
*/

PImage bg;
PImage quadro;

void setup() {
  size (640, 480, P3D);
  imageMode (CENTER);
  //bg = loadImage("parede.jpg");
  //background (bg);
  bg = loadImage ("parede.jpg");
  image(bg, 320, 240);
  quadro = loadImage("monalisa.jpg");
  image(quadro, 320, 240);
}

void draw() {
  noStroke(); 
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(247, 204, 204, -dirX, -dirY, -1); 
  translate(295, 137, 0); 
  sphere(3); 
  translate(27, 0, 0); 
  sphere(3);
}


