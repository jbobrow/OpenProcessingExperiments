
/*******************************************************************/
/* SIMULACIÓN 2014/2015                                            */
/*                                                                 */
/* Oscar García Martínez                                           */
/*                                                                 */
/*                                                                 */
/* Implementar una rutina que simule el movimiento de una          */
/* partícula a lo largo de la espiral 2D de la figura. La función  */
/* recibirá el diferencial de tiempo transcurrido desde la llamada */
/* anterior y debe moverse a una velocidad w en vueltas/seg.       */
/* Parámetros: inicio(1, 0), fin(0, 0)                             */
/*                                                                 */
/*******************************************************************/

//Declaración de variables e inicialización de las mismas
float posX= 0.0;
float posY= 0.0;
float v = 0.1;
float t = 0.0;
float radio = 100.0;


void setup()
{
  size(500,500); 
  stroke(255);
  smooth();  
}


void draw()
{
  background(0);  
  fill(255); 
 
  //dibujamos los ejes  
  line(width/2,0,width/2,height);   //eje vertical
  line(0,height/2,width,height/2);  //eje horizontal
  
  //creamos la bola y le aplicamos el movimiento
  pushMatrix();
  translate(width/2, height/2); 
  posX= radio*cos(t);
  posY= radio*sin(t);
  ellipse(posX, posY , 20,20);  
  t += v;
  popMatrix();   
  
  //reducimos el radio hasta que se pare la bola en (0,0)
  if(radio > 0){
    radio -= 0.4;          
  }else{
    radio = 0; 
  }
  text("Radio= "+ radio ,20, 20);
}




