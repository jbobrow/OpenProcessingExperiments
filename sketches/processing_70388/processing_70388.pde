
//Justin L., Pink Alien Ray CP1 Mods 16/17

int poop = 100;
int poopoo = 10;
int poo = 10;
void setup()
{
  size(600, 600);
  background(255, 60, 142);
  noFill();
  stroke(23,32,133);
  strokeWeight(5);
  smooth();
  frameRate(5);
}
void draw()
{
  ellipse(300, poop, poopoo, 30); 
  poop = poop + 20;
  poopoo = poopoo + 20;
  poo = poo + 20;
  if(poop > 600)
  {
    poop = 100;
    background(255,60,142);
    poopoo = 10;
  }
}
