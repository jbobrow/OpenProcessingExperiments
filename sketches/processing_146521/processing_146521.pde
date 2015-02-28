
//Tarea Fibonacci
//Profesor: Tomas de Camino
//Mariana Mora con la coordinacion directa de Paula Chavarria

//se da caracteristicas al background
void setup(){
  background (127,0,0);
  size(400,400);
  noFill();
  
 //se crean ellipses, tamano y ubicacion  
  for(int i=3; i<30;i++){
  float nuevotamano = fib(i)*20;
  ellipseMode(CORNER);
  ellipse(0,0,nuevotamano,nuevotamano);
  //ellipse (60,40,16,16);
}
  
}

/**
 * Method which calculates the fibonnacci of a given number
 * @param n The number whose fibonnacci will be computed
 */
float fib(int n) {
  if (n <= 1) return n;
  else return fib(n-1) + fib(n-2);
}
 

