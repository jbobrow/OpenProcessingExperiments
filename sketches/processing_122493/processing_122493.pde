
boolean EsticDibuixant=false;
color colorDePintat=color(0);
color colorFons=color(255);

void setup()
{
  size(600,600);
  background(0);
}

void draw()
{
  if (EsticDibuixant==false)
  {
    background(0);
    fill(255);
    text("Hola", 300,300);
  }
  else
  {
    background(colorFons);
   //dibuixar 
  }
}

void keyPressed()
{
   if (key=='k')
   {
      EsticDibuixant=true;
   } 
   if (key=='i')
     EsticDibuixant=false;
}
