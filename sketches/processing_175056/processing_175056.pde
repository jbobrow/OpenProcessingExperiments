
//Tauler de dibuix @alex

//Color figuras
float colorForma1 = 0;
float colorForma2 = 0;
float colorForma3 = 0;

//Figuras para dibujar
boolean linea = true;
boolean elipseAchatada = false;
boolean elipseNormal = false;
boolean cuadrado = false;

//FONDO CURADRADO
boolean rellenoCuadrado = false;//Para poner o quitar el fondo al cuadrado
//Colores del fondo del cuadrado
float fondoCuadrado1 = 245;
float fondoCuadrado2 = 245;
float fondoCuadrado3 = 245;

//FONDO ELIPSENORMAL
boolean rellenoElipseNormal = false;//Para poner o quitar el fondo a la elipseNormal
//Colores del fondo del cuadrado
float fondoElipseNormal1 = 245;
float fondoElipseNormal2 = 245;
float fondoElipseNormal3 = 245;

//HERRAMIENTAS
boolean panelAyuda = false;

//Incrementar valores de las figuras
int tamanoElipseAchatadaX = 25;
int tamanoElipseAchatadaY = 17;
int tamanoElipseNormalXY = 22;
int tamanoCuadradoXY = 20;
int tamanoLinea = 2;

