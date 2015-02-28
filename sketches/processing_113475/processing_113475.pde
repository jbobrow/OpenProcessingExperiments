
/* @pjs preload="http://www.petfinder.com/wp-content/uploads/2012/11/99059361-choose-cat-litter-632x475.jpg"; */
        
void setup()
{
  size(500,500);
  noLoop();
}

void draw()
{
  background(255);
  PImage im = loadImage("http://www.petfinder.com/wp-content/uploads/2012/11/99059361-choose-cat-litter-632x475.jpg");
  image(im, 0, 0);
}



