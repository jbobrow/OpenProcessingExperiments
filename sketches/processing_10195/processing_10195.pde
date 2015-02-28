
/*
PROYECTO 01 SESION 2 : ESTATICO

Título: Cuadro Miro´
Nombre: Andreu Llopart
Fecha:  2010 05 26
Lugar: Barcelonauten
Objetivo: Creación de un dibujo en processing que se asemeje lo más posible a éste
http://www.fiae.org/Malevich%20-%20Suprematism.JPG
pistas: 
para hacer formas mas complejas utilizar  beginShape http://processing.org/reference/beginShape_.html
para hacer cuadrados utilizar rect http://processing.org/reference/rect_.html
para hacer elipses utilizar ellipse http://processing.org/reference/ellipse_.html
para poner una imagen de fondo mirar el ejemplo incluido en processing > Basic > image > background Image
para quitar el color del borde : noStroke();
para colorear fill(color);
el orden de los comandos es importante. Lo que primero se escribe primero se ve.

//

Descripción: todo lo que quieras comentar describiendo tu proyecto
*/
// NO SE TE OLVIDE COMENTAR TODO LO POSIBLE EL CÓDIGO! 

//Declara la vaiable a load image
PImage a;



//Escena
void setup() {

  size(800, 600);
  background(200);
   a = loadImage("bck.jpg");
   
   }
   
   
void draw() {
  
  
    // Displays the image at its actual size at point (0,0)
  image(a, 0, 0); 
  // Displays the image at point (100, 0) at half of its size
  image(a, 100, 0, a.width/2, a.height/2);
  
  //Colores
  color c1 = #26262b;
  color c2 = #b02834;
  color c3 = #353334;
  color c4 = #446049;
  color c5 = #466db0;
  color c6 = #ab512e;
  color c7 = #5e3229;
  
//Elipse roja
smooth();
noStroke();
fill(c2);
ellipse(380, 150,400, 270);

//Elipse verde
smooth();
noStroke();
fill(c4);
ellipse(150, 50, 50, 55);

//Elipse azul
smooth();
noStroke();
fill(c5);
ellipse(80, 270, 40, 45);

//Elipse azul
smooth();
noStroke();
fill(c5);
ellipse(690, 136, 40, 45);

//Elipse azul
smooth();
noStroke();
fill(c5);
ellipse(630, 208, 40, 45);

//Elipse azul
smooth();
noStroke();
fill(c5);
ellipse(764, 246, 50, 45);
//fondo negro
fill(c3);
beginShape();
vertex(0, 350);
vertex(288, 325);
vertex(800, 288);
vertex(800, 600);
vertex(0, 600);
endShape(CLOSE);

//Linea negra
fill(c1);
beginShape();
vertex(0, 350);
vertex(288, 325);
vertex(800, 288);
vertex(800, 333);
vertex(399, 366);
vertex(0, 406);
endShape(CLOSE);

//Elipse azul
smooth();
noStroke();
fill(c6);
ellipse(560, 490, 100, 100);

//Elipse azul
smooth();
noStroke();
fill(c6);
ellipse(170, 530, 40,   35);





}


