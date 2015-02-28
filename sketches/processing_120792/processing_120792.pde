
float x=0;
float y=0;
float diametre=25;

void setup()
{
size(800,600);
background(255);
}

void draw()
{
background(255);
ellipse(x,y, diametre,diametre);
if (keyPressed) // cuando se aprieta una tecla haz esto
  {
    x=x+4;
    y=y+2; 
  }
}
