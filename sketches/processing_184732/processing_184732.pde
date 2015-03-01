
PImage fons1, fons2, fons3, fons4;
Boto b1, b2, b3, b4;
int pantalla=1;
Temps cronometre;

void setup(){
  size(650, 365);
  fons1 = loadImage("uno.jpg");
  fons2 = loadImage("dos.jpg");
  fons3 = loadImage("tres.jpg");
  fons4 = loadImage("cuatro.jpg");
  
  b1 = new Boto(10, 310, color(0,0,255), 60, 30, 1, 2, "Boto 1");
  b2 = new Boto(90, 310, color(0,0,255), 60, 30, 2, 3, "Boto 2");
  b3 = new Boto(170, 310, color(0,0,255), 60, 30, 3, 4, "Boto 3");
  b4 = new Boto(250, 310, color(0,0,255), 60, 30, 4, 1, "Boto 4");
  
  cronometre = new Temps();
}
void draw(){
  println(mouseX, mouseY);
  background(100);
  cronometre.dibuixaComptaEnrere();
  switch(pantalla){
    case 1: fuego();break;
    case 2: pinguino();break;
    case 3: ardilla();break;
    case 4: estrellas();break;
  }
  if (cronometre.fiEnrera()){
    text("GAME OVER", 200, 170);
  }
  println("Hora:"+hour()+":"+minute()+":"+second()+ " Millis:" + millis() + "principi:"+cronometre.principi);
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
  b3.apreta();
  b4.apreta();
 
}
//clases

class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;

  int pantalla1;
  int pantalla2; 
  int pantalla3;
  int pantalla4;
  PFont fonBoto;
  String texte;
  
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
  
   
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    
    texte = t;
  }
  
  void dibuixa(){
    fill(c, 100);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);
    text (texte, xPos + 10, yPos + 20);
    textSize(15);
  }
  
  void apreta(){
    if ((10 <= mouseX && mouseX <= 10 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = 1;
    }
    if ((90 <= mouseX && mouseX <= 90 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = 2;
    }
    if ((170 <= mouseX && mouseX <= 170 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = 3;
    }
    if ((250 <= mouseX && mouseX <= 250 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = 4;
    }
    
  }

}

class Temps{
  int principi;
  int enrera;
  PFont fonCrono;
  Temps(){
    principi = millis();
    enrera = 6000 + principi;
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
  void dibuixaComptaEnrere(){
    fill(225, 0,0);
    stroke (2);
    rect(535, 23, 100, 50);
    textSize(45);
    fill(0);
    text(minutsEnrera()+":"+segonsEnrera(), 550, 60);
    
  }

  void reinicia(){
    principi = millis();
  }

  
}

//pantallas
void fuego(){
  image(fons1, 0, 0);
  textSize(15);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
  cronometre.dibuixaComptaEnrere();
}
void pinguino(){
  image(fons2, 0, 0);
  textSize(15);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
  cronometre.dibuixaComptaEnrere();
}
void ardilla(){
  image(fons3, 0, 0);
  textSize(15);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
  cronometre.dibuixaComptaEnrere();
}
void estrellas(){
  image(fons4, 0, 0);
  textSize(15);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
  cronometre.dibuixaComptaEnrere();
}


