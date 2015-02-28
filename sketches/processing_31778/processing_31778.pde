
float[][] kernel = { { -1,-1, -1, -1,-1 },
                     { -1,-1, -1, -1,-1 },
                     { -1,-1, 19, -1,-1 },
                     { 1, 1, -1,-1,-1 },
                     { 1, -1, -1,-1,-1 } };

size(542, 332);
PImage img = loadImage("ul1616560-5.jpg");
image(img, 0, 0);
img.loadPixels();
PImage treeImg = createImage(img.width, img.height, RGB);
for (int y = 10; y < img.height - 10; y++){
  for (int x = 10; x < img.width - 10; x++) {
    float sum = 0;
    for (int ky = -2; ky <= 2; ky++) {
      for (int kx = -2; kx <= 2; kx++) {
        int pos = (y + ky)*img.width + (x + kx);
        float val = green(img.pixels[pos]);
        sum += kernel[ky+2][kx+2] * val;
      }
    }
      treeImg.pixels[y*img.width + x] = color(sum);
  }
}
treeImg.updatePixels();
image(treeImg, 0, 167);


