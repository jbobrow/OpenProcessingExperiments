
PImage img;
PImage img2;
PImage img3;

void setup()
{
  size(800,600);
  img = loadImage("Sitz.JPG");
  img2 = loadImage("Franz.PNG");
  img3 = loadImage("you.png");
}

void draw()
{
  background(0);
  imageMode(CORNER);
  image(img,0,0);
  noTint();
  

 
  image(img2,mouseX,0,800,600);
  noTint();
  if(mousePressed == true)
  {
    imageMode(CORNER);
    image(img3,0,0,800,600);
    noTint();
  }
    else
    {
    noTint();
  }
}


