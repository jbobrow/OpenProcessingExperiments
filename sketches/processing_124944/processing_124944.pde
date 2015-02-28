
/* @pjs preload="img1.png, img2.png"; 
 */

PImage fons1, fons2;
Boto b1, b2 ;
int pantalla=1;

void setup(){
  size(400, 200);
  fons1 = loadImage("img1.png");
  fons2 = loadImage("img2.png");
  b1 = new Boto();
  b2 = new Boto(120, 170, color(255,255,255), 60, 20, 2, 1,"");
  
}
void draw(){
  background(100);
  switch(pantalla){
    case 1: grup();break;
    case 2: altavoces();break;
  }
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
}




class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti; 
  PFont fonBoto;
  String texte;
  
  Boto(){
    xPos = 125;
    yPos = 9;
    c = color(255,255,255);
    widthB = 70;
    heightB = 25;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    texte = "";
  }
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    texte = t;
  }
  
  void dibuixa(){
    fill(c, 100);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);
    text (texte, xPos + 10, yPos + 20);
  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }

}
void grup(){
  image(fons1, 0, 0);
  b1.dibuixa();
}
void altavoces(){
  image(fons2, 0, 0);
  b2.dibuixa();
}


