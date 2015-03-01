
/*******************************************************************/
/* SIMULACIÓN 2014/2015                                            */
/*                                                                 */
/* Oscar García Martínez                                           */
/*                                                                 */
/*                                                                 */
/* Ejercicio Movimiento Circular Uniforme: Simular el movimiento   */
/* de una bola alrededor de un punto situado a una distancia r de  */
/* la bola. Dará una vuelta por segundo.                           */
/*                                                                 */
/*******************************************************************/

//Declaración de variables e inicialización de las mismas

float cx = 250;
float cy = 250;
float t = 0.0;
float r = 150;
float T = 1000.0; //período en milisegundos
float f = 1/T;      //frecuencia
float w = -2*PI*f;  //velocidad angular


void setup() {
  size(500, 500);
}

void draw() { 
  background(0);
  t = millis();   //nos devuelve el tiempo en milisegundos 

  //dibujamos los ejes
  stroke(255);
  line(width/2,0,width/2,height);   //eje vertical
  line(0,height/2,width,height/2);  //eje horizontal
  fill(255);

  //aplicamos las fórmulas del movimiento circular uniforme
  //para calcular la posición x e y  
  pushMatrix();
  translate(r*cos(w*t), -r*sin(w*t)); 
  fill(255);
  ellipse(width/2, height/2, 20, 20);  
  popMatrix();  
 
  text(" t: "+t/1000,40,20);  
}





