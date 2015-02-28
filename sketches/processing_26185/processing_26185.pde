
int x=10;
int y=10;

void setup()
{
//smooth();
  background (59,155,124,50);
  frameRate (30);
  size(1000,1000);
}

void draw()
{
if (mousePressed == true) {
    noStroke();
  } else {
    
    stroke(0,50);
  }

  fill(142,59,155);
  for (int j = 0; j<= 30; j++)
    for (int i = 0; i <= 100; i++)
    {
      fill( 45-i, mouseX, j*20,mouseY);
      if (i >= 500)
      {
        i = 0;
        x=20;
      }

      triangle (x+(25*i),y+(25*i),(i^2)+(x*7),(x+(j*5))+(y*50),(x+(i^2)+(x*j)),(y+(2*cos(j)))+(y*i)  );
    }
    
    
}



