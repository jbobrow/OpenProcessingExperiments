
/*
PROYECTO 01 SESION 2 : ESTATICO
 
 Título: titulo del sketch
 Nombre: tu nombre
 Fecha:  fecha
 Lugar: lugar de creación
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
color micolor = #8B0000;
float diametro ;  //declaracion de variable diametro de mi circulo
boolean limpiamosPantalla = false; //variable logiga, puede valer verdadero (true) o falso (false)
PImage fondo ;
void setup(){
  //setup, INICIALIZACION, solo se ejecuta una vez
  size(500,500); // lo primero que se pone!
  fondo = loadImage("fondo.jpg");
  background(241,234,228); // pintamos el lienzo de un color
  smooth(); //suavizamos 

}

void draw(){
  if (limpiamosPantalla) background(fondo); 
  //sentencia condicional, asi podemos CONTROLAR nuestro programa
  //es una pregunta, que puede ser VERDADERA O FALSA , si es VERDADERA se ejecuta background(fondo); 

  diametro = random(200,300); //inicializamos la variable con un valor decimal aleatorio entre 0 y 100
  // println("mensaje de consola: diametro"+ diametro);
  fill(micolor);
  ellipse(width/2,height/2,diametro,diametro);

  diametro = random(10,20); //inicializamos la variable con un valor decimal aleatorio entre 0 y 100
  // println("mensaje de consola: diametro"+ diametro);
  fill(micolor);
  ellipse(width/4,height/4,diametro,diametro);
  
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
  fill(85,130,193);
ellipse(75, 220, 40, 45);
fill(69,104,172,80);
ellipse(73, 216, 30, 30);
//bola azul
fill(85,130,193);
ellipse(75, 220, 40, 45);
fill(69,104,172,80);
ellipse(73, 216, 30, 30);
//fim bola azul
 
//bola verde
fill(84,108,87);
ellipse(150, 65, 45, 50);
fill(61,71,63,80);
ellipse(147, 62, 30, 33);
//fim bola verde
// vermelho cerca del bolao
fill(174,40,31,180);
ellipse(450, 220, 60, 63);
fill(174,40,31,170);
ellipse(450, 218, 48, 53);
// fim vermelho cerca del bolao
 

filter(BLUR, 1);
fill(68,70,69);
rect(mouseX,mouseY, 500, 20);

}

void mouseMoved() {
  println("has movido el raton");
}
void mousePressed() {
  println("has presionado el raton");
  micolor = color(random(255),0,0); 
  //como lo que queremos es un color , de decimos que lo convierta a color
  //convierteme loq ue hay entre parentesis a color  color(numero) , el color puede estar definido
  //por sus numeros R G B 

}





