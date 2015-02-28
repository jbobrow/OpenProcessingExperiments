
class Gota{
float x,y; //variables de ubicacion de las gotas
float velocidad;
color c;
float r; //radio de la gota

Gota(){
  r=random (6); //todas las gotas son del mismo tamaño
  x= random(-200,width); //empezar con una ubicacion random dentro del width
  y=-8; //comenzar mas arriba del campo 
  //para que parescan q caen desde mas alla
  velocidad=random(1,10); //elegir una velocidad random entre 1 y 5
  c=color (255);
}
//mover la gota hacia abajo
 void llover(){
   //acelerar la velocidad
   y+=2; //original: y+=velocidad
   x+=velocidad/4;//empujandolas un poco hacia la derecha
 }
//mostrar= dibujar las gotas
 void mostrar(){
   fill(c);
   noStroke();
   ellipse(x,y,r,r);
 }
} 

