
/*Aqui declaramos las variables que vamos a utilizar en este código:
Tenemos la "x" y la "y" que son los puntos de partida de nuestro cuadrado
La "z" y la "w" que son los puntos de partida de nuestra elipse
"colorMario" y "colorLuigi" que son los valores que tendran de inicio nuestras figuras
Todas las variables en "int" ya que trabajaremos con enteros

VARIABLES QUE UTILIZAREMOS PARA LA INSERCION DE UNA IMAGEN COMO FONDO
"screensizex" y "screensizey" En enteros
"fondo" en PImage
*/

int x = 0;             
int y = 265;
int z = 640;
int w = -5;
int colorLuigi = 255;
PImage fondo;
int screensizex, screensizey;
int colorMario = 255;
;

/*Inicimos con este metodo "Void setup" los que seran valores fijos como 
la resolucion de nuestra pantalla */

void setup()
{
 size(636,342);
 frameRate(500);
 noStroke();
 smooth();
  
}

/*En este otro metodo "void draw" introduciremos valores que pueden variar
incluimos tambien las referencias de otros dos metodos que vamos a utilizar 
"mario" y "luigi" haciendo un llamamiento */
 
void draw(){
  println(mouseX, mouseY);
 screensizex = 636;
 screensizey = 342;
 fondo = loadImage ("mario.jpg");
 image (fondo,0,0,screensizex,screensizey); 
 
 stroke(0);
 fill(0);
 ellipse (246,27,100,25);
 
 fill(random(0,255),random(0,255),random(0,255));
 stroke(random(0,255),random(0,255),random(0,255));
 line (212,31,170,100);
 line (282,32,324,100);
 noStroke();
 ellipse (246,27,70,15);
 
 fill (180,57,0);
 rect (370,230,30,30);
  mario(); 
  luigi();
}

//Aqui tenemos el primer metodo "void mario" que esta dentro de "void draw" 

  void mario(){
    noStroke();
    fill(random(0,255),random(0,255),random(0,255));
    
/*Aqui creamos un cuadrado y le decimos que mientras el valor de "x" iniciado anteriormente en "0" sea menor que 700 (eje de las x) 
siga incrementando su valor en "1". Y cuando supere los 700 (eje de las x) "x" valga "-20" de manera que vuelva atras y se repita el proceso 
una y otra vez (BUCLE) */

    rect(x,y,50,50); 
    if (x <= 700){
       x++;
    }
       else if (x > 636) {
         x = -20;
       }
  
 //Aqui jugamos con los niveles ordenandole que varie su posicion en la eje de las "y" cuando llegue a ciertos puntos de la eje de las "x"
 
  fill (colorMario);
  if (x > 70) {
    colorMario = 0;
    y = 150;
  }
  if (x > 190) {
    colorMario = 0;
    y = 265;
  }
  if (x > 310) {
    colorMario = 0;
    y = 180;
  }
  if (x > 378) {
    colorMario = 0;
    y = 147;
  }
  if (x > 507) {
    colorMario = 255;
    y = 265;
  }
}

//Aqui tenemos el segundo metodo "void luigi" que esta dentro de "void draw" 

void luigi(){
  noStroke();
    fill(random(0,255),random(0,255),random(0,255));

    ellipse (z,w,50,50);
    if (z >= -50){
       z--;
    }
    else if (z < 0) {
         z = 640;
       }
     fill (colorLuigi);
  if (z > -50) {
    colorLuigi = 0;
    w = 130;
  }
}





