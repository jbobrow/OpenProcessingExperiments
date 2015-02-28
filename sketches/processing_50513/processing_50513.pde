

void setup() {
  size(1200, 800, P2D);
  noStroke();
  colorMode(HSB);
}


int facteur = 2;

void draw() {
  int posX = mouseX;
  int posY = mouseY;

  if (mousePressed) {
    if (mouseButton==LEFT) {
      facteur = mouseX;
    }
    else if (mouseButton==RIGHT) {
      saveFrame("background.jpg");
    }
  }

  for ( int i=0;i<width;i++) {
    for (int j=0;j<height;j++) {
      fill(map(posX, 0, width, 0, 255), map(posY, 0, height, 0, 255), i*1.1);
      rect(i*width/facteur+1, j*height/facteur+1, width/facteur, height/facteur);
    }
  }
}


