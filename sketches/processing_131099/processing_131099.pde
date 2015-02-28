
PImage img;

void setup() {
  size(400, 400);
  img = loadImage("magic1.gif");
}

void draw() {
  int cambio = 0;

  if (keyPressed) {
    if (key == 'r' || key == 'R' ) cambio = 1;
    if (key == 'v' || key == 'V' ) cambio = 2;
    if (key == 'a' || key == 'A' ) cambio = 3;
   
  }
  if (cambio==0) {
    image(img, 0, 0);
  }
  else {
    loadPixels();

    for (int x = 0; x < img.width; x++ ) {
      for (int y = 0; y < img.height; y++ ) {

        int loc = x + y*img.width;

        float r = red (img.pixels[loc]);
        float v = green (img.pixels[loc]);
        float a = blue (img.pixels[loc]);

        if (cambio==1) r=255;
        if (cambio==2) v=255;
        if (cambio==3) a=255;



        r = constrain(r, 0, 255);
        v = constrain(v, 0, 255);
        a = constrain(a, 0, 255);



        color c = color(r, v, a);
        pixels[loc] = c;
      }
    }

    updatePixels();
  }
}



