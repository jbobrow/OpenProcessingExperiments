
int x=10;
int y=10;

void setup()
{
  smooth();
  background (59,155,124,50);
  frameRate (30);
  size(250,250);
}

void draw()
{
//noStroke();
  fill(142,59,155);
  for (int j = 0; j<= 10; j++)
    for (int i = 0; i <= 10; i++)
    {
      fill( 45-i, mouseX, j*20,mouseY);
      if (i >= 500)
      {
        i = 0;
        x=20;
      }

      triangle (x+(25*i),y+(25*i),((j+10)+(x*j)),((y+10)+(y*i)),((x+5)+(x*i)),((y+10)+(y*i)));
    }
}



