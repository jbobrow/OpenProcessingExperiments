
PImage img;
PImage img2;

void setup() {

  size(1000, 1000);
  img = loadImage ("Dapic.JPG");
  img2 = loadImage ("ALIEN.png");
}

void draw() {

  background(0);
  image(img, 0, 0);
  image(img2, 750, 150);
  img.filter(GRAY);
  img2.filter(GRAY);

 for (int y = 0; y < height; y += 5)
  {
   
    line(0, y, width, y );
  }

}


