
/**Camila Donoso <br /> 
 * Proyecto final Lenguaje Computacional Cero <br /> 
 * Diseño. e[ad]. PUCV <br /> 
 * Martes 25 de Agosto 2009 <br /> 
 * POP- basado en ejemplo de objetos de Herbert Spencer <br />  
 
 Elipses dispuestas en torno al lienzo que cambian de color en base a un 
 random y que a la vez estas giran,ademas al presionan la tecla "c" de circulos,
 los elipses se agrandan y comienzan a rotar ,dejando una estela del color de los circulos,
 dando la impresión que van recorriendo todos los circulos
 
 
 */ 







int esp = 27; // espaciador 
 
void setup(){ 
  size ( 400, 400); 
  colorMode (RGB);
  frameRate (10);
  smooth ();
} 
 
void draw(){ //caracteristicas del objeto
  background(13,1,26); 
  for (int y = 0; y < height; y += esp){ 
    for (int x = 0; x < width; x += esp){ 
   stroke(15,206,166); 
   pelotitas(x,y); 
if(keyPressed) { //permite cambiar las caracteristicas de los circulos
    if (key == 'c' || key == 'c') {
 ellipse(x,y,random(20,30),random (50,15));
    }
  } else {
    fill(random(315), random (315), random (315), random (315));
  }
 
    } 
  } 
} 
  
 


 
void pelotitas (int _x, int _y){ //construccion de las pelotitas
float d = dist(50, 50, _x, _y);  
float a= noise(10);
float b= noise (10);


pushMatrix();{ //rotacion de las pelotitas y del color
  translate(_x,_y); 
rotate(random (10));
//stroke(162,5,162); 
fill(random(315), random (315), random (315), random (315)); 
noStroke();
ellipse(a,b,random(25,25),random(25,25)); 

} 
popMatrix(); 
} 

  

