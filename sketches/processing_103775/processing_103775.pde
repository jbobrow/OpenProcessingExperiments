

private PImage vanImage;
private float splotchSize = 10;
int wipelineY = 0;

// this gets called once at the very start of our program
public void setup() 
{
  // TODO - load in an image and story it in the "originalImage" variable
  vanImage = loadImage("van-gogh-vincent-starry-night.jpg");
  // TODO - set the size of our sketch to match the width/height of our image
  size(vanImage.width, vanImage.height);
  // things will look better with no strokes
  noStroke();
}

// this gets called every frame
public void draw() 
{
for (int i = 0; i < 100; i++)
{
  drawSplotch();
} 
wipelineY++;
}

// draws a circle at a random location that matches the color of the pixel at that same location in our image
public void drawSplotch()
{
  // TODO - pick a random (x, y) position on our image
    int x = (int)random(0,width);
    int y = wipelineY;
  vanImage.get(x, y);
  // TODO - find the color of the pixel at that random position: color pixelColor = originalImage.get(x, y)
 
    color pixelColor = vanImage.get(x, y);
 
  fill(pixelColor);
  float size = random(1,30);
  ellipse(x, y, 10, 10);
}


