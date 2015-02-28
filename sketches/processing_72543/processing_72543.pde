
//Alina V, Ticklish Penguin, CP 1 mods 16,17
int x = 400;
int y = 225;
PImage flower;
PImage bee;
PImage beehive;
PImage jar;
void setup()
{
  size(500, 500);
  flower = loadImage("http://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Nelumno_nucifera_open_flower_-_botanic_garden_adelaide2.jpg/800px-Nelumno_nucifera_open_flower_-_botanic_garden_adelaide2.jpg");
  bee = loadImage("http://www.mylatestdistraction.com/mylatestdistraction/wp-content/uploads/2010/01/bumble_bee-300x251.png");
  beehive = loadImage("http://www.auntbeesquiltsandmore.net/images/beehive_with_honey_bees.jpg");
  jar = loadImage("http://www.partystore.com/images/products/1fbg2292.jpg");
}
void draw()
{
  frameRate(20); 
  background(43, 157, 47);
  image(flower, 0, 300, 150, 150);
  image(beehive, 150, 20, 200, 150);
  image(bee, x, y, 75, 75);
  if (x < 120)
  {
    frameRate(30);
    x = x + int(random(6));
    y = y + int(random(-5, 0));
  }
  else
  {
    x = x + int(random(-5, 2));
    y = y + int(random(-3, 4));
  }
   if (x >115 && y < 150)
  {
    background(255, 255, 255);
    image(jar, 100, 100, 300, 300);
  }
}
