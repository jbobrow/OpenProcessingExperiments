
 
//Creamos vector de posiciÃ³n, y lo inicializamos
PVector sec = new PVector(0,0);
//tamaÃ±o para la bola
int sz = 20;
//valor del Ã¡ngulo, que iniciamos a 0
float angSec = 0;
//radio donde dibujaremos la bola (en FM!)
float radSec = 150;

void setup(){
  size(400,400);

}

void draw(){
 // background(0);
  
 
  /*convertimos las coordenadas de polares a cartesianas
  es decir, lo que calculamos en base a radio y Ã¡ngulo, lo pasamos
  a las conocidas coordenadas de X e Y para el dibujo
  y lo hacemos respecto a witdth/2 y height/2*/
  sec.x = width/2 + (radius * sin(angle));
  sec.y = height/2 + (radius * cos(angle));
 


   //Dibujamos SEGUNDOS
  fill(255);
  ellipse(sec.x,sec.y,sz,sz); 
 
}
 


