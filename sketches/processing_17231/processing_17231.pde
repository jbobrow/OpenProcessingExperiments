
void drawImages() {
  PImage image0 = loadImage(imageURLs[0]);
  PImage image1 = loadImage(imageURLs[1]);
  PImage image2 = loadImage(imageURLs[2]);
  PImage image3 = loadImage(imageURLs[3]);

  blend(image0, 0, 0, width, height, 0, 0, width, height, MULTIPLY);
  blend(image1, 0, 0, width, height, 0, 0, width, height, SCREEN);
  blend(image2, 0, 0, width, height, 0, 0, width, height, SCREEN);
  blend(image3, 0, 0, width, height, 0, 0, width, height, SCREEN);
}

