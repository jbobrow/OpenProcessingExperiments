
float pixelX;
float pixelY;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(10);
}

void draw()
{
  fill(random(255), random(255), random(255) );
  
  pixelX = random(width);
  pixelY = random(height);
  
  line(0, 0, pixelX, pixelY );
  ellipse(pixelX, pixelY, 40, 40);  
}
