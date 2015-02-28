
/* 
Pablo camus
 Noviembre 2008
 Revisado en 2009 para idep 
 */
//colores que rellenaran los circulos
/* mas adelante veremos como los arrays nos van a solucionar
la papeleta de cuando tenemos muchas variables del mismo tipo- podemos
tomarlos como vagones- arrays pero ahora nos conformaremos con variables
de color*/
color COLOR0 = #10B9E5;
color COLOR1= #050505;
color COLOR2= #1D8089;
color COLOR3 = #050505;
color COLOR4 = #FF00FB;
color COLOR5 = #FF00FB;
color COLOR6 = #1793D3;
color colorActivo; //color activo 

/*CONSTANTES: Variables que no se modificarán en 
la ejecucuón del programa, no tienen por que ir en mayúsculas
pero es una normativa que hace diferenciar entre las otras variables que
si cambian de valor*/
int NUM_CIRCULOS = 6; //numero de circulos que aparecen por la pantalla.minimo 2
float DIAMETRO_INIT =800; //valor inicial del diametro
float DIAMETRO_INC= 10; //incremento del diametro, en nuestro caso lo restaremos
float RANDOM_DIAMETRO = 50; //valor de rango aleatorio para el diametro
//VARIABLES

PImage bg;
float xx = 1220;
float x_inc; //x_inc de la posicion x
float yy ; //coordenada de posicion y

float diametro; //diametro de la elipse. 
color colorDeFondo ;



boolean limpiarPantalla = false; //variable booleana para controlar si hay que limpiar pantalla

void setup() 
{
  //size(screen.width,screen.height);// variante: ancho y alto de la pantalla
  size(800,600);
  frameRate(60);
  background(0);  
  noCursor();//eliminamos el cursor
  smooth();
  noStroke();
  //INICIALIZACIÃƒâ€œN DE VARIABLES-------------------------------------------------------
  diametro= DIAMETRO_INIT;  //inicializamos el x_inc al valor inicial
   x_inc = width/(NUM_CIRCULOS-1); //variable que controlarÃƒÂ¡ que distancia tendrÃƒÂ¡ cada circulo
  yy = height/2; //posicion y de los circulos- mitad de la pantalla
  /*--------------------------------------------------------------------------------------*/
  bg = loadImage("bg_cono.jpg");
  limpiarPantalla = true;
  colorDeFondo = devuelveColores();
}

void draw() 
{

  //variable local de la funcion draw que guarda el color activo de la escen
  if (limpiarPantalla)  {
    colorDeFondo = devuelveColores();
    tint(colorDeFondo);
    image(bg,0,0);
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

      diametro= diametro-DIAMETRO_INC;  //restamos el incremento
    }
  }  
  /* -------------------render end ----------------*/

  /* -------------------display init ----------------*/

  //control de colores. 
  // PREGUNTA: el diametro actual es menor que el diametro
  //inicial?
  if (diametro<DIAMETRO_INIT){ 
    //si el diametro es menor que el diametro inicial

    //elegimos el color segun un random de 7 colores
    fill(devuelveColores());
  }
  else
  {
    //solo se ejecutara una vez, cuando diametro = DIAMETRO_INIT
    fill(colorDeFondo);
  }
  float diametro_random= abs(random(diametro-RANDOM_DIAMETRO,diametro)); //variacion para hacer randoms 

  //println("diametro >> "+diametro+ " | diametro_random >> "+diametro_random+ " | xx >> "+xx);
  ellipse(xx,yy,diametro_random,diametro_random);
  /* -------------------display init ----------------*/
}


color devuelveColores(){
color colordevuelto = #000000;;
  int p = int(random(7)); //numero aleatorio convertido a entero 
  if (p == 0)  colordevuelto =COLOR0;
  if (p == 1)  colordevuelto =COLOR1;
  if (p == 2)  colordevuelto =COLOR2;
  if (p == 3)  colordevuelto =COLOR3;
  if (p == 4)  colordevuelto =COLOR4;
  if (p == 5)  colordevuelto =COLOR5;
  if (p == 6)  colordevuelto =COLOR6;
  //println("colordevueltoor:"+colordevuelto);
  return colordevuelto;
}


void keyPressed() {
  switch(key) {
      case 's': 
      case 'S': 
         println("salvamos IMAGEN");
         save("out/filename-"+frameCount+".png");
         break;
         
    
         
      case 'B': //pintar en negro
      case 'b': 
        
       background (COLOR2 = #050505);
         break;  
        
        
         case 'F': //pintar en amarillo
      case 'f': 
        
       background (COLOR2 = #FFEA00);
         break; 
  }
} 

















