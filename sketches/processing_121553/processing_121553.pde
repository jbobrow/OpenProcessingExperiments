
float x, y;
int i;
boolean HeDeDibuixar=true;
int colorLinea=0;
void setup()
{
  size(800,600);  
  background(255);
}


void draw()
{
  if (HeDeDibuixar)
  {
    line(x,y, mouseX, mouseY);
    x=mouseX;
    y=mouseY; 
  }

}

void mousePressed()
{
    if (HeDeDibuixar==true)
      HeDeDibuixar=false;
    else
      HeDeDibuixar=true;
}

