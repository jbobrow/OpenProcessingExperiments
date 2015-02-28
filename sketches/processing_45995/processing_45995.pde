
Swirl S;
Swirl [] tile;

void setup()
{
  size(800, 800, P3D);
  S = new Swirl();
    S.setup();
    tile = new Swirl [1];
    for (int i=0; i<tile.length; i++)
    {
      tile[i]=new Swirl();
     tile[i].setup();
    }
}

void draw()
{
 background(255, 255, 255);

     for (int i=0; i<tile.length; i++)
    {
      tile[i].draw();
    }

}




