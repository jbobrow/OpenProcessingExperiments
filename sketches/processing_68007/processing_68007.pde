
// Armando rocha

float incremento1=0.0;
float incremento2=0.0;
void setup()
{
size(500,500);
smooth();
 background(255);
}
 void draw()
  {
   //rojo
   fill(255,0,0);
    arc(200,200,200,200,0+incremento1,0.1+incremento1);
    incremento1+=0.01;
    //azul
       fill(0,0,255);
    arc(100,400,150,150,0+incremento1,0.1+incremento1);
    incremento1+=0.01;
    //verde
       fill(0,255,0);
    arc(400,400,100,100,0+incremento1,0.1+incremento1);
    incremento1+=0.01;
    
  }
