
/* @pjs preload="logo-desarrollowebcom.png"; */
//Creem les variables
PImage img1, img2;
Boto c1, c2;
int pantalla=1;
 
//Preparem el tamany del sketch i on posarem les nostres imatges
void setup(){
  size(529, 400);
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  c1 = new Boto(20, 350, color(240,0,0), 100, 30, 2, 1, "Ves");
  c2 = new Boto(400, 350, color(0,240,0), 100, 30, 2, 1, "Torna");
 
}
 
//Dibuixarem el fons i el cambi per les pantalles
void draw(){
  background(100);
  switch(pantalla){
    case 1: keyboard();break;
    case 2: montana();break;
  }
}
void mousePressed(){
  c1.apreta();
  c2.apreta();
}
 
 
 
 
//En aquest arxiu crearem totes las classes que necessitem, per els botons i el clicar-hos
class Boto {
  int pantallaActual;
  int pantallaDesti;
  PFont fonBoto;
  String texte;
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
 
   
  Boto(){
    xPos = 100;
    yPos = 350;
    c = color(255,0,0);
    widthB = 230;
    heightB = 30;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    texte = "Següent imatge";
  }
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fonBoto = createFont("Times new roman", 30);
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
//Pantalla del teclat
void keyboard(){
  image(img1, 0, 0);
  c1.dibuixa();
}
//Pantalla de la muntanya
void montana(){
  image(img2, 0, 0);
  c2.dibuixa();
}



