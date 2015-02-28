
//MODE DE PROGRAMACIO DINAMIC

float x1=0;
float x2=0; //declarant la variable a fora de la funció, em doto de memoria
float y1=0;
float y2=0;


void setup()
{
  //AQUI LA INFORMACIO QUE REPETEIXO UN SOL COP
  size(600,600);

  fill(0);
}

void draw()
{
  //AQUI LA INFORMACIO QUE VULL REPETIR CADA COP QUE PINTO LA PANTALLA  
  background(255);
  //comportament de la primera bola
  x1=x1+5;
  y1=300;
  ellipse(x1,y1,20,20);
  //comportament de la segona bola
  x2=300;
  y2=y2+5;
  ellipse(x2,y2,20,20);
  
 
  
}
