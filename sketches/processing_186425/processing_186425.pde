
/*******************************************************************/
/* SIMULACIÓN 2014/2015                                            */
/*                                                                 */
/* Oscar García Martínez                                           */
/*                                                                 */
/*                                                                 */
/* Ejercicio Vectores: Hacer un ’buble-shooter’ sencillo (sólo     */
/* lanzador de bolas)                                              */
/*                                                                 */
/*******************************************************************/

//Declaración de variables e inicialización de las mismas

PVector mouse;
PVector posLanzador;
PVector bola = new PVector(0.0, 0.0);
boolean lanzo = false;
float dv = 0.1;

void setup()
{
  size(500,500);  
  stroke(255);
  smooth();
  frameRate(30);   
}

void draw()
{    
  background(0);

  mouse = new PVector(mouseX, mouseY);         //recogemos las coordenadas del ratón
  posLanzador = new PVector (width/2,height);  //recogemos las coordenadas de situación del Lanzador
  mouse.sub(posLanzador);                      //restamos coordenadas para saber la dirección
  mouse.normalize();                           //normalizamos el vector resultante  
  mouse.mult(100);                             //alargamos el vector normalizado
  
  translate(posLanzador.x,posLanzador.y);      //trasladamos el vector al sitio deseado
  strokeWeight(3);  
  line(0,0, mouse.x, mouse.y);                 //creamos el Lanzador
  
  //si hacemos clik al mouse, la bola se lanzará en la dirección del vector
  if( mousePressed){
    lanzo = true;
  }    
  if (lanzo){
    bola.x=mouse.x*dv;
    bola.y=mouse.y*dv;    
    dv +=0.1;  
  
    //si la bola sobrepasa las dimensiones de la pantalla se reinicializan 
    //las variables para volver a lanzar una bola nueva
    
    if(bola.x>width || bola.y < -height){
    lanzo = false;
    }
  }else{
    dv = 0.1;
    bola.x =0.0;
    bola.y = 0.0;  
  }
  ellipse(bola.x, bola.y ,16,16);
  
}





