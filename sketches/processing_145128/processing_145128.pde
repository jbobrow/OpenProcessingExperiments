
Circulo [] arrayCirculos;
int cantCirculos;

void setup()
{
  size(600, 600);
  background(255);
  //noStroke();
  
  cantCirculos = 5;
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
  for (int i=cantCirculos-1; i >= 0; i--)
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
  
  if (!noAgarrarMas)
  {
    int next;
    for (int i=0; i < cantCirculos; i++)
    {
      next = i + 1;
      if (next == cantCirculos)
      {
        next = 0;
      }
      arrayCirculos[i].determinarNuevaPos(arrayCirculos[next].x, arrayCirculos[next].y);
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

void keyPressed()
{
  if (key == ' ')
  {
    for (int i=0; i < cantCirculos; i++)
    {
      arrayCirculos[i].sortearPos();
    }
  }
}
class Circulo
{
  float x, y;
  float dx,dy;
  float nx, ny;
  float velToNewPos;
  float angleToNewPos;
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
    colorActual = color(random(255), random(255), random(255));
    borde = 1;
    sortearPos();
  }
  
  void sortearPos()
  {
    x = random(0, width);
    y = random(0, height);
    nx = x;
    ny = y;
  }
  
  void actualizar()
  {
    if (agarrado)
    {
      x = mouseX - dx;
      y = mouseY - dy;
      nx = x;
      ny = y;
    }
    else
    {
      if (x != nx || y != ny)
      {
        x += velToNewPos * cos(angleToNewPos);
        y += velToNewPos * sin(angleToNewPos);
        
        if (dist(x, y, nx, ny) <= velToNewPos)
        {
          x = nx;
          y = ny;
        }
      }
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
      dx = mouseX - x;
      dy = mouseY - y;
    }
  }

  void soltar()
  {
    agarrado = false;
    borde = 1;
  }
  
  void determinarNuevaPos(float _x, float _y)
  {
    nx = _x;
    ny = _y;
    velToNewPos = dist(x, y, nx, ny) / 90;
    angleToNewPos = atan2( ny - y, nx - x);
  }
}


