
/* @pjs preload="1.png, 2.png, 3.png"; 
 */

PImage fons1, fons2, fons3;
Boto b1, b2, b3;
int pantalla=1;

void setup(){
  size(960, 540);
  fons1 = loadImage("1.png"); //Escriptori
  fons2 = loadImage("2.png"); //Inici
  fons3 = loadImage("3.png"); //Word
  b1 = new Boto();
  b2 = new Boto(4,310,color(255),158,20,2,3);
  b3 = new Boto(947,3,color(255),10,10,3,1);

}
void draw(){
  background(100);
  switch(pantalla){
    case 1: windows();break;
    case 2: inicio();break;
    case 3: word();break;
  }
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
  b3.apreta();
}

class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti;
  
  //Dades per defecte
  Boto(){ 
    xPos = (width/2)-475;
    yPos = (height/2)+247;
    c = color(0);
    widthB = 22;
    heightB = 22;
    pantallaActual = 1;
    pantallaDesti = 2;
  }
  
  Boto(float x, float y, color col, float w, float h, int inici, int fi){
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
  }
  
  void dibuixa(){
    
    //Botó
    noStroke(); //No té contorn
    noFill(); //Tampoc té color de fons
    rect(xPos, yPos, widthB, heightB, 5); //Posicions i mida del botó
  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }

}
void windows(){
  image(fons1, 0, 0);
  b1.dibuixa();
}
void inicio(){
  image(fons2, 0, 0);
  b2.dibuixa();
}
void word(){
  image(fons3, 0, 0);
  b3.dibuixa();
}



