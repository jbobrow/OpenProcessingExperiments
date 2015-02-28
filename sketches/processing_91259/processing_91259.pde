
class Meteorito
{
  float posx, posy, diametro, velocidad;
  PImage meteoro;

  Meteorito()
  {
    posx = random(width);
    posy = random(-500, 100);
    diametro = random(15, 25);
    velocidad = random(0.3, 0.9);
    meteoro = loadImage("meteoro.png");
  }

  void dibujame ()
  {
    
    image(meteoro, posx, posy, diametro, diametro);
  }

  void flotar ()
  {
    posy = posy + velocidad;

    if (posy > height+10 )
    {
      posy = -10;
      posx = random(width);
      velocidad = random(0.5, 3);
    }
  }
  
   float _x()
  {
    return posx;
  }
  
   float _y()
  {
    return posy;
  }
}


