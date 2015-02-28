
PImage fons1, fons2, fons3;
Boto b1, b2, b3, b4;
int pantalla=1;

Temps cronometre;
void setup(){
  size(400, 300);
  
  fons1 = loadImage("bomba.jpg");
  fons2 = loadImage("bum.jpg");
  fons3 = loadImage("victory.jpg");
  
  b1 = new Boto(175, 70, color(255,0,0), 15, 40, 1, 1, "");
  b2 = new Boto(190, 70, color(0,0,0), 15, 40, 1, 2, "");
  b3 = new Boto(205, 70, color(0,0,255), 15, 40, 1, 1, "");
  b4 = new Boto(220, 70, color(0,255,0), 15, 40, 1, 3, "");

  cronometre = new Temps();
}
void draw(){
  background(255);

    switch(pantalla){
    case 1: bomba();break;
    case 2: bum();break;
    case 3: victory();break;
    }
  
   
  if (cronometre.fiEnrera()){
    pantalla = 2;
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
    xPos = width/2;
    yPos = height/2;
    c = color(255,0,0);
    widthB = 50;
    heightB = 25;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    texte = "Boto";
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
    noStroke();
    fill(c, 255);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);
    text (texte, xPos + 10, yPos + 20);
  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
      cronometre.reiniciaEnrera(16);
    }
  }
}
class Temps{
  int principi;
  int enrera;
  PFont foncrono;
  Temps(){
    principi = millis();
    enrera = 60000 + principi;
  }
  
  void reiniciaEnrera(int segons){
    enrera = millis() + segons * 1000;
  }
  int segons(){
    return (int)((millis() - principi)/ 1000)%60;
  }
  int minuts(){
    return (int)((millis() - principi)/ 60000);
  }
  
  int minutsEnrera(){
      int resultat = (int)((enrera-millis())/ 60000); 
      if (resultat < 0){
        resultat = 0;
      }
      return resultat;
  }
  
  int segonsEnrera(){
    int resultat = (int)((enrera-millis())/ 1000)%60;
    if (resultat < 0){
        resultat = 0;
      }
      return resultat; 
   }
  
  boolean fiEnrera(){
    return minutsEnrera() == 0 && segonsEnrera() == 0;
  }
  boolean limitCrono(int seg){
      return minuts()*60 + segons() == seg;
  }
  
  void dibuixaComptaEnrere(){
    fill(255, 0, 0);
    foncrono = createFont("Arial", 30);
    textFont(foncrono);
    text(minutsEnrera()+":"+segonsEnrera(), 175, 180);
  }
  void reinicia(){
    principi = millis();
  }

}

void bomba(){
  image(fons1, 0, 0);
  cronometre.dibuixaComptaEnrere();
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}
void bum(){
  image(fons2, 0, 0);
}
void victory(){
  image(fons3, 0, 0);
}


