
PImage fons1, fons2, fons3, fons4;
Boto b1, b2, b3, b4;
int pantalla = 1;

void setup() {
  size(350,350);
  fons1 = loadImage("pokemon1.jpg"); 
  fons2 = loadImage("pokemon2.jpg"); 
  fons3 = loadImage("pokemon3.jpg"); 
  fons4 = loadImage("pokemon4.jpg"); 
  b1 = new Boto();
  b2 = new Boto (0,150,color(255,255,255),30,25,2,3);
  b3 = new Boto(30,150,color(255,255,255),30,25,3,4);
  b4 = new Boto(947,3,color(255,255,255),45,25,4,1);
}
void draw(){
  background(100);
  switch(pantalla){
    case 1: desafio();break;
    case 2: combate();break;
    case 3: despues();break;
    case 4: despues2();break;
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
    xPos = 8;
    yPos = 120;
    c = color(255,0,0);
    widthB = 28;
    heightB = 25;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Arial", 10);
    textFont(fonBoto);
    texte = "next";

  }
   Boto(float x, float y, color col, float w, float h, int inici, int fi){
    fonBoto= createFont("Arial", 10);
    textFont(fonBoto);
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    
  }
   
  void dibuixa(){
    fill(255);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(161,143,121);
    
  }
   
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
   }
  }
  void desafio(){
    image(fons1,0,0);
    b1.dibuixa();
  }
  void combate(){
    image(fons2,0,0);
    b2.dibuixa();
  }
  void despues(){
    image(fons3,0,0);
    b3.dibuixa();
  }
  void despues2(){
    image(fons4,0,0);
    b4.dibuixa();
  }
 



  
  
    


