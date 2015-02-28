
//Carlos Cevallos Manzano

//declaració objecte
Meteorito[] a;

//quantitat de meteorits que cauen 
int control = 50;
int fondo = 0;
 
 
void setup()
{
  size(500, 500);
  smooth();
  background(fondo);
   
  a = new Meteorito[control];
   
  for( int i = 0; i < control; i++)
  {
    a[i] = new Meteorito();
    a[i].X = round(random(width - a[i].r));
    a[i].Y = round(random(height - a[i].r));
    a[i].r = random(5, 20);
    a[i].velocidadx = round(random(-2, -4));
    a[i].velocidady = (a[i].velocidadx * -1);
    a[i].colorR = 251;
    a[i].colorG = 255;
    a[i].colorB = 28;
  }
}
 
void draw(){
  fill(fondo, random(0,100));
  rect(0, 0, width, height); 
  noStroke();
   
  for( int i = 0; i < control; i++)
  {
    a[i].mostrar();
    a[i].caida();
  }
}
 
class Meteorito
{
  float X, Y;
  float r;
  int velocidadx, velocidady;
  int colorR, colorG, colorB;

  void mostrar()
  {
    fill(colorR, colorG, colorB);
    ellipse(X, Y, r, r);
  }
 
 
  void caida()
  {
    X += velocidadx;
    Y += velocidady*2;
 
      
     
      if (X - r < 0) X = width + r;
      if (Y + r > height) Y = 0 - r;
     
     
     
  }
}


