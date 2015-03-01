
PImage img1;
PImage img2;
PImage resultImg;


void setup() {
  img1=loadImage("difference_puzzle_one.png");
  img2=loadImage("difference_puzzle_two.png");
  size (img1.width*3, img2.height);
  background(128);

  //noLoop();

  //load the image into a variable

  resultImg = createImage (img1.width, img1.height, RGB);
}

void draw() {
  background(128);

  //put something interesting in resultImg
  for (int i=0; i<resultImg.pixels.length; i++) {
    //resultImg.pixels[i] = img.pixels[resultImg.pixels.length-1 -i];
    //resultImg.pixels[i] = color(255,255,255) - img.pixels[i];
    //resultImg.pixels[i] = color (255, 255, 255) + color(0, 0, 1);
    //float origRed = red(img.pixels[i]);
   // float origGreen = green(img.pixels[i]);
    //float origBlue = blue(img.pixels[i]);
   // float newRedGreen = (origRed+origGreen)/2;
   // resultImg.pixels[i] = color (newRedGreen,(newRedGreen),(origBlue));
    
    //compute the diff between two images
    
    float newRed = abs (red(img1.pixels[i]
    
    resultImg.pixels[i] = img1.pixels[i] - img2.pixels[i];
    
  }
  resultImg.updatePixels();

  //draw the image
  image(img1, 0, 0);
  image(img2, img1.width, 0);
  image(resultImg, img1.width+img2.width, 0);
}

