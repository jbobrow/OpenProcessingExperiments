
PImage originalImage, rotatedImage;

void setup() {
  originalImage = loadImage("qmary.jpg");
  rotatedImage = new PImage(originalImage.width, originalImage.height);
  size(originalImage.width, originalImage.height);
  smooth();
  rotateImageAndUpdatePixels(20);
}

void draw() {
  float mx = mouseX-width/2;
  rotateImageAndUpdatePixels(mx);
  image(rotatedImage, 0, 0);
}


void rotateImageAndUpdatePixels(float mx) {
  originalImage.loadPixels();
  rotatedImage.loadPixels();
  for (int x = 0; x < originalImage.width; x++ ) {
    for (int y = 0; y < originalImage.height; y++ ) {
      float distFromCenter = dist(width/2, height/2, x, y);
      float currentAngle = atan2(y - height/2, x - width/2);

      float newAngle = currentAngle ;

      int distIncrementor = 0; 
      while (distIncrementor < distFromCenter) {
        newAngle-= mx/width;
        distIncrementor += 20;
      }

      float nx = cos(newAngle) * distFromCenter + width/2;
      float ny = sin(newAngle) * distFromCenter + height/2;
      //nx = floor(nx);
      ny = floor(ny);
      // check that the new, rotated coordinates are still onscreen
      if (nx > 0 && nx < width && ny > 0 && ny < height) {
        int loc = x + y*originalImage.width;
        int newLoc =  int(nx + ny*originalImage.width);
        rotatedImage.pixels[loc] = originalImage.pixels[newLoc];
      }
    }
  }
    rotatedImage.updatePixels();

}


