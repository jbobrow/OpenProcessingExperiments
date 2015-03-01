
boolean grow = false;

void setup() {
  size(851, 315);
  noSmooth();
  frameRate(120);
  background(0);
}


void draw() {

  loadPixels();

  if (grow) {

    int E = int(random(2.4, 7.05));

    for (int i = width*E+E; i < pixels.length-(width*E)-E; i++) {

      if ((pixels[i]&0xFF) == 0) {

        int y = i/width;
        int x = i-width*y;
        float sum = 0;
        //float limit = 0.2*pow((E*2+1),2)*255;

        for (int ky = -E; ky <= E; ky++) {
          if (sum > 0) break;
          for (int kx = -E; kx <= E; kx++) {
            int pos = (y + ky)*width + (x + kx);
            sum += pixels[pos]&0xFF;
          }
        }

        if ((sum > 0) && (random(0, 100) < 0.1)) {
          pixels[i] = -1;
        }
      }
    }
    updatePixels();
  }

}

void Lmark() {
  if (mouseY > height-4 || mouseY < 3) return;
  pixels[(mouseY+int(random(-3, 3)))*width+(mouseX+int(random(-3, 3)))] = -1;
  updatePixels();
}

void Dmark() {
  if (mouseY > height-4 || mouseY < 3) return;
  pixels[mouseY*width+mouseX] = 0;
  for (int d = 0; d < 4; d++) {
    pixels[(mouseY+int(random(-3, 3)))*width+(mouseX+int(random(-3, 3)))] = 0;
  }
  updatePixels();
}

void mousePressed() {
  if (mouseButton == LEFT) Lmark();
  if (mouseButton == CENTER) grow = !grow;
  if (mouseButton == RIGHT) Dmark();
}

void mouseDragged() {
  if (mouseButton == LEFT) Lmark();
  if (mouseButton == RIGHT) Dmark();
}

void keyPressed() {
  if (key == 'x') grow = !grow;
  if (key == ' ') {
    background(0); 
    grow = false;
  }
}


