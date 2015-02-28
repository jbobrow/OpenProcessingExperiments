
/*  _03_01_estrella
 
 Processing idep 2010
 Session3_ Ana Paula Carvalho
 Estrelas Coloridas
 
 Objetivo: Crear un ambiente estetico con lineas y colores
 
 
 Descrici´n-. Dibuja una estrella utilizando lineas con el raton
 NOs servira para aprender para que sirven las sentencias de control y como podemos ir modificando
 el valor de una variable
 */
/* VARIABLES QUE SON RECONOCIDAS POR EL RESTO DE LOS BLOQUES*/
int posx,posy;//posicion x e y de nuestro pincel
int distancia; //distancia entre cada linea
int conty1,contx1,contx2,conty2;//contadores que utilizaremos para ir dibujando cada cuadrante
color c = color(#999999);//en hexadecimal

void setup()
{
  size(800,700);//ponemos el posx y el posy de la ventana
  frameRate(10);//numero de veces que se ejecuta la funcion draw por segudo
  noStroke();//deshabilita la posibilidad de poner borde
  smooth();//suavizamos
  background (0);
  filter(BLUR, 1);
  //iniciar();//iniciamos! es una llamada a una funcion, una funcion que no devuelve nada y que no tiene parametros de entrada
}

void draw()
{ 
  contx1 = contx1 - distancia; //el contador x1 ira en disminucion. 
  conty1 = conty1 + distancia;// en aumento
  conty2 = conty2 - distancia; //disminucion
  contx2 = contx2 + distancia;//aumento
  /*si llegamos con el conty1 a la mitad de la pantalla , ya hemos dibujado todas las lineas
   esto es lo que se llama sentencia de control porque podemos mediante una pregunta controlar
   nuestro programa
   esta pregunta siempre nos dar´ una respuesta de verdadero o falso, si es verdadero ejecutara
   lo que hay dentro del bloque 
   */

  //dibujamos las lineas de los 4 cuadrantes 
  line(contx1,posy,posx,conty1);
  line(posx,conty1,contx2,posy);
  line(posx,conty2,contx1,posy);
  line(posx,conty2,contx2,posy);
}


