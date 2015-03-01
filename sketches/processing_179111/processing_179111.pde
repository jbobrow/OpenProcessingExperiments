
/* @pjs preload="a.jpg"; */
/* @pjs preload="b.jpg"; */
PImage[] imgs;
float[] hmap = new float[258*460];

void setup() {
  size(258, 460);
  noSmooth();
  imgs = new PImage[2];
  imgs[0] = loadImage("a.jpg");
  imgs[1] = loadImage("b.jpg");
  for(int i=0; i<imgs.length; ++i)
    imgs[i].loadPixels();
}

void draw() {
  loadPixels();
  for(int i=0, y=0; y<height; ++y) {
    for(int x=0; x<width; ++x, ++i) {
      pixels[i] = lerpColor(
        imgs[1].pixels[i],
        imgs[0].pixels[i],
        constrain(
          (dist(x, y, mouseX, mouseY) - 10.0) / 70.0,
          0.0,
          1.0
        )
      );
    }
  }
  updatePixels();
}


