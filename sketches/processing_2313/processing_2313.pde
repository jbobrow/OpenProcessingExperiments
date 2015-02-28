
color micolor = #000fff;
float diametro ;  //declaracion de variable diametro de mi circulo
boolean limpiamosPantalla = false; //variable logiga, puede valer verdadero (true) o falso (false)
PImage fondo ;
void setup(){
  //setup, INICIALIZACION, solo se ejecuta una vez
  size(450,338); // lo primero que se pone!
  fondo = loadImage("denver9 copia.JPG");
  background(fondo); // pintamos el lienzo de un color
  smooth(); //suavizamos
  
}

void draw(){
  if (limpiamosPantalla) background(fondo); 
  //sentencia condicional, asi podemos CONTROLAR nuestro programa
  //es una pregunta, que puede ser VERDADERA O FALSA , si es VERDADERA se ejecuta background(fondo); 

  diametro = random(0,70); //inicializamos la variable con un valor decimal aleatorio entre 0 y 100
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
  rect(mouseX,mouseY, 100, 100);

}

void mouseMoved() {
  println("has movido el raton");
}
void mousePressed() {
  println("has presionado el raton");
  micolor = color(random(255),68,54,25); 
  //como lo que queremos es un color , de decimos que lo convierta a color
  //convierteme loq ue hay entre parentesis a color  color(numero) , el color puede estar definido
  //por sus numeros R G B 

}






