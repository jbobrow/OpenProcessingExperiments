
/* @pjs preload="1.jpg, 2.jpg, 3.jpg"; 
 */

PImage fons1, fons2, fons3;
Boto b1, b2, b3, b4;
int pantalla=1;

void setup(){
  size(240, 130);
  fons1 = loadImage("1.jpg");
  fons2 = loadImage("2.jpg");
  fons3 = loadImage("3.jpg");
  textSize(5);
  b1 = new Boto();
  b2 = new Boto(95, 10, color(240,0,0), 40, 25, 2, 1, "Snif!");
  b3 = new Boto(95, 50, color(0,0,200), 50, 25, 2, 3, "Salut");
  b4 = new Boto(160, 20, color(0,0,200), 70, 30, 3, 1,"tornar");

}
void draw(){
  background(100);
  switch(pantalla){
    case 1: ulldret();break;
    case 2: ullesquerra();break;
    case 3: salut();break;
    
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
    texte = "Snif!";
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
void ulldret(){
  image(fons1, 0, 0);
  b1.dibuixa();
}
void ullesquerra(){
  image(fons2, 0, 0);
  b2.dibuixa();
  b3.dibuixa();
}
void salut(){
  background(255);
  image(fons3, 0, 0);
  textSize(20);
  fill(125,0,123);
  text("AAAAACHUUUUS!!!", 10,120);
  b4.dibuixa();

}


