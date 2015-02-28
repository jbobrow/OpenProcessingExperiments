
/* 
PROYECTO MALEVICH 2
 
Título: Malevich 2
Nombre: sílvia guinó
Fecha:  22.05.09 
Lugar: Barcelona 
Objetivo: crear una pieza interactiva en la cual se puede controlar la velocidad en la que cae una bola 
gravitacionalmente mediante los controles "+" y "-"
observaciones: ehm, no me funciona.

*/


float x = 95;   
float y = 108; //  posición x/y inicial del círculo    

float speed = 0;   // definición del valor de velocidad inicial a 0


float gravity = 0.1;  // definición del valor de gravedad inicial a 0,1

void setup() {
  size(480,666);
  smooth();  
}
/* ésta es la function que deberíaactivar los comandos para modificar la velocidad, pero si la activo no funciona nada.

void keyPressed() { // funcion que se activará siempre que pulsemos la tecla correspondiente
switch(key) {
  case '+':
speed = speed * 2;

  case '-':
speed = speed * -0.70;
}
*/

void draw() {
background(255);//el fondo se carga cada vez que se redibuja el círculo, si lo quitamos el círculose repite infinitamente; así que es mejor utilizar un color plano que una imagen.


        
 //----------------------------------figuras estaticas   

fill(209, 172, 29); 
quad(26, 277, 374, 244, 375, 270, 32, 308);
noStroke();
// figura horizontal ocre

fill(217, 197, 217); 
quad(248, 417, 300, 417, 248, 573, 192, 573);
noStroke(); 
//figura diagonal 3_rosa

 
fill(4, 9, 109); 
quad(190, 118, 243, 100, 248, 108, 191, 125);
noStroke(); 
// parte cruz horitzontal 

fill(4, 9, 109); 
quad(220, 88, 309, 584, 296, 590, 209, 90);
noStroke(); 
// parte cruz vertical 

fill(17, 14, 41); 
quad(398, 176, 330, 311, 186, 238, 258, 105);
noStroke(); 
// quadrat

fill(209, 172, 29); 
quad(170, 425 , 195, 425, 105, 679, 80, 679);
noStroke(); 
//figura diagonal 1_ocre

fill(127, 35, 12); 
quad(205, 400, 245, 400, 165, 620, 125, 620);
noStroke();
//figura diagonal 2_granate


fill(150, 28, 5); 
quad(426, 552, 426, 580, 312, 642, 298, 620);
noStroke(); 
// figura esquina 1

fill(205, 150, 1); 
quad(362, 622, 362, 640, 464, 592, 464, 572);
noStroke(); 
// figura esquina 2
 

  
  fill(171, 39, 1);// --------------círculo al que aplicamos la gravedad
  noStroke();
  ellipseMode(CENTER);
  ellipse(x,y,158,158);
  
  
  
  y = y + speed; // añadimos el valor de "velocidad" a las cordenadas de "y"
  
 
  speed = speed + gravity; // añadimos el valor de gravedad a la propiedad "velocidad"
  
  //si el ellipse toca la base del lienzo (el valor de y el mas grande que la altura del lienzo)se disminuira la velocidad
  if (y > height) {

    speed = speed * -0.95;  
  }
  


}