void setup() {
size(750, 750);
background(245, 245, 245);
}
void draw() {
println(mouseX+ "," +mouseY); //Mostrar por terminal las coordenadas de los ejes X Y

noStroke();
smooth();
/** Marco de fondo **/
fill(80);
rect(0, 0, 90, height);//marco izquierda
rect(0, 0, width, 20);//marco superior
rect(0, 730, width, height);//marco inferior

/** Cuadro de colores **/
fill(204, 204, 204, 160);
rect(10, 10, 60, 408, 11);//cuadro colores
rect(10, 430, 60, 205, 11);//cuadro herramientas

/** Panel de Colores **/
//Color blanco 
fill(255);
ellipse(40, 30, 26, 26);
//Color negro
fill(0);
ellipse(40, 60, 26, 26);
//Color rojo
fill(255, 0, 0);
ellipse(40, 90, 26, 26);
//Color verde
fill(0, 245, 20);
ellipse(40, 120, 26, 26);
//Color azul
fill(0, 0, 190);
ellipse(40, 150, 26, 26);
//Color turquesa
fill(97, 255, 255);
ellipse(40, 180, 26, 26);
//Color naranja
fill(255, 167, 25);
ellipse(40, 210, 26, 26);
//Color amarillo
fill(217, 220, 0);
ellipse(40, 240, 26, 26);
//Color lila
fill(170, 11, 201);
ellipse(40, 270, 26, 26);
//Color rosa barbie
fill(253, 103, 223);
ellipse(40, 300, 26, 26);
//Color marron oscuro
fill(108, 58, 27);
ellipse(40, 330, 26, 26);
//Color marron
fill(150, 108, 24);
ellipse(40, 360, 26, 26);
//Color random
fill(255);
ellipse(40, 390, 26, 26);
fill(0);
textSize(10);
text("Ran", 31, 388);
text("dom", 31, 396);

/** Panel de Herramientas **/
//Elipse achatada
noFill();
strokeWeight(2);
stroke(0);
ellipse(38, 450, 25, 17);
//triangle(28, 460, 38, 439, 49, 460);//x1, y1, x2, y2, x3, y3

//Elipse
ellipse(38, 480, 22, 22);

//Rectangulo
rect(28, 502, 20, 20);

//Linea
//line(37, 533, 37, 552);
line(27, 543, 47, 543);

//Mas Herramientas
strokeWeight(4);
stroke(0, 0, 190);
arc(36, 561, 13, 10, PI+QUARTER_PI,TWO_PI+HALF_PI);//parte superior del interrogante
point(36, 576);//punto del interrogante
strokeWeight(3);
line(36, 568, 36, 572);//linea del interrogante

//Goma de borrar
strokeWeight(2);
stroke(0);
fill(255, 50, 115);
rect(28, 586, 15, 15, 2);//trozo rosa
strokeWeight(1.8);
fill(255);
rect(42, 586, 6, 15, 6);//trozo blanco

//Mostrar borrar dibujo
fill(0);
strokeWeight(2);
stroke(255, 0, 0);
line(32, 610, 44, 625);//cruz
line(44, 610, 32, 625);//cruz

/** Leyenda **/
textSize(14);
text("Atajos:", 10, 690);
textSize(12);
text("+: aumentar", 10, 710);
text("- : aumentar", 9, 725);
text("R: random", 12, 740);

//Mas Herramientas
if (mousePressed){
if (mouseX > 27 && mouseX < 50 && mouseY > 553 && mouseY < 579){
panelAyuda = true;
//desactivamos el dibujo para seleccionar las herramientas
linea = false;//se desactiva la linea
elipseAchatada = false;//se desactiva la elipse achatada
elipseNormal = false;//se desactiva la eclipse normal
cuadrado = false;//se desactiva el cuadrado
//panel de ayuda
stroke(0);
fill(204,204,204);
rect(87, 572, 260, 159, 9);//panel herramientas 
rect(311, 572, 29, 17, 3);//rectangulo para cerrar la cruz de cierre
stroke(255,0,0);
line(320, 577, 330, 584);//cruz para salir
line(330, 577, 320, 584);//cruz para salir 
/** Herramientas extra **/
//Añadir fondo al cuadrado.
stroke(0);
rect(100, 592, 25, 25);
stroke(255,0,0);
line(103, 599, 108, 595);
line(103, 605, 115, 595);
line(103, 611, 122, 595);
line(108, 613, 121, 602);
line(115, 613, 121, 608);

//Quitar fondo al cuadrado.
stroke(0);
rect(100, 630, 25, 25);

//Añadir fondo a la elipseNormal
ellipse(164, 606, 30, 30);
stroke(255,0,0);
line(155, 599, 160, 595);
line(155, 605, 164, 597);
line(156, 610, 170, 598);
line(160, 613, 173, 602);
line(165, 615, 173, 608);

//Quitar fondo a la elipseNormal
stroke(0);
ellipse(164, 643, 30, 30);

//BOOM
fill(random(255), random(255), random(255));
beginShape();
vertex(265, 680);
vertex(270, 666);
vertex(275, 680);
vertex(285, 685);
vertex(275, 690);
vertex(270, 700);
vertex(265, 690);
vertex(255, 685);
vertex(265, 680);
endShape();

}//CUADRADO
//Rellenar el cuadrado si pulsamos sobre el cuadrado rallado.
else if(panelAyuda && mouseX > 100 && mouseX < 125 && mouseY > 591 && mouseY < 617){ 
/*Al seleccionar el cuadrado rallado se activan los booleanos "rellenoCuadrado" y "cuadrado" para dibujar con
un fondo (se define en void mousePressed).
*/ 
rellenoCuadrado = true;//se activa rellenoCuadrado que rellena el cuadrado con el color que hayamos seleccionado.
cuadrado = true; 
}//Vaciar el cuadrado si pulsamos sobre el cuadrado vacio.
else if(panelAyuda && mouseX > 100 && mouseX < 125 && mouseY > 630 && mouseY < 655){
/*Al seleccionar el cuadrado sin rallar se desactiva el booleano "rellenoCuadrado" y el booleano "cuadrado" queda
activado para dibujar sin fondo. (se define en void mousePressed).
*/ 
rellenoCuadrado = false;
cuadrado = true;
}//FIN CUADRADO
//ELIPSENORMAL
//Rellenar la elipse si pulsamos sobre la elipseNormal rallada.
else if(panelAyuda && mouseX > 148 && mouseX < 606 && mouseY > 590 && mouseY < 620){
/*Al seleccionar la elipse rallada se activan los booleanos "rellenoElipseNormal" y "elipseNormal" para dibujar con
un fondo (se define en void mousePressed).
*/ 
rellenoElipseNormal = true;//se activa rellenoElipseNormal que rellena la elipse con el color que hayamos seleccionado.
elipseNormal = true;
}//Vaciar la elipseNormal si pulsamos sobre la elipse vacia.
else if(panelAyuda && mouseX > 148 && mouseX < 606 && mouseY > 628 && mouseY < 657){
/*Al seleccionar la elipse sin rallar se desactiva el booleano "rellenoElipseNormal" y el booleano "elipseNormal" queda
activado para dibujar sin fondo. (se define en void mousePressed).
*/ 
rellenoElipseNormal = false;
elipseNormal = true; 
}//FIN ELIPSENORMAL
else if(panelAyuda && mouseX > 254 && mouseX < 285 && mouseY > 665 && mouseY < 700){
textSize(30);
fill(random(255), random(255), random(255));
text("BOOM", random(750),random(750));
}
//Al pulsar en la cruz se crea un rectangulo sustituyendo la posicion del panel de ayuda y asi quitarlo.
else if (panelAyuda && mouseX > 311 && mouseX < 340 && mouseY > 572 && mouseY < 589){ 
//Se activa por defecto la herramienta linea. 
linea = true;//se dibuja la linea.
elipseAchatada = false;//se desactiva la elipse achatada.
elipseNormal = false;//se desactiva la elipse normal.
cuadrado = false;//se desactiva el cuadrado.
noStroke(); 
fill(245, 245, 245);
rect(90, 560, 280, 170); 
}
} 
/** Zona para dibujar **/
//Dibujar con linea.
if (mousePressed && mouseX > 85 && mouseX < 748 && mouseY > 20 && mouseY < 730) {
if (linea) {
strokeWeight(tamanoLinea);
stroke(colorForma1, colorForma2, colorForma3);
line(mouseX, mouseY, pmouseX, pmouseY);
}
//Dibujar con una elipse achatada.
if (elipseAchatada) {
noFill();
strokeWeight(2);
stroke(colorForma1, colorForma2, colorForma3);
ellipse(mouseX, mouseY, 25+tamanoElipseAchatadaX, 17+tamanoElipseAchatadaY);
}
//Dibujar con una elipse normal.
if (elipseNormal) {
fill(fondoElipseNormal1, fondoElipseNormal2, fondoElipseNormal3);
strokeWeight(2);
stroke(colorForma1, colorForma2, colorForma3);
ellipse(mouseX, mouseY, tamanoElipseNormalXY+22, tamanoElipseNormalXY+22);
} 
//Dibujar con un cuadrado.
if (cuadrado) {
fill(fondoCuadrado1, fondoCuadrado2, fondoCuadrado3);
strokeWeight(2);
stroke(colorForma1, colorForma2, colorForma3);
rect(mouseX, mouseY, tamanoCuadradoXY+20, tamanoCuadradoXY+20);
}
}

/** Efectos al pulsar una tecla **/
if (keyPressed) {
//Aumentar el tamano de las figuras.
if (key == '+' && tamanoLinea < 70) {
tamanoLinea = tamanoLinea +1;
}
//Aumentar la ELIPSEACHATADA si la seleccionamos y pulsamos el +.
if (key == '+' && elipseAchatada) {
tamanoElipseAchatadaX = tamanoElipseAchatadaX +1;
tamanoElipseAchatadaY = tamanoElipseAchatadaX +1;
}
//Reducir la ELIPSEACHATADA si la seleccionamos y pulsamos el -.
if (key == '-' && elipseAchatada) {
tamanoElipseAchatadaX = tamanoElipseAchatadaX -1;
tamanoElipseAchatadaY = tamanoElipseAchatadaX -1;
}
//Aumentar la ELIPSENORMAL si la seleccionamos y pulsamos el +.
if (key == '+' && elipseNormal) {
tamanoElipseNormalXY = tamanoElipseNormalXY +1;
}
//Reducir la ELISPENORMAL si la seleccionamos y pulsamos el -.
if (key == '-' && elipseNormal) {
tamanoElipseNormalXY = tamanoElipseNormalXY -1;
}
//Aumentar el CUADRADO si la seleccionamos y pulsamos el +.
if (key == '+' && cuadrado) {
tamanoCuadradoXY = tamanoCuadradoXY +1;
}
//Reducir el CUADRADO si la seleccionamos y pulsamos el -.
if (key == '-' && cuadrado) {
tamanoCuadradoXY = tamanoCuadradoXY -1;
} 
//Reducimos el tamano de la linea.
if (key == '-' && tamanoLinea > 2) {
tamanoLinea = tamanoLinea -1;
}
//Color random al pulsar la tecla R.
if (key == 'r' || key == 'R') {
colorForma1 = random(255);
colorForma2 = random(255);
colorForma3 = random(255);
}
}
}//draw

