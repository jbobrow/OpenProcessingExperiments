
//MODE DE PROGRAMACIO DINAMIC
float hue=200;
float saturacio=100;
float brillo=100;
float diametre=400;
float diametreMax=590;
float diametreMin=110;
float creixement=2;

void setup()
{
  //AQUI LA INFORMACIO QUE REPETEIXO UN SOL COP
  size(600,600);
  colorMode(HSB, 360,100,100);
  noStroke();
}

void draw()
{
  //AQUI LA INFORMACIO QUE VULL REPETIR CADA COP QUE PINTO LA PANTALLA  
  background(360);
  diametre=diametre+creixement; 
  fill(hue,saturacio,brillo);   
  ellipse(300,300,diametre,diametre);
  if (diametre>diametreMax) 
  {
    creixement=-2;  
  }
  if (diametre<diametreMin)
  {
    creixement=2;
    if (hue<0)
    {
      hue=360;
    }
    hue=hue-50;
  }
}
