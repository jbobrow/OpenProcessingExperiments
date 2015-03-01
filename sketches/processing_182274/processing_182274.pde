
PImage fons1, fons2, fons3;
Boto b1, b2, b3, b4;
int pantalla=1;
 
void setup(){
  size(250, 250);
  fons1 = loadImage("1.jpg");
  fons2 = loadImage("2.jpg");
  fons3 = loadImage("3.jpg");
  textSize(5);
  b1 = new Boto();
  b2 = new Boto(20, 1, color(240,0,0), 40, 25, 2, 1, "volver");
  b3 = new Boto(155, 1, color(0,0,200), 50, 25, 2, 3, "siguiente");
  b4 = new Boto(160, 20, color(0,0,200), 70, 30, 3, 1,"volver");
 
}
void draw(){
  background(100);
  switch(pantalla){
    case 1: mario();break;
    case 2: amigo();break;
    case 3: juego();break;
     
  }
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
  b3.apreta();
  b4.apreta();
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
    xPos = (100);
    yPos = (100);
    c = color(0,0,100);
    widthB = 40;
    heightB = 25;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    texte = "ir";
  }
 
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fonBoto = createFont("Georgia", 10);
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
    textSize(10);
  }
   
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }
 
}
void mario(){
  image(fons1, 0, 0);
  b1.dibuixa();
}
void amigo(){
  image(fons2, 0, 0);
  b2.dibuixa();
  b3.dibuixa();
}
void juego(){
  background(255);
  image(fons3, 0, 0);
  b4.dibuixa();
 
}


