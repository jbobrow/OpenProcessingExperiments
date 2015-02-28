
// @pjs preload must be used to preload the image
/* @pjs preload="pic.jpg"; "Snowflake_Background.png"; "Sparkle.png" "sparkles.png"; */
PImage photo;
PImage photo2;
PImage sparkle;
PImage sparkling;
int pointillize = 45;

void setup()
{
  size(400, 400);
  photo = loadImage("pic.jpg");
  photo2 = loadImage("Snowflake_Background.png");
  sparkle = loadImage("Sparkle.png");
  sparkling = loadImage("sparkles.png");
}

void draw()
{
  //check the size of your image to know if it has loaded
  //with requestImage()
  if (photo.width > 0)
  {
    
    image(photo, 0, 0, width, height);
    filter(ERODE);
    //photo2.filter(GRAY);
    image(photo2, 0, 0, width, height);
    
    for (int x = 0; x < width; x += 40)
    {
      image(sparkle, x, 0, 40, 40);
      image(sparkle, x, 360, 40, 40);
    }
    
    for (int y = 35; y < height; y += 40)
    {
      image(sparkle, 0, y, 40, 40);
      image(sparkle, 360, y, 40, 40);
    }
    
    // Pick a random point
    int x = int(random(photo.width));
    int y = int(random(photo.height));
    int place = x + y*photo.width;
    
    // Look up the RGB color in the source image
    loadPixels();
    float r = red(photo.pixels[place]);
    float g = green(photo.pixels[place]);
    float b = blue(photo.pixels[place]);
    noStroke();
    
    // Draw an ellipse at that location with that color
    fill(r,g,b,100);
    ellipse(x,y,pointillize,pointillize);
    
    image(sparkling, 50, 50, width, height);
  }
}


