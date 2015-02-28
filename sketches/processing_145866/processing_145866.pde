
/*
 * Taller Programación MDI Veritas
 * Tarea #2
 * Crear un diseño o dibujo que utilice los números de Fibonacci. 
 * Pueden utilizar cualquiera de los dos ejemplos de base. EL 
 * primero simplemente muestra como se calculan los números de 
 * Fibonacci, el segundo juega con ellos.
 *
 */
  
/**
 * main program file
 *
 * @author Eric Marin
 * @date 25/4/14
 * @version 1.0
 */

//variable
int fib = 1;
int fibAnt = 1;
int fibTemp;
int fill = 15;
float ang, angInc;
 
void setup() {
  size(960, 620);
  //set background to black
  background(0);
  smooth();
  //int num = fib;
  //base color
  fill(255, 255);
}
 
void draw() {
  //control point
  if(fib<100000){
    //set stroke color to white and alpha 50
    stroke(255, 50);
  
    angInc = TWO_PI/fib;
    ang=0;
  
    for(int i = 0; i < fib; i++){
      pushMatrix();
      translate(fib*sin(ang), fib*cos(ang));
      rotate(ang);
      
      //color changes
      if(fib > 10000 && fib < 30000){
        stroke(255, 0, 0, 50);
      }
      if(fib > 50000){
        stroke(0, 0, 0, 255);
      }
      
      triangle(5, 5, 10, 10, i, i);
      popMatrix();
      ang+=angInc;
    }
  
    //fibonnaci numbers
    fibTemp = fib;
    fib+=fibAnt;
    fibAnt=fibTemp;
  }
}

