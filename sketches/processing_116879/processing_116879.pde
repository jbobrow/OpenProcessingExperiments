
/*Aidan Ferrer, Computer Programming A, 7th Block
Sorry about the delay, the computers refused to load.
Bask in the glory of Goomy.*/

int times=1;
int limit=1;
PImage g;
void setup()
{
  size(400, 400);
  frameRate(1);
  g = loadImage("Goomy.jpg");
}
void draw()
{
  while (times<=limit)
  {
    image(g,random(0, 401), random(0, 401), 30, 30);
    times++;
  }
  limit=limit*2;
}



