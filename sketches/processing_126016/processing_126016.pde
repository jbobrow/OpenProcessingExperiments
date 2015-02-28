
PImage fons,ok,risa;
Boto b1, b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14;
int pantalla=1;
boolean contar=false;
Temps cronometre;
void setup(){
  size(600, 600);
  fons= loadImage("hunter.jpg");
  ok= loadImage("well_done.jpg");
  risa= loadImage("risa.png");
  b1 = new Boto(width/2-100, height/3*2-50, color(0,0,255), 200, 50, 1, 3, "Començar");
  b2 = new Boto(width/2-40, height/3*2-50, color(0,0,255), 80, 50, 2, 1, "Inici");
    //pregunta 1
    b3 = new Boto(150, 400, color(0,0,255), 30, 30, 3, 4, "A");
    b4 = new Boto(300, 400, color(0,0,255), 30, 30, 3, 2, "B");
    b5 = new Boto(450, 400, color(0,0,255), 30, 30, 3, 2, "C");
    //pregunta 2
    b6 = new Boto(150, 450, color(0,0,255), 30, 30, 4, 2, "A");
    b7 = new Boto(300, 450, color(0,0,255), 30, 30, 4, 2, "B");
    b8 = new Boto(450, 450, color(0,0,255), 30, 30, 4, 5, "C");
    //pregunta 3
    b9 = new Boto(150, 400, color(0,0,255), 30, 30, 5, 2, "A");
    b10 = new Boto(300, 400, color(0,0,255), 30, 30, 5, 2, "B");
    b11 = new Boto(450, 400, color(0,0,255), 30, 30, 5, 6, "C");
    //pregunta 4
    b12 = new Boto(150, 450, color(0,0,255), 30, 30, 6, 2, "A");
    b13 = new Boto(300, 450, color(0,0,255), 30, 30, 6, 3, "B");
    b14 = new Boto(450, 450, color(0,0,255), 30, 30, 6, 7, "C");
  cronometre = new Temps();
  
}
void draw(){
  switch(pantalla){
    case 1: inici();break;
    case 2: gameover();break;
    case 3: pregunta1();break;
    case 4: pregunta2();break;
    case 5: pregunta3();break;
    case 6: pregunta4();break;
    case 7: final2();break;
  }
  println(mouseX+" "+mouseY);
}
void mousePressed(){
  b1.apretaCrono();
  b2.apretaCrono();
  b3.apreta();
  b4.apreta();
  b5.apreta();
  b6.apreta();
  b7.apreta();
  b8.apreta();
  b9.apreta();
  b10.apreta();
  b11.apreta();
  b12.apreta();
  b13.apreta();
  b14.apreta();
}




//clases de botons i temps
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
  void apretaCrono(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
      cronometre.reiniciaEnrera(121);
    }
  }
  

}
//temps
class Temps{
  int principi;
  int enrera;
  Temps(){
    
    principi = millis();
    enrera = 121000 + principi;
    
    
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
    text(minuts()+":"+segons(), width-100, 240);
  }
  void dibuixaComptaEnrere(){
    fill(0);
    text(minutsEnrera()+":"+segonsEnrera(), width-100, 300);
     if(minutsEnrera() == 0 && segonsEnrera() == 0){
       pantalla=2;
     }
  }
  void reinicia(){
    principi = millis();
  }
 
  
}
void final2(){
  image(fons,0,0);
}
void inici(){
  background(#F5D0A9);
  fill(#CC2EFA);
  textSize(15);
  text("Benvingut al Test de Programació",100,100);
  text("Te'ns 2 minuts per contestar totes les preguntes.",width/2-100,280);  
  if(mousePressed==true&&mouseX>=200&&mouseX<=400&&mouseY>=350&&mouseY<=400){
   contar=true; 
  }
  b1.dibuixa();
}
void gameover(){
  background(#F5D0A9);
  fill(#CC2EFA);
  textSize(15);
  text("ENHORABONA TE'NS VACANCES PEL QUE RESTA DE L'ANY",100,100);
  image(risa,width/2-100,200);
  text("DIU L'ISAAC QUE NO FA FALTA QUE VINGUIS MÉS A CLASSE.",100,150);
  b2.dibuixa();
}
void pregunta1(){
  background(#F5D0A9);
  fill(#CC2EFA);
  textSize(40);
  text("Pregunta 1",width/2-60,50);
  textSize(20);
  text("La programació es pot definir com...",50,100);
    text("A) el pròces de disenyar,codificar i mantenir un codic",75,150);
    text("font de programes d'ordinador",100,175);
    text("B) l'execució de programes de l'ordinador des de la",75,200);
    text("linea d'instruccions",100,225);
    text("C) l'instal·lació de programes de sistemes operatius.",75,250);
  cronometre.dibuixaComptaEnrere();
 
  b3.dibuixa();
  b4.dibuixa();
  b5.dibuixa();
}
void pregunta2(){
  background(#F5D0A9);
  fill(#CC2EFA);
  textSize(40);
  text("Pregunta 2",width/2-60,50);
  textSize(20);
  text("Què és una cadena?",50,100);
    text("A) És un metode abstracte.",75,150);
    text("B) És una classe que no pot ser instancada.",75,200);
    text("C) Sequencia de caràcters delimitats entre dobles comilles.",75,250);
  cronometre.dibuixaComptaEnrere();
 
  b6.dibuixa();
  b7.dibuixa();
  b8.dibuixa();
}
void pregunta3(){
  background(#F5D0A9);
  fill(#CC2EFA);
  textSize(40);
  text("Pregunta 3",width/2-60,50);
  textSize(20);
  text("Com és fan els comentaris en Java?",50,100);
    text("A) <<>>",75,150);
    text("B) <--!..-->",75,200);
    text("C) /*...*/",75,250);
  cronometre.dibuixaComptaEnrere();
 
  b9.dibuixa();
  b10.dibuixa();
  b11.dibuixa();
}
void pregunta4(){
  background(#F5D0A9);
  fill(#CC2EFA);
  textSize(40);
  text("Pregunta 4",width/2-60,50);
  textSize(20);
  text("Quin metode calcula el número de longitud d'un objeta cadena?",50,100);
    text("A) CompareTo",75,150);
    text("B) LastIndexOf",75,200);
    text("C) Length",75,250);
  cronometre.dibuixaComptaEnrere();
 
  b12.dibuixa();
  b13.dibuixa();
  b14.dibuixa();
}


