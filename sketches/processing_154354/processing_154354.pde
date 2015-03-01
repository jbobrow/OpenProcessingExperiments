
//Amy Zhou, Andrew ID: amyzhou
//Copyright Notice

float wrappingx;
float wrappingdx;
float wrappingy;
float wrappingdy;
float wd;
float ht;
PImage movingImg;

void setup()
{
  size(800, 800); 
  imageMode(CENTER);
  wd = width * .5;
  ht = height * .5;
  wrappingx = random(.5 * wd, width - .5 * wd); 
  wrappingy = random(.5 * ht, height - .5 * ht);
  wrappingdx = random(2, 6);
  wrappingdy = random(2, 6);
  movingImg = loadImage("Chericol.jpg");
}

void draw()
{
  background(0);
  image(movingImg, wrappingx, wrappingy, wd, ht);
  
  if (wrappingx >= width + .5 * wd)
  {
    wrappingx = -.5 * wd;
  } 
  else 
  {
    wrappingx +=wrappingdx;
  }
  
  if (wrappingy >= height + .5 * ht)
  {
    wrappingy = -.5 * ht;
  }
  else
  {
    wrappingy +=wrappingdy;
  }
    
}


