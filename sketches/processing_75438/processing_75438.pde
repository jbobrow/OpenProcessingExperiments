
PImage rainforest;
PImage sadCat;
void setup ()
{
  size(600, 600);
  frameRate(10);
  rainforest = loadImage("http://sammiespagexd.bravesites.com/files/images/rainforest.jpg");
  sadCat = loadImage("http://sammiespagexd.bravesites.com/files/images/sadcat.bmp");
  }
  void draw ()
  {
    image(rainforest, 0, 0, 600, 600);
    smooth();
    int p = 1;
    while (p < 500)
    {
      stroke(78, 127, 203);
      fill(207, 232, 201);
      ellipse(int(random(600)), int(random(600)), 5, 10);
      p++;
    }
    image(sadCat, 225, 400, 250, 250);
  }
