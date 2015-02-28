
//Declaração da espessura
int espessura;

//Declaração de váriaveis
float noiseX=0.0;
float noiseY=0.0;
int contador = 0;
int r = 0;
int g = 0;
int b = 0;

void setup ()
{
  //Tamanho e espessura inicial
  size (800,500);
  espessura=1;
}
void draw()
{
  noiseX = noiseX + .01;
  noiseY = noiseY + .01;
  strokeWeight (espessura);
  float n = noise(noiseX) * width;
  float m = noise(noiseY) * height;
  if (mousePressed)
  {
    stroke(r*random(-1.2, 1.2), g*random(-1.2, 1.2), b*random(-1.2, 1.2));
    line (mouseX, mouseY, n, m);
  }
}

void keyPressed ()
{
  if (key == '.')
  {
    espessura++;
  }
  else if (key == ',' && espessura > 1)
  {
  espessura--;
  }
 else if (key == '1')
  {
  r = 255;
  g = 0;
  b = 0;
  }
 else if (key == '2')
  {
  r = 0;
  g = 255;
  b = 0;
  }
 else if (key == '3')
  {
  r = 0;
  g = 0;
  b = 255;
  }
 else if (key == '0')
  {
  r = 0;
  g = 0;
  b = 0;
  }
 else if (key == '9')
  {
  r = 255;
  g = 255;
  b = 255;
  }
 else if (key == 's')
  {
    save("Random" + contador + ".gif");
    contador++;
  }
}
