
Temps cronometre;
PImage fons1, fons2,fons3,fons4,fons5;
Boto b1,b2,b3,b4;
int pantalla=1;
void setup(){
  size(640, 450);
  cronometre = new Temps();  //Nuevo objeto
  
  fons1 = loadImage("4.jpg");
  fons2 = loadImage("1.jpg"); 
  fons3 = loadImage("2.jpg");
  fons4 = loadImage("3.jpg");
  fons5 = loadImage("5.jpg");
  
  b1 = new Boto();
  b2 = new Boto(100, 80, color(0,0,255), 60, 30, 2, 3, "2");
  b3 = new Boto(170, 80, color(200,100,255), 60, 30, 3, 4, "3");
  b4 = new Boto(240, 80, color(250,200,255), 60, 30, 4, 1, "4");
  
}
void draw(){
  background(100);
 

  switch(pantalla){
    case 1: sonic1();break;
    case 2: sonic2();break;
    case 3: sonic3();break;
    case 4: sonic4();break;
  }
    cronometre.dibuixaComptaEnrere();
if (cronometre.fiEnrera()){
    image(fons5,0,0);
  }
  

  println("Hora:"+hour()+":"+minute()+":"+second()+ " Millis:" + millis() + "principi:"+cronometre.principi);
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
    xPos = 30;
    yPos = 80;
    c = color(255,0,0);
    widthB = 60;
    heightB = 30;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    texte = "1";
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
class Temps{
  int principi;
  int enrera;
  Temps(){
    principi = millis();
    enrera = 10000 + principi;
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
  
  void dibuixaCronometre(){
    fill(0);
    text(minuts()+":"+segons(), 10, 40);
  }
  void dibuixaComptaEnrere(){
    fill(255,0,0);
    textSize(20);
    text(minutsEnrera()+":"+segonsEnrera(), 560, 20);
  }
  void reinicia(){
    principi = millis();
  }

  
}

void sonic1(){
  image(fons1, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}
void sonic2(){
  image(fons2, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}
void sonic3(){
  image(fons3, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}
void sonic4(){
  image(fons4, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}


