
boolean fin = true;
int a,b;
//El setup es donde se configura la pantalla en general
void setup()
{
  noFill();    //Sin relleno para las figuras
  smooth();    //Refina el dibujo
  background(255);  //Fondo
  size(520,350);    //Tamaño
  strokeWeight(5);  //Ancho de las lineas
}
void draw()
{
  background(255);
  //Azul
  stroke(0,0,255);
  ellipse(50,50,100,100);
  //Negro
  stroke(0,0,0);
  ellipse(160,50,100,100);
  //Verde
  stroke(0,255,0);
  ellipse(210,100,100,100);
  //Amarillo
  stroke(255,255,0);
  ellipse(100,100,100,100);  //EL PRIMER PUNTO ES DEL CENTRO
  //Rojo
  stroke(255,0,0);
  
  if(fin)
  {
  a =(int)random(50,300);
  b =(int)random(50,470);
  if(b>265 && b<275)
    fin = false;
  }
  else
  {
    a = 50;
    b= 270;
  }
  ellipse(b,a,100,100);
}


