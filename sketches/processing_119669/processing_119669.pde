
//MODE DE PROGRAMACIO DINAMIC

float x=0; //declarant la variable a fora de la funció, em doto de memoria
float y=0;

void setup()
{
  //AQUI LA INFORMACIO QUE REPETEIXO UN SOL COP
  size(600,600);
  fill(0);
}

void draw()
{
  //AQUI LA INFORMACIO QUE VULL REPETIR CADA COP QUE PINTO LA PANTALLA  
  fill(255, 10);
  rect(0,0,width, height);
  fill(0);
  x=x+5;
  y=300;
  ellipse(x,y,20,20);
}
