
PImage img;
PImage resultImg;

void setup() {
  background(90, 0, 0);
  //noLoop();
  //loads image in variable
  img = loadImage("greenscreen.png");
  resultImg = createImage(img.width, img.height, RGB);
  //size last so variables work
  size(img.width*2, img.height);
}

void draw() {
  background(90, 0, 0);
  //resultImg stuff
  for (int i = 0; i < resultImg.width*resultImg.height; i++) {
    //this line copies the image
    //resultImg.pixels[i] = img.pixels[i];
    //rotates 180 degrees
    //resultImg.pixels[i] = img.pixels[resultImg.pixels.length-1 -i];
    //creates a negative image
    //resultImg.pixels[i] = color(255,255,255) - img.pixels[i];
    //simulate red color deficiency
    float curRed = red(img.pixels[i]);
    float curGreen = green(img.pixels[i]);
    float curBlue = blue(img.pixels[i]);
    float newRedGreen = (curRed+curGreen)/2;
    resultImg.pixels[i] = color(newRedGreen, newRedGreen, curBlue);
  }
  resultImg.updatePixels();

  //draws the image on screen
  image(img, 0, 0);
  image(resultImg, img.width, 0);
}

