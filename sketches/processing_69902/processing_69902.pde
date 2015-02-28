
//YanahuiHernandez Cruz
//Felipe Andres Torres Torres
int letra=65, t=5;

void setup()
{
  size(1500,200);
  background(0);
  frameRate(15);
  
  
}

void draw()
{
 /* PFont tipo_letra1;
  tipo_letra1=loadFont("Batang-48.vlw");
 
  
  PFont tipo_letra2;
  tipo_letra2=loadFont("BaskOldFace-48.vlw");
  */
  //De la primera forma con loadFont y la segunda no lleva la extencion de el tipo de letra
  PFont tipo_letra1;
  
  tipo_letra1=createFont("Batang",1);
  PFont tipo_letra2;
  
  tipo_letra2=createFont("BaskOldFace",1);
  fill(255);
  if(letra <=90)
 
  {
   textFont(tipo_letra1,50);  
   t+=40;
   text(char(letra++),t,60);
  }
  else if(letra==91)
  {
    letra=97;
    t=5;
  }
 else if(letra<122)
 {
   textFont(tipo_letra2,50);  
   t+=40;
   text(char(letra++),t,150);
   
 }
  
}
