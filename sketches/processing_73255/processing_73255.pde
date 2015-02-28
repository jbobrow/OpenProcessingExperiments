
float incremento1 = 0.02;
float incremento2 = 0.01;

void setup()  

{
  size(400, 500);
  noFill();
  smooth();
  background(255);  
}

void draw()  

{

  frameRate(15);
  
//Rojo

fill(255,0, 0);
arc(200, 200, 300, 300, 0+incremento1, 0.16+incremento1);
incremento1+=0.02;


//Verde

fill(0, 255, 0);
arc(100, 400, 50, 50, 0+incremento1, 0.16+incremento1);
incremento1+=0.02;

//Azul

fill(0, 0, 255);
arc(300, 400, 50, 50, 0+incremento1, 0.16+incremento1);
incremento1+=0.02;

}



