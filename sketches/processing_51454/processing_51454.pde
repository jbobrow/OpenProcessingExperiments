
PImage img1, img2;
int THRESHOLD = 60;

void setup() {
  size(320, 213);
  img1 = loadImage("getty.jpg");
  img2 = loadImage("owen.jpg");
}

void draw() {
  background(150);
  img1.loadPixels();
  PImage screenImg = createImage(320, 213, RGB);
  int mousePixel = mouseY*screenImg.width+mouseX;
  
  
  color mouseColor = img1.pixels[mousePixel];
  float mRed = red(mouseColor);
  float mGreen = green(mouseColor);
  float mBlue = blue(mouseColor);

  for (int i = 0; i < img1.pixels.length; i++) {
    color pixelColor = img1.pixels[i];
    float r = red(pixelColor);
    float g = green(pixelColor);
    float b = blue(pixelColor);
    
    float colorDifference = abs(mRed - r) + abs(mGreen - g) + abs(mBlue - b);
    
    if (colorDifference < THRESHOLD) {    
      screenImg.pixels[i] = img2.pixels[i];
    }else{
      screenImg.pixels[i] = img1.pixels[i];
    }
  }
  screenImg.updatePixels();
  image(screenImg, 0, 0);
}


