
int tileSize=16;
color pixelColor;
 
PImage sourceImage;
 
void setup() {
  size(1024,683);
  //load image
  sourceImage=loadImage("leaves2.jpg");
  image(sourceImage,0,0);
}
 
void draw() {
  if (mousePressed) {
    if (mouseButton == CENTER) { // show original image
      image(sourceImage,0,0,width,height);     
    }
    if (mouseButton == LEFT) {
      //repeat a single tile over the entire screen
      for (int i = 0; i < width; i += 48) {
        for (int j = 0; j < height; j += 48) {
          image(makeTile(sourceImage.get(mouseX,mouseY,48,48)),i,j);
        }
      }
    }
    if (mouseButton == RIGHT) {
      //places the tile right underneath its origin
      for (int i = 0; i < width; i += tileSize) {
        for (int j = 0; j < height; j += tileSize) {
          image(makeTile(sourceImage.get(i,j,tileSize,tileSize)),i,j);
        }
      }
    }
  }
}

PImage makeTile(PImage outputImage) {
  for (int i=0; i<=outputImage.width/2; i++) {
    for (int j=0; j<=outputImage.height/2; j++) {
      pixelColor = outputImage.get(i,j);
      outputImage.set(i,j,pixelColor);
      outputImage.set(outputImage.width-i,j,pixelColor);
      outputImage.set(i,outputImage.height-j,pixelColor);
      outputImage.set(outputImage.width-i,outputImage.height-j,pixelColor);
    }
  }
  return outputImage;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      tileSize += 8;
      for (int i=0; i<width; i+=tileSize) {
      for (int j=0; j<height; j+=tileSize) {
        image(makeTile(sourceImage.get(i,j,tileSize,tileSize)),i,j);
      }
    }
    }
    if (keyCode == DOWN) {
      tileSize -= 8;
      for (int i=0; i<width; i+=tileSize) {
      for (int j=0; j<height; j+=tileSize) {
        image(makeTile(sourceImage.get(i,j,tileSize,tileSize)),i,j);
      }
    }
    }
  }
   if (key == 'r') {
      tileSize = 16;
      for (int i=0; i<width; i+=tileSize) {
      for (int j=0; j<height; j+=tileSize) {
        image(makeTile(sourceImage.get(i,j,tileSize,tileSize)),i,j);
      }
    }
   }
  }
     

