
Circulo [] arrayCirculos;
int cantCirculos;

void setup()
{
  size(600, 600);
  background(255);
  //noStroke();
  
  cantCirculos = 40;
  arrayCirculos = new Circulo[cantCirculos];
  
  for (int i=0; i < cantCirculos; i++)
  {
    arrayCirculos[i] = new Circulo();
    arrayCirculos[i].inicializar();
  }
}

void draw()
{
  background(255);
  
  for (int i=0; i < cantCirculos; i++)
  {
    arrayCirculos[i].actualizar();
    arrayCirculos[i].dibujar();
  }
}

void mousePressed()
{
  boolean noAgarrarMas = false;
  for (int i=cantCirculos-1; i > 0; i--)
  {
    if (!noAgarrarMas)
    {
      arrayCirculos[i].agarrar();
      if (arrayCirculos[i].agarrado)
      {
        noAgarrarMas = true;
      }
    }
  }
}

void mouseReleased()
{
  for (int i=0; i < cantCirculos; i++)
  {
    arrayCirculos[i].soltar();
  }
}
class Circulo
{
  float x, y;
  float size;
  color colorActual;
  boolean agarrado;
  int borde;
  
  Circulo()
  {
    
  }
  
  void inicializar()
  {
    size = random(50, 100);
    x = random(0, width);
    y = random(0, height);
    colorActual = color(random(255), random(255), random(255));
    borde = 1;
  }
  
  void actualizar()
  {
    if (agarrado)
    {
      x = mouseX;
      y = mouseY;
    }
  }
  
  void dibujar()
  {
    strokeWeight(borde);
    fill(colorActual, 150);
    ellipse(x, y , size, size);
  }
  
  void agarrar()
  {
    if( dist( mouseX, mouseY, x, y ) < size / 2 )
    {
      agarrado = true;
      borde = 4;
    }
  }

  void soltar()
  {
    agarrado = false;
    borde = 1;
  }
}


