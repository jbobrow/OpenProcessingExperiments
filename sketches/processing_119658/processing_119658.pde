
//Prog. dinamica

float diametre=100;
float creixement=7;

void setup()
{
size(600, 600);
colorMode(HSB, 360,100,100);//Hue (0-360 grados), Saturation(0-100), Brightness (0-100)
stroke(1);
}

void draw()
{
  background(360);
  diametre=diametre+creixement;
  ellipse(300,300,diametre,diametre);

  if (diametre>600)
    {
      creixement=-5;
    }

  if (diametre<0)
    {
      creixement=5;
    }
}
