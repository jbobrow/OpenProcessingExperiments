
//puedo utilizar dos variblaes, una para trazar el circulo y otra
  //para el incrementoe caso las declaro globales
  //En est
  float incremento1=0.0;
float incremento2=0.0;
float incremento3=0.0;

void setup()
{ 
  size(700,700);
 fill(255,0,0);
  smooth();
background(0);

}
void draw()
{
// background(255);
 
 //arc(200,200,300,300,0+incremento1,QUARTER_PI+incremento1);
//incremento1+=0.02; 
fill(255,0,0);//para quitare el relleno a la figura
 arc(200,200,300,300,0+incremento1,HALF_PI+incremento1);//HALF_PI+incremento1
incremento1+=0.01; //Aqui en incremento programa la velocidad

fill(0,255,0);//para quitare el relleno a la figura
arc(400,400,50,50,0+incremento2,HALF_PI+incremento2);
incremento2+=0.01; 

fill(0,0,255);//para quitare el relleno a la figurafill(255,0,0);//para quitare el relleno a la figura
arc(100,450,150,150,0+incremento3,HALF_PI+incremento3);
incremento3+=0.01; 



}

