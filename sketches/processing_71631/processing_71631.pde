
int letra=65, t=5;
 
void setup()
{
  size(1300,600);
  background(0);
  frameRate(4);
   
   
}
 
void draw()
{
 
  PFont tipo_letra1;
   
  tipo_letra1=createFont("Cambria",1);
  PFont tipo_letra2;
   
  tipo_letra2=createFont("Bodoni MT",1);
  
fill(random(0,255),random(0,255),random(0,255));
  if(letra <=90)
  
  {
   textFont(tipo_letra1,80);  
   t+=45;
   text(char(letra++),t,60);
  }
  else if(letra==91)
  {
    letra=97;
    t=6;
  }
 else if(letra<=122)
 {
   textFont(tipo_letra2,40);  
   t+=45;
   text(char(letra++),t,100);
    
 }
   
}

