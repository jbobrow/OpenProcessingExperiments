

/*******************************************************************/
/* SIMULACIÓN 2014/2015                                            */
/*                                                                 */
/* Oscar García Martínez                                           */
/*                                                                 */
/*                                                                 */
/* Ejercicio Osciladores: Animar el movimiento de una partícula    */
/* a velocidad v sobre las 2 funciones osciladoras.                */
/*                                                                 */
/*******************************************************************/


//Declaración de variables e inicialización de las mismas

float x;
float y;
float y2;
float tiempo = 0.0;
float dt = 0.1;
float zoom = 200.0;

void setup(){  
  size (500,500);  
  frameRate(30);
  fill(0);
}

void draw()
{  
  background(0);  

  //dibujamos los ejes
  pushMatrix();
  stroke(255);
  fill(255,0,0);
  line(width/2,0,width/2,height);   //eje vertical
  line(0,height/2,width,height/2);  //eje horizontal
  popMatrix();
  
  //dibujamos la primera bola(verde) que realizará el movimiento 
  //y=sin(tiempo)*exp(-0.002*tiempo)
  pushMatrix();
  translate(20,250);
  fill(0,255,0);  
  ellipse(x,y,15,15);  
  popMatrix();
  
  //dibujamos la segunda bola(azul) que realizará el movimiento 
  //y2=0.5*sin(3*tiempo) + 0.5*sin(3.5*tiempo)
  pushMatrix();
  translate(80,250); 
  fill(0,0,255);  
  ellipse(x,y2,15,15); 
  popMatrix();
  
  //aplicamos las 2 funciones correspondientes osciladoras
  pushMatrix();  
  y= zoom*(sin(tiempo)*exp(-0.002*tiempo));           //Movimiento de la bola verde
  y2= zoom*(0.5*sin(3*tiempo) + 0.5*sin(3.5*tiempo)); //Movimiento de la bola azul   
  x= tiempo;  
  tiempo += dt;  
  popMatrix();  
}



