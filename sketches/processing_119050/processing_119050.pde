
PImage img;
PImage img2;

void setup() {
  background(0);
  size(1000, 900);  
  img = loadImage("paris.jpg");
  img2 = loadImage("paris.jpg");
}

void draw() {
  img.loadPixels();
  img2.loadPixels();
  for (int i=0; i<img.width*img.height; i++) {
    color c = img.pixels[i];
    if (brightness(c) < mouseX/2) {
      img.pixels[i] = color(0, 0, 255);
    } 
    else if (brightness(c) >= mouseX/2) { 
      img.pixels[i] = img2.pixels[i];
    }
  }
  img.updatePixels();
  
  background(255,102,102);
  image(img,50,50);
}



