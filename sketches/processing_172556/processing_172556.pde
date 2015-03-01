
/*
Paula Buffone
TP Nº1: Paintbrush
Sistemas Interactivos En el Arte
Profesor: Diego Alberti
Funcionamiento: 
  -click izquierdo: pincel selecciona color y dibuja
  -click derecho: goma
  -presionando cualquier tecla del tecaldo: limpia la pantalla
*/

//Tamaño de pìncel: 5 pixeles
int grosorPincel = 5;
//defino como color primero de pincel, uno que no se encuentre entre los botones diseñados
color colorPincel = color(200);

//GOMA con ubicación parametrizada
void gomaDeBorrar(int x, int y)
{
//La goma será una línea que tendrá igual color al fondo pero cuadriplucará el grosor de las primeras
  stroke(255);
  strokeWeight(20);
  line( mouseX,mouseY,x,y);    
}
//se describe el procedimiento para reiniciar el lienzo de dibujo
void borrarTodo()
{
 //Características del fondo
 background(255);
    fill (100);
 stroke (100);
 strokeWeight (2);
 rect (5,475,690,35); 
 //Creo un texto con instrucciones
String s = "PAINTBRUSH - Click izquierdo: ELIGE COLOR -Click derecho: GOMA- Cualquier tecla: REINICIO";
fill(255);
text(s, 90, 485, 690, 485); 
  }
  
// Indico que, apretando culaquier tecla del teclado, se limpie el lienzo
void keyPressed()
{
if (keyPressed==true);
borrarTodo();
}
void setup()
{   
  //tamaño de la pantalla
 size(700, 520); 
 background(255);
 }

//creo las variables para ubicar los botones en el eje y
 int px = -1;
 int py = -1;
 
 int blanco = 10;
 int gris = 60;
 int negro = 110;
 int azul = 160;
 int amarillo = 210;
 int rojo = 260;
 int violeta = 310;
 int naranja = 360;
 int verde = 410;

void draw()
{
  // Procedimiento dibujar
 dibujar();
//creo un marco para centrar el dibujo 
 fill (200);
 noStroke();
 rect(0,0,85,520);
 rect(0,455,700,520);
 rect(0,0,700,30);
 rect(670,0,700,520);
//la leyenda se reinicia junto con los botones, lienzo y marco 
fill (100);
rect (5,475,690,35); 
String s = "PAINTBRUSH - Click izquierdo: ELIGE COLOR -Click derecho: GOMA- Cualquier tecla: REINICIO";
fill(255);
text(s, 90, 485, 690, 485); 

 //dibujo los botones con forma de óvalo e incluyo los colores a utilizar
 //blanco
 stroke(0);
 strokeWeight(2);
 ellipseMode(CORNER);
 fill(255);        ellipse(5,blanco,70,50);
 //gris
 fill(150);        ellipse(5, gris,70,50);
 //negro
 fill(0);          ellipse(5,negro,70,50);
 //azul
 fill(50,10,250);  ellipse(5,azul,70,50);
 //amarillo
 fill(250,250,10); ellipse(5,amarillo,70,50);
 //rojo
 fill(255,0,0);    ellipse(5,rojo,70,50);
 //violeta
 fill(150,50,250); ellipse(5,violeta,70,50);
 //naranja
 fill(250,150,50); ellipse(5,naranja,70,50);
 //verde
 fill(0,255,0);    ellipse(5,verde,70,50); 
}
//la función se llama cada vez que se suelta el mouse. 
//El pincel pinta desde donde uno le marca con el pincel  
void mouseReleased()
{
px = -1;
py = -1;
}

//Se define el pincel
void pincel(int x, int y)
{ 
//si la posición de x ó y es igual a -1, dicha posición tomará el lugar del mouse  
  if(px == -1) px = x; 
  if(py == -1) py = y; 
 //se dibuja el grosor de la línea
  strokeWeight(grosorPincel);  
  stroke(colorPincel);
  line(px, py, x, y);
  px = x;
  py = y;
}
 //describo proceso para que el pincel cambie de color
 //parametrizo colores
void cambiarColor(int r,int g,int b)
{
 colorPincel = color(r, g, b);
}
//llamo a la función dibujar
void dibujar()
 {
     if (mousePressed) {
    if (mouseButton==LEFT) {
      pincel(mouseX, mouseY); 
    }
    else if (mouseButton==RIGHT) {
      gomaDeBorrar(mouseX, mouseY);
    }
  }
 }
 //método de entrada utilizando el mouse, en donde el pincel copia el color del botón
 void mousePressed()
 {
  if (mouseButton==LEFT)
  {
    if (mouseY>=blanco && mouseY<=(blanco+50) && mouseX>=5 && mouseX<=75) 
    cambiarColor(255,255,255);
    if (mouseY>=gris && mouseY<=(gris+50) && mouseX>=5 && mouseX<=75) 
    cambiarColor(150,150,150);
    if (mouseY>=negro && mouseY<=(negro+50) && mouseX>=5 && mouseX<=75) 
    cambiarColor(0,0,0);
    if (mouseY>=azul && mouseY<=(azul+50) && mouseX>=5 && mouseX<=75) 
    cambiarColor(50,10,250);
    if (mouseY>=amarillo && mouseY<=(amarillo+50) && mouseX>=5 && mouseX<=75) 
    cambiarColor(250,250,10);
    if (mouseY>=rojo && mouseY<=(rojo+50) && mouseX>=5 && mouseX<=75) 
    cambiarColor(255,0,0);
    if (mouseY>=violeta && mouseY<=(violeta+50) && mouseX>=5 && mouseX<=75) 
    cambiarColor(150,50,250);
    if (mouseY>=naranja && mouseY<=(naranja+50) && mouseX>=5 && mouseX<=75) 
    cambiarColor(250,150,50);
    if (mouseY>=verde && mouseY<=(verde+50) && mouseX>=5 && mouseX<=75) 
    cambiarColor(0,255,0);
  }
}
  
