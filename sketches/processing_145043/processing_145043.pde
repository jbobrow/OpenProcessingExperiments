
Circulo [] arrayCirculos;
int cantCirculos;

void setup()
{
  size(600, 600);
  background(255);
  noStroke();
  
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
  for (int i=0; i < cantCirculos; i++)
  {
    arrayCirculos[i].actualizar();
    arrayCirculos[i].dibujar();
  }
}
class Circulo
{
  float x, y;
  float size;
  color colorActual;
  float vel;
  
  Circulo()
  {
    
  }
  
  void inicializar()
  {
    size = random(10, 50);
    x = - size;
    y = random(0, height);
    vel = random(2, 6);
  }
  
  void actualizar()
  {
    size += random(-5, 5);
    if (size < 10) { size = 10;}
    else if (size > 50) { size = 50;}
    
    x += vel;
    if (x > width)
    {
      inicializar();
    }
    
    colorActual = color(random(255), random(255), random(255));
  }
  
  void dibujar()
  {
    fill(colorActual, 150);
    ellipse(x, y , size, size);
  }
}


