
//Creem les variables
PImage fons1, fons2;
Boto b1, b2;
int pantalla=1;

//Preparem el tamany del sketch i on posarem les nostres imatges
void setup(){
  size(640, 480);
  fons1 = loadImage("1.jpg");
  fons2 = loadImage("2.jpg");
  b1 = new Boto();
  b2 = new Boto(300, 50, color(0,0,0), 200, 30, 2, 1, "Tornar al inici");

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
  b1.apreta();
  b2.apreta();
}




//En aquest arxiu crearem totes las classes que necessitem, per els botons i el clicar-hos
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
    fonBoto = createFont("Georgia", 30);
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
  image(fons1, 0, 0);
  b1.dibuixa();
}
//Pantalla de la muntanya
void montana(){
  image(fons2, 0, 0);
  b2.dibuixa();
}


