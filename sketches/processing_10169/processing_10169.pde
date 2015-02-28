
/*
 
 Título: Motion Miro
 Nombre: Ana Paula Carvalho
 Fecha:  06_10
 Lugar: Barcelona
 Objetivo: Crear un skecht sobre el cuadro del Miro donde adaptei ao modo continuo
 //
 
 Descripción: todo lo que quieras comentar describiendo tu proyecto
 */


//DECLARACIÓN DE VARIABLES, es lo primero que se ejecuta de la aplicacion
color micolor = #000fff;
float diametro ;  //declaracion de variable diametro de mi circulo
boolean limpiamosPantalla = false; //variable logiga, puede valer verdadero (true) o falso (false)
PImage fondo ;
void setup(){
  //setup, INICIALIZACION, solo se ejecuta una vez
  size(600,600); // lo primero que se pone!
  background(243,233,231); // pintamos el lienzo de un color
  smooth(); //suavizamos 
  

}

//Bola vermelha
void draw(){
  if (limpiamosPantalla) background(fondo); 
  //sentencia condicional, asi podemos CONTROLAR nuestro programa
  //es una pregunta, que puede ser VERDADERA O FALSA , si es VERDADERA se ejecuta background(fondo); 

  diametro = random(0,100); //inicializamos la variable con un valor decimal aleatorio entre 0 y 100
  // println("mensaje de consola: diametro"+ diametro);
  fill(196,63,68);
  stroke(200);
  ellipse(width/2,height/2-80,diametro+200,diametro+50);
  filter(BLUR, 1);

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

//Retangulo
void mouseDragged() {
  fill(46,46,48);
  stroke(74,74,76);
  println("has arastrado el raton");
  rectMode(CENTER) ; //centralizamos el punto de anclaje del rectangulo al centro
  rect(mouseX,mouseY, width+2000, height/20);


}

//Bolinhas coloridas
void mouseMoved() {
  println("has movido el raton");
   fill(devuelveColor());
  ellipse(random(width),random(height),map(mouseX,10,width,0,50),map(mouseX,10,width,0,50));
}
void mousePressed() {
  println("has presionado el raton");
  fill(devuelveColor());
  //micolor = color(random(0),100,100); 
  //como lo que queremos es un color , de decimos que lo convierta a color
  //convierteme loq ue hay entre parentesis a color  color(numero) , el color puede estar definido
  //por sus numeros R G B 

}
//Cor bolinhas
color devuelveColor() {
  float rojo = random (0,100);
  float verde = random(0,100);
  float azul = 50;
  return color(rojo,verde,azul);
}





