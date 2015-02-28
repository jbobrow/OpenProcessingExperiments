
/* @pjs preload= "Waldo.jpg"; "mask_2.png";*/
PImage bkg;
PImage mask;
int x = 3000;
int y = 3000;
int zoomrate = 40;

void setup () {

  size (800, 600);
  bkg = loadImage ("Waldo.jpg");
  mask = loadImage ("mask_2.png");
}

void draw () {

  imageMode (CORNER);
  image (bkg, 0, 0);

  imageMode (CENTER);
  image (mask, mouseX, mouseY, x, y);
  
  x = constrain (x, 3000, 8000);
  y = constrain (y, 3000, 8000);

  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == DOWN) {
        x += zoomrate;
      } 
      else if (keyCode == UP) { 
        x -= zoomrate;
      }
    }
  }

  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == DOWN) {
        y += zoomrate;
      } 
      else if (keyCode == UP) { 
        y -= zoomrate;
      }
    }
  }
}






