
/* @pjs preload="brs.jpg, rwby.jpg"; 
 */

PImage fons1, fons2;
Boton b1,b2;
int pantalla = 1;

void setup(){
  size(1280,720);
  
  b1 = new Boton(60,450, color(255,0,100), 125, 25, 1, 2, "Black Gold Saw");
  b2 = new Boton(820, 630, color(255,0,0), 150, 25, 2, 1, "Black Rock Shooter");
  fons1 = loadImage("brs.jpg");
  fons2 = loadImage("rwby.jpg");
}



void draw(){
  switch(pantalla){
   case 1: Pantalla1();break;
   case 2: Pantalla2();break; 
  }
  
  
    
    
}

void mousePressed(){
  b1.Botonzuelo();
  b2.Botonzuelo();
  
}


class Boton{
int posX;
int posY;
color c;
int  widthV;
int heightV;
int actual;
int destino;
PFont fuenteBoton;
String textoBoton;

Boton(){
    posX = width/2;
    posY = height/2;
    c = color(255,0,100);
    widthV = 125;
    heightV = 25;
    actual = 1;
    destino = 2;
    fuenteBoton = createFont("Verdana", 12);
    textFont(fuenteBoton);
    textoBoton = "Texto";
  }
  Boton(int x, int y, color colorin, int anchura, int altura, int inicial, int finalV, String texto){
    fuenteBoton = createFont("Verdana", 12);
    textFont(fuenteBoton);
    posX = x;
    posY = y;
    c = colorin;
    widthV = anchura;
    heightV = altura;
    actual = inicial;
    destino = finalV;
    textoBoton = texto;
  }
  
  void dibu(){
    fill(c, 100);
    rect(posX, posY, widthV, heightV, 5);
    fill(255);
    text (textoBoton, posX + 10, posY + 20);
  }
  
  void Botonzuelo(){
    if ((posX <= mouseX && mouseX <= posX + widthV) && (posY <= mouseY && mouseY <= posY + heightV) && pantalla == actual){
      pantalla = destino;
    }
  }

}
void Pantalla1(){
   image(fons1, 0,0);
   b1.dibu();
}
void Pantalla2(){
   image(fons2, 0,0);
   b2.dibu();
}


