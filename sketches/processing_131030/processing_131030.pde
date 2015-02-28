
PImage Chicken1;
PImage Chicken2;
PImage Chicken3;
PImage Egg;

int posY = 200;
int posX = 200;

int posY1 = 200;
int posX1 = 200;


void setup()
{
  Chicken1 = loadImage("Chicken1.png");
  Chicken2 = loadImage("Chicken2.png");
  Chicken3 = loadImage("Chicken3.png");
  Egg = loadImage("Egg.png");

  size(400, 400);
  background(255);

}

void draw()
{
  image(Chicken1, posX, posY);  
  
  if(mousePressed)
  {
  
  image(Chicken2, posX, posY+13);
  }
}


void keyPressed()
{
  if (keyCode == LEFT)
  {
  
    posX-=10;
  }
  
  if (keyCode == RIGHT)
  {
    background(255);
   posX+=10;
  } 
 
}


void mouseReleased()
{
 
  image(Egg, posX+150, posY+150);
}


