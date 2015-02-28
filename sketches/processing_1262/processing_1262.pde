
/*
Nombre: Payaso 02
 Segunda versión del sketch payaso que utiliza las oscilaciones 
 de los valores del seno  y el concepto de PopMatrix y PUpMatrix de apilar y desapilar 
 Fecha: Marzo 2009, Barcelona.
 Autor: Alba G. Corral.
 Licencia: open source.
 */

float velocidad = 0.05;//incremento de angulo
float dim;//diametro  
float RESISTENCIA ;
float NUM_TALLOS = 5;
int longitud ;
float inc= 0.4;
void setup() {
  size(800, 800);//tam. del sketch
  dim = width/4;//diametro
  longitud=width/2;//diametro
  RESISTENCIA = width/50;
  smooth();//suavizado
   background(255);//pintamos de negro el fondo
}
void draw() {
 //background(255);//pintamos de negro el fondo
  translate(width/2,height/2);//trasladamos las coordenadas a la mitad de la pantalla
 inc += velocidad;//incrementamos el valor del radio
  float angle = sin(inc) / RESISTENCIA;//calculamos el angulo
 //dibuja una ellipse con ancho > dim y alto > dim. en la posicion de coordenadas 0,0

  for (int i = 0; i < NUM_TALLOS; i++) {//loop que va desde 0 hasta 8, aumentando uno
    //llamamos a la funcion tallo con los parametros de entrada
    //float x> posicion horizontal,float y> posicion vertical, int longitud, float angle>angulo
    tallo(0,-dim/2, longitud, angle);
    rotate(TWO_PI/NUM_TALLOS);//vamos rotando 
  
  }
 ellipse(0,0,angle,angle);
 //if (velocidad > 10) inc = inc * -1;;
println("velocidad" +velocidad+" angle:"+ angle); 
 

}
void tallo(float x,float y, int longitud, float angle) {
  pushMatrix();
  translate(x, y);
  for (int i = longitud; i > 0; i--) {
strokeWeight(i/150);
    stroke(0,10);//seleccionamos el color del borde > 255, blanco
   line(0, 0, 0, -4);//dibujamos una linea con punto inicial (0,0) y punto final(0-4)
    strokeWeight(i/100);//Ancho del borde
    stroke(255,0,0,2);
  line(0,0,-10,0);//dibujamos una linea con punto inicial (0,0) y punto final(4-0)
 
    translate(0, -4);
   rotate(angle);
  }
  popMatrix();
}