void mousePressed() {

/** Seleccion de colores **/

/* La seleccion de colores consiste en que una vez definimos las coordenadas de las elipses las cuales corresponden
a un color determinado.
*/
//Color blanco
if (mouseX > 27 && mouseX < 53 && mouseY > 17 && mouseY < 42) {
colorForma1 = 255;
colorForma2 = 255;
colorForma3 = 255;
}
//Color negro
if (mouseX > 27 && mouseX < 53 && mouseY > 47 && mouseY < 72) {
colorForma1 = 0;
colorForma2 = 0;
colorForma3 = 0;
}
//Color rojo
if (mouseX > 27 && mouseX < 53 && mouseY > 77 && mouseY < 102) {
colorForma1 = 255;
colorForma2 = 0;
colorForma3 = 0;
}
//Color verde
if (mouseX > 27 && mouseX < 53 && mouseY > 107 && mouseY < 132) {
colorForma1 = 0;
colorForma2 = 245;
colorForma3 = 20;
}
//Color azul
if (mouseX > 27 && mouseX < 53 && mouseY > 137 && mouseY < 152) {
colorForma1 = 0;
colorForma2 = 0;
colorForma3 = 190;
}
//Color turquesa
if (mouseX > 27 && mouseX < 53 && mouseY > 167 && mouseY < 192) {
colorForma1 = 97;
colorForma2 = 255;
colorForma3 = 255;
}
//Color naranja
if (mouseX > 27 && mouseX < 53 && mouseY > 197 && mouseY < 222) {
colorForma1 = 255;
colorForma2 = 167;
colorForma3 = 25;
}
//Color amarillo
if (mouseX > 27 && mouseX < 53 && mouseY > 227 && mouseY < 252) {
colorForma1 = 217;
colorForma2 = 220;
colorForma3 = 0;
}
//Color lila
if (mouseX > 27 && mouseX < 53 && mouseY > 257 && mouseY < 282) {
colorForma1 = 170;
colorForma2 = 11;
colorForma3 = 210;
}
//Color rosa barbie
if (mouseX > 27 && mouseX < 53 && mouseY > 287 && mouseY < 312) {
colorForma1 = 253;
colorForma2 = 103;
colorForma3 = 223;
}
//Color marron oscuro
if (mouseX > 27 && mouseX < 53 && mouseY > 317 && mouseY < 342) {
colorForma1 = 108;
colorForma2 = 58;
colorForma3 = 27;
}
//Color marron
if (mouseX > 27 && mouseX < 53 && mouseY > 347 && mouseY < 372) {
colorForma1 = 150;
colorForma2 = 108;
colorForma3 = 24;
}
//Color random
if (mouseX > 27 && mouseX < 53 && mouseY > 377 && mouseY < 402) {
colorForma1 = random(255);
colorForma2 = random(255);
colorForma3 = random(255);
}

/** Panel de Herramientas **/

//Dibujar linea
if (mouseX > 27 && mouseX < 50 && mouseY > 530 && mouseY < 553) {
linea = true;//se dibuja la LINEA.
elipseAchatada = false;//se desactiva la elipse achatada.
elipseNormal = false;//se desactiva la elipse normal.
cuadrado = false;//se desactiva el cuadrado.
}
//Dibujar elipseAchatada.
if (mouseX > 27 && mouseX < 50 && mouseY > 440 && mouseY < 458) {
linea = false;//se desactiva la linea.
elipseAchatada = true;//se dibuja la ELIPSE ACHATADA.
elipseNormal = false;//se desactiva la elipse normal.
cuadrado = false;//se desactiva el cuadrado.
} 
//Dibujar elipseNormal.
if (mouseX > 27 && mouseX < 50 && mouseY > 468 && mouseY < 490) {
//Cuando pulsamos sobre la elipseNormal se activa la herramienta para dibujar elipses SIN fondo.
linea = false;//se desactiva la linea.
elipseAchatada = false;//se desactiva la elipse achatada.
elipseNormal = true;//se dibuja la ELIPSE NORMAL.
cuadrado = false;//se desactiva el cuadrado.
}else if(panelAyuda && rellenoElipseNormal && elipseNormal){ 
//Cuando hacemos click a la elipse rallado dentro del panel de ayuda se dibuja la elipse CON fondo.
linea = false;//se desactiva la linea.
elipseAchatada = false;//se desactiva la elipse achatada.
elipseNormal = true;//se dibuja la ELIPSE NORMAL.
cuadrado = false;//se desactiva el cuadrado.
//Se pinta la elipse por dentro dando el valor del color seleccionado.
fondoElipseNormal1 = colorForma1;
fondoElipseNormal2 = colorForma2;
fondoElipseNormal3 = colorForma3;
}else if(panelAyuda && !rellenoElipseNormal && elipseNormal){
//Cuando hacemos click al cuadrado sin rallar dentro del panel ayuda se dibuja el cuadrado SIN fondo (por defecto o tiene fondo).
linea = false;//se desactiva la linea.
elipseAchatada = false;//se desactiva la elipse achatada.
elipseNormal = true;//se dibuja la ELIPSE NORMAL.
cuadrado = false;//se desactiva el cuadrado.
//Se pinta la elipse normal por dentro dando el valor que tiene el fondo.
fondoElipseNormal1 = 245;
fondoElipseNormal2 = 245;
fondoElipseNormal3 = 245;
}

//Dibujar cuadrado
if (mouseX > 27 && mouseX < 50 && mouseY > 500 && mouseY < 522){
//Cuando pulsamos sobre el cuadrado se activa la herramienta para dibujar cuadrado SIN fondo.
linea = false;//se desactiva la linea.
elipseAchatada = false;//se desactiva la elipse achatada.
elipseNormal = false;//se desactiva la eclipse normal.
cuadrado = true;//se dibuja el CUADRADO.
}else if(panelAyuda && rellenoCuadrado && cuadrado){ 
//Cuando hacemos click al cuadrado rallado dentro del panel de ayuda se dibuja el cuadrado CON fondo.
linea = false;//se desactiva la linea.
elipseAchatada = false;//se desactiva la elipse achatada.
elipseNormal = false;//se desactiva la elipse normal.
cuadrado = true;//se dibuja el CUADRADO.
//Se pinta el cuadrado por dentro dando el valor del color seleccionado.
fondoCuadrado1 = colorForma1;
fondoCuadrado2 = colorForma2;
fondoCuadrado3 = colorForma3;
}else if(panelAyuda && !rellenoCuadrado && cuadrado){
//Cuando hacemos click al cuadrado sin rallar dentro del panel ayuda se dibuja el cuadrado SIN fondo (por defecto o tiene fondo).
linea = false;//se desactiva la linea.
elipseAchatada = false;//se desactiva la elipse achatada.
elipseNormal = false;//se desactiva la elipse normal.
cuadrado = true;//se dibuja el CUADRADO.
//Se pinta el cuadrado por dentro dando el valor que tiene el fondo.
fondoCuadrado1 = 245;
fondoCuadrado2 = 245;
fondoCuadrado3 = 245;
}

//Borrar con la goma
if (mouseX > 27 && mouseX < 48 && mouseY > 586 && mouseY < 601) {
//Cuando se selecciona la goma, se desactiva las formas excepto la linea que se usara para borrar.
linea = true;
elipseAchatada = false;
elipseNormal = false;
cuadrado = false;

colorForma1 = 245;
colorForma2 = 245;
colorForma3 = 245;
} 
//Borrar dibujo
if (mouseX > 31 && mouseX < 45 && mouseY > 610 && mouseY < 625) { 
background(245, 245, 245);//Si el raton pulsa sobre la cruz vuelve a poner el fondo del color original.
//Al borrar todo se desactivan todas las herramientas menos la linea.
linea = true;
elipseAchatada = false;
elipseNormal = false;
cuadrado = false;
}
}


