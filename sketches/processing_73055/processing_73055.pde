
int letra=65, t=0;

void setup()
{
  size(1250,150);
  background(0);
  frameRate(4);
  }
 
void draw()
{
  PFont tipo_letra1;
  tipo_letra1=createFont("Comic Sans MS",1);
  PFont tipo_letra2;
  tipo_letra2=createFont("Arial",1);
  fill(random(0,255),random(0,255),random(0,255));
  if(letra <=90)
  {
    textFont(tipo_letra1,50);  
    t+=45;
    text(char(letra++),t,50);
    }
  else if(letra==91)
  {
    letra=97;
    t=6;
    }
  else if(letra<=122)
  {
    textFont(tipo_letra2,30);  
    t+=25;
    text(char(letra++),t,100);
    }
   }

