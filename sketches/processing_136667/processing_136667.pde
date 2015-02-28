
PImage theImage;

void setup() {
  size(640, 427);
  theImage = loadImage("lotus.jpg");
  background(0);
}

//This draw() performs the task with the image.get() command
void draw() {
  float randW = random(width);
  float randH = random(height);
  color theColor = theImage.get((int)randW, (int)randH);
  noStroke();
  fill(theColor, 40);
  ellipse(randW, randH, 10, 10);

}


/*  Code below to do the same thing with pixels[] array
 void draw(){
 theImage.loadPixels();
 int totalPix = width * height;
 int thePixel = (int) random(totalPix);
 color pixelColor = theImage.pixels[thePixel];
 noStroke();
 fill(pixelColor, 40);
 ellipse(thePixel%width, thePixel/width, random(20), random(20));
 }
 
 */


