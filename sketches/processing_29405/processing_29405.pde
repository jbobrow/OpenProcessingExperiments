
int x=0;
int speed=1;


void setup(){
size(200,200);
smooth();
}
void draw(){
  background(255);
  dibujarCirculo();
  modificarX();
  reversaVelocidad();
}
  //Modificamos x con la velocidad
 void modificarX (){
  x = x+speed;
 }
  
  //Si llega al borde poner en reversa la velocidad
void reversaVelocidad (){ 
  if((x>width)||(x<0)){
    speed=speed*-1;
  }
}
 
 //dibujar circulo en la ubicacion de x
   void dibujarCirculo (){
  stroke(0);
  fill(175);
  ellipse(x,100,32,32);
  }


