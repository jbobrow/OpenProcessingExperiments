
/**
 * Background Image. 
 * 
 * This example presents the fastest way to load a background image
 * into Processing. To load an image as the background, it must be
 * the same width and height as the program.
 */
 
PImage bg, hammerImage, elSavior;
int a; 

void setup() 
{
  size(800,600);
  frameRate(30);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "milan_rubbish.jpg"
  // is 200 x 200 pixels.
  bg = loadImage("background.jpg");
  hammerImage = loadImage("Hammer4.png");
  elSavior = loadImage("Jerusalem-Scopus.jpg");
}

void draw() 
{
  background(bg);
  image(hammerImage, mouseX-40, mouseY-40);

 
}

