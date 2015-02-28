
/*
PROYECTO 01 SESION 2 : ESTATICO
 
 Título: Malevich
 Nombre: Rut Abradó
 Fecha:  Martes, 19 de mayo de 2009
 Lugar: Blanes
 Objetivo: a partir del skecth del PROYECTO 01 crear una reinterpretación interactiva utilizando el modo
 continuo. 
 En el modo continuo entran las dos funciones de sistema 
 setup() y draw()
 para ayudaros dejaré la estrucutra básica del modo continuo.
 //
 
 Descripción: 
 q= Limpia pantalla
 z= Rectangulo azul
 x= Rectangulo rojo
 mover ratón + a= Rectangulo azul oscuro
 mover ratón + s= Rectangulo blanco
 presionar + mover ratón= Rectangulo amarillo
 
 */
// NO SE TE OLVIDE COMENTAR TODO LO POSIBLE EL CÓDIGO! 

//DECLARACIÓN DE VARIABLES, es lo primero que se ejecuta de la aplicacion
color micolor = #000fff;
float a;//declaramos variable tipo decimal a
float r; //declaramos variable tipo decimal r
float diametro ;  //declaracion de variable diametro de mi circulo
boolean limpiamosPantalla = false; //variable logiga, puede valer verdadero (true) o falso (false)
PImage fondo ;
void setup(){
  //setup, INICIALIZACION, solo se ejecuta una vez
  size(450,625); // lo primero que se pone!
  fondo = loadImage("textura.jpg");
  background( fondo); // pintamos el lienzo de un color
  smooth(); //suavizamos 
  noStroke();
  
//Rectangulo rojo abajo izquierda
fill(#7b1c0c);
quad(186,377,221,377,152,565,122,565);


//Rectangulo amarillo abajo izquierda
quad(157,399,179,399,103,625,81,625);

//Rectangulo amarillo abajo derecha
quad(340,586,437,537,437,558,340,604);



}

void draw(){
  if (limpiamosPantalla) background(fondo); 
  //sentencia condicional, asi podemos CONTROLAR nuestro programa
  //es una pregunta, que puede ser VERDADERA O FALSA , si es VERDADERA se ejecuta background(fondo); 
a = random(205);
  r = random(255);
pushMatrix(); //reservado
  diametro = random(0,200); //inicializamos la variable con un valor decimal aleatorio entre 0 y 100
   println("mensaje de consola: diametro"+ diametro);
fill(r,0,0,a);
 //stroke(#ffffff);
 translate(-155,-100);
   
  ellipse(width/2,height/2,diametro,diametro);
popMatrix();
  
  //Cruz azul
noStroke();
fill(#131b8f,200);
beginShape(); //formas complejas
vertex(201, 113);
vertex(181, 118);
vertex(180, 109);
vertex(199, 103);
vertex(196, 84);
vertex(206, 82);
vertex(209, 100);
vertex(230, 94);
vertex(233, 102);
vertex(211, 110);
vertex(290, 549);
vertex(279, 556);
endShape(CLOSE);

}
void keyPressed() {
  switch(key) {
  case 'z': 
    println("has pulsado la tecla z");
    //Rectangulo rojo abajo derecha
quad(280,584,401,518,401,546,293,604);
    break;
    
  case 'x': 
    println("has pulsado la tecla x");
    //Rectangulo rojo
fill(#7b1c0c);
quad(25,260,351,229,352,254,29,290);
    break;

  case 'a': 
    println("has pulsado la tecla a");
   fill(#7b1c0c);
    pushMatrix(); //reservado
translate(244,98);
rotate(PI/5.8); 
fill(#100e25);
rect(mouseX,mouseY,30,80);
popMatrix();
    break;
 
  case 's': 
    println("has pulsado la tecla s o S");

//Rectangulo blanco abajo
fill(#c8cdd2);
 pushMatrix(); //reservado
translate(244,98);
rotate(PI/5.8); 
rect(mouseX,mouseY,15,35);
popMatrix();
    break;
 
  case 'q': 
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
  //Rectangulo amarillo abajo izquierda
  fill(#e8b009,110);
rect(mouseX,mouseY,40,120);

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





