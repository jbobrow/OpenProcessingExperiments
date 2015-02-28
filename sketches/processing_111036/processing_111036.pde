

PImage tigerImage;

void setup()
{
  size(400, 400);
  frameRate(12);
  tint(255, 125);
  tigerImage = requestImage("Tiger.jpg");
}

void draw()
{
  fill(random(0, 100), random(0, 100), random(0, 100));
  triangle(width, height, width, height*.9, width*.6, height);
  fill(random(0, 100), random(0, 100), random(0, 100));
  triangle(width, height*.9, width*.68, height*.72, width*.6, height);
  fill(random(0, 100), random(0, 100), random(0, 100));
  rect(0, height*.67, width*.2, height*.35);
  fill(random(0, 100), random(0, 100), random(0, 100));
  triangle(width*.68, height*.72, width*.6, height, width*.5, height*.85);
  fill(random(0, 100), random(0, 100), random(0, 100));
  triangle(width*.6, height, width*.5, height*.85, width*.4, height);
  
  
  
  if (tigerImage.width > 0)
  {
    image(tigerImage, 0, 0, width, height);
  }
  
}

  


