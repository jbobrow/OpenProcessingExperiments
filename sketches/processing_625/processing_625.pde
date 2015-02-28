
/* 
 Alba G. Corral
 Noviembre 2008
 */
//colores que rellenaran los circulos
color COLOR0 = #555566;
color COLOR1= #4A4A5D;
color COLOR2= #C3C3BB;
color COLOR3 = #F6F7E4;
color COLOR4 = #CAB3A2;
color COLOR5 = #F2401D;
color COLOR6 = #F2401D;
color colorActivo; //color activo 

//CONSTANTES: Variables que no se modificarán en la ejecución del programa
int NUM_CIRCULOS = 10; //numero de circulos que aparecen por la pantalla
float DIAMETRO_INIT = 400; //valor inicial del diametro
float DIAMETRO_INC= 10; //incremento del diametro, en nuestro caso lo restaremos
float RANDOM_DIAMETRO = 50; //valor de rango aleatorio para el diametro
//VARIABLES

PImage bg;
float xx = 0;
float x_inc; //x_inc de la posicion x
float yy ; //coordenada de posicion y

float diametro; //diametro de la elipse. 




boolean limpiarPantalla = false; //variable booleana para controlar si hay que limpiar pantalla

void setup() 
{
  //size(screen.width,screen.height);// variante: ancho y alto de la pantalla
  size(800,563);
  frameRate(10);
  background(0);  
  noCursor();//eliminamos el cursor
  smooth();
  noStroke();
  //INICIALIZACIÓN DE VARIABLES-------------------------------------------------------
  diametro= DIAMETRO_INIT;  //inicializamos el x_inc al valor inicial
  x_inc = width/(NUM_CIRCULOS-1); //variable que controlará que distancia tendrá cada circulo
  yy = height/2; //posicion y de los circulos- mitad de la pantalla
  /*--------------------------------------------------------------------------------------*/
  bg = loadImage("bg.png");
  background(bg);
}

void draw() 
{
  if (limpiarPantalla)  {
    background(bg);
    limpiarPantalla =!limpiarPantalla;
  }
  /*------------------render init-----------------*/
  xx = xx + x_inc; //aumentamos posicion x
  if (xx > width) {  //si llegamos al ancho de la pantalla 
    xx = 0;  //posicionamos la x al principio
    if (diametro<= 0) { //si el diametro es menor o igual que cero
      limpiarPantalla = true; //limpiamos pantalla
      diametro= DIAMETRO_INIT; //inicializamos el radio al valor inicial

    }
    else
    {
      limpiarPantalla = false;
      diametro= diametro-DIAMETRO_INC;  //restamos el incremento
    }
  }  
  /* -------------------render end ----------------*/

  /* -------------------display init ----------------*/
  //elegimos el color segun un random de 7 colores
  int p = int(random(7)); //numero aleatorio convertido a entero 
  if (p == 0)  colorActivo =COLOR0;
  if (p == 1)  colorActivo =COLOR1;
  if (p == 2)  colorActivo =COLOR2;
  if (p == 3)  colorActivo =COLOR3;
  if (p == 4)  colorActivo =COLOR4;
  if (p == 5)  colorActivo =COLOR5;
  if (p == 6)  colorActivo =COLOR6;
  //println("color:"+p);


  //control de colores. Colorearemos siempre que el diametro sea menor a la posicion inicial
  if (diametro<DIAMETRO_INIT){ //si el diametro es menor que el diametro inicial
    fill(colorActivo);
  }
  else
  {
    //solo se ejecutara una vez, cuando diametro = DIAMETRO_INIT
    println("negro con borde. Diametro:"+diametro);
    fill(0);
  }
  float diametro_random= abs(random(diametro-RANDOM_DIAMETRO,diametro)); //variacion para hacer randoms 
 //  float diametro_random = diametro;
  println("diametro >> "+diametro+ " | diametro_random >> "+diametro_random+ " | xx >> "+xx);
  ellipse(xx,yy,diametro_random,diametro_random);
  /* -------------------display init ----------------*/
}





















