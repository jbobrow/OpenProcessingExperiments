
/* 
PROYECTO 01 SESION 2 : CONTINUO 
 
Título: Cuadro Malevich 
Nombre: Andrea Farina 
Fecha:  25/05/09 
Lugar: IDEP 
Objetivo: Creación de un dibujo en processing que se asemeje lo más posible a éste y se mueva algo
http://www.fiae.org/Malevich%20-%20Suprematism.JPG 
 
 
// 
 
Descripción: todo lo que quieras comentar describiendo tu proyecto 
*/ 


float r; //declaramos variable tipo decimal r
float g;//declaramos variable tipo decimal g
float b;//declaramos variable tipo decimal b
float a;//declaramos variable tipo decimal a

float diam;//declaramos variable tipo decimal diam
float x;//declaramos variable tipo decimal x
float y;//declaramos variable tipo decimal y

void setup() {
  //Inicio recta transversal amarilla abajo-------------------------------------------------------------------------- 



  
  size(648,900);//tamaño de pantalla
  background(255);//color de fondo
  smooth();    //suavizado
  
  smooth(); 
noStroke(); 
fill(242, 184, 1); 
quad(489, 843, 629, 774, 629, 801, 489, 868); 

//Inicio recta transversal roja abajo----------------------------------------------------------------------------- 

smooth(); 
noStroke(); 
fill(156, 30, 7); 
quad(402, 838, 575, 746, 576, 784, 421, 868); 

//Fin Recta transversal roja abajo-------------------------------------------------------------------------------- 
 
//Inicio recta diagonal amarilla---------------------------------------------------------------------------------- 

smooth(); 
noStroke(); 
fill(157, 143, 45); 
quad(225, 575, 256, 575, 145, 900, 116, 900); 

//Fin Recta diagonal amarilla------------------------------------------------------------------------------------- 
 
//Inicio recta diagonal roja-------------------------------------------------------------------------------------- 

smooth(); 
noStroke(); 
fill(120, 30, 7); 
quad(265, 544, 318, 544, 217, 813, 174, 813); 

//Fin Recta diagonal roja----------------------------------------------------------------------------------------- 
 
//Inicio recta transparente -------------------------------------------------------------------------------------- 

smooth(); 
strokeWeight(3); 
stroke(20, 29, 125, 25); 
fill(255, 144, 1, 60); 
quad(333, 563, 404, 563, 329, 775, 259, 775); 

//Fin Recta transparente ---------------------------------------------------------------------------------------- 
 
//Inicio recta debajo ------------------------------------------------------------------------------------------- 

smooth(); 
noStroke(); 
fill(205, 150, 1); 
quad(36, 374, 505, 320, 505, 364, 41, 416); 

//Fin Recta debajo ---------------------------------------------------------------------------------------------- 
 
 
//Inicio Cruz---------------------------------------------------------------------------------------------------- 

smooth(); 
noStroke(); 
fill(20, 29, 125); 
quad(257, 158, 330, 134, 334, 146, 260, 169); 
 
noStroke(); 
fill(20, 29, 125); 
quad(281, 120, 296, 118, 417, 788, 399, 800); 

//Fin Cruz------------------------------------------------------------------------------------------------------ 
 
 
//Inicio cuadro negro ------------------------------------------------------------------------------------------- 

smooth(); 
noStroke(); 
fill(0); 
quad(352, 144, 540, 244, 441, 421, 249, 322); 

//Fin cuadro negro------------------------------------------------------------------------------------------------ 
 
 

}



void draw() {
  //Cada vez que se ejecuta draw() nuevos numero aleatorios son introducidos en las variables
  r = random (255);
  g = random(255);
  b = random (255);
  a = random(255);
  diam = random(50, 215);
  x = (127);
  y = (145);
  
  // usamos variables para dibujar la elipse
  noStroke(); //quitamos el borde
  fill(r,g,b,a);//rellenamos con el valor de las variables
  ellipse(x,y,diam,diam);//dibujamos la elipse
}





