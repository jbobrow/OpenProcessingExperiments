
class Bolita {
  float velocidadx;
  float velocidady;
  int tamano;
  color c1;
  float x;
  float y;
  int direccionx = 1; 
  int direcciony  = 1; 

  void mover()
  {  
    x+=velocidadx * direccionx;
    y+=velocidady * direcciony;
    if (x>width||x<0) {
      direccionx= -direccionx;
    }

    if (y>width||y<0)
    {
      direcciony= -direcciony;
    }
  }
  void dibujar ()
  {
    stroke (c1);
    ellipse(x, y, tamano, tamano);
  }

  //constructor
  Bolita (float x, float y, int t, float v1, float v2) {
    this.x=x;
    this.y=y;
    this.velocidadx=v1;     
    this.velocidady=v2;
    this. tamano=t;
  }
}

