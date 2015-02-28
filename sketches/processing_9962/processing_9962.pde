
/*
PROYECTO 01 SESION 2 : ESTATICO
 
 Título: PROYECTO CONTINUO.MOVIMIENTO
 Nombre: LAURA VALERO
 Fecha:  23-05-10
 Lugar: EMPORDA
 Objetivo: a partir del skecth del PROYECTO 01 crear una reinterpretación interactiva utilizando el modo
 continuo. 
 En el modo continuo entran las dos funciones de sistema 
 setup() y draw()
 para ayudaros dejaré la estrucutra básica del modo continuo.
 //
 
 Descripción: todo lo que quieras comentar describiendo tu proyecto
 */
// NO SE TE OLVIDE COMENTAR TODO LO POSIBLE EL CÓDIGO! 

//DECLARACIÓN DE VARIABLES, es lo primero que se ejecuta de la aplicacion
color micolor = 255;
float diametro ;  //declaracion de variable diametro de mi circulo
boolean limpiamosPantalla = false; //variable logiga, puede valer verdadero (true) o falso (false)
PImage fondo ;
void setup(){
  //setup, INICIALIZACION, solo se ejecuta una vez
  size(500,500); // lo primero que se pone!
  fondo = loadImage("fondo2.jpg");
  background( fondo); // pintamos el lienzo de un color
  smooth(); //suavizamos 

}

void draw(){
  if (limpiamosPantalla) background(fondo); 
  //sentencia condicional, asi podemos CONTROLAR nuestro programa
  //es una pregunta, que puede ser VERDADERA O FALSA , si es VERDADERA se ejecuta background(fondo); 

  diametro = random(0,400); //inicializamos la variable con un valor decimal aleatorio entre 0 y 100
  // println("mensaje de consola: diametro"+ diametro);
  fill(micolor);
  ellipse(width/2,height/2,diametro,diametro);

}
void keyPressed() {
  switch(key) {
  case '+': 
    println("has pulsado la tecla +");
    break;
  case '-': 
    println("has pulsado la tecla -");
    break;

  case 'q': 
    println("has pulsado la tecla q");
    break;
  case 's': 
  case 'S': 
    println("has pulsado la tecla s o S");
    break;

  case 'b': 
  case 'B': 
    limpiamosPantalla =! limpiamosPantalla;
    /*un truco para hacer como un boton, si la variable limpiamosPantalla vale TRUE, entonces valdrá  FALSE, y al reves, 
     es lo mismo que poner esto
     if (limpiamosPantalla == true){
     limpiamosPantalla = false;
     }
     else
     {
     limpiamosPantalla = true;
     }
     */
    break;
  }
}
void mouseDragged() {
  println("has arastrado el raton");
  rectMode(CENTER) ; //centralizamos el punto de anclaje del rectangulo al centro
  color(random(80,200));
  rect(mouseX,mouseY, 20, 2000);
  ellipse(mouseX,mouseY,100, 100);
  

}

void mouseMoved() {
  println("has movido el raton");
}
void mousePressed() {
  println("has presionado el raton");
  micolor = color(250,20); 
  //como lo que queremos es un color , de decimos que lo convierta a color
  //convierteme loq ue hay entre parentesis a color  color(numero) , el color puede estar definido
  //por sus numeros R G B 

}





