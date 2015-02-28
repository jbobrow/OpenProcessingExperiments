
//Create a class for each season
Verano verano;
Sierade sierade;
Primavera primavera;
Invierno invierno;

int t,estacion;

void setup()
{
  size(192,157);
  frameRate(30);
  smooth();

  verano = new Verano();
  sierade = new Sierade();
  primavera = new Primavera();
  invierno = new Invierno();

  t = 0;
  estacion = 0;
}

void draw()
{
  background(255);
  switch(estacion)
  {
  case 0:
    primavera.draw();
    break;
  case 1:
    verano.draw();
    break;
  case 2:
    sierade.draw();
    break;
  case 3:
    invierno.draw();
    break;
  }
  t++;
  if(t == 300)
  {
    t = 0;
    estacion++;
    estacion = estacion % 4;
  }
}
// =^.^=

