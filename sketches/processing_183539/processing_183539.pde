
PImage fondo1, fondo2, fondo3, fondo4, fondo5;
Boto b1, b2, b3, b4;
int pantalla=1;
Temps cronometre;

void setup() {
  size(800, 600);
  fondo1 = loadImage("pantalla1.jpg");
  fondo2 = loadImage("pantalla2.jpg");
  fondo3 = loadImage("pantalla3.jpg");
  fondo4 = loadImage("pantalla4.jpg");
  fondo5 = loadImage("pantalla_final.jpg");

  b1 = new Boto(180, 1, "1");
  b2 = new Boto(220, 2, "2");
  b3 = new Boto(260, 3, "3");
  b4 = new Boto(300, 4, "4");
  
  cronometre = new Temps();
}
void draw() {
  
  switch(pantalla) {
    case 1: 
      fase1();
      break;
    case 2: 
      fase2();
      break;
    case 3: 
      fase3();
      break;
    case 4: 
      fase4();
      break;
   }
   
  cronometre.dibuixaComptaEnrere();
  if (cronometre.fiEnrera()){
    //IMAGEN GAME OVER
    image(fondo5, 0, 0);
    //si pongo "fondo5();" no funciona en JS. fondo5 es el método que se encarga poner el fondo de GAME OVER.
  }
}
void mousePressed() {
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
  String texte;

  //BOTÓN 1
  Boto(float x, int inici, String t) {
    xPos = x;
    yPos = 560;
    c = color(255, 0, 0);
    widthB = 25;
    heightB = 30;
    pantallaActual = inici;
    texte = t;
  }
  void dibuja(int borde) {
    strokeWeight(4);
    stroke(borde);
    fill(c, 162, 123);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);
    text(texte, xPos + 10, yPos + 20);
  }

  void apreta() {
    if ((180 <= mouseX && mouseX <= 180 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)) {
      pantalla = 1;
    }
    if ((220 <= mouseX && mouseX <= 220 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)) {
      pantalla = 2;
    }
    if ((260 <= mouseX && mouseX <= 260 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)) {
      pantalla = 3;
    }
    if ((300 <= mouseX && mouseX <= 300 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)) {
      pantalla = 4;
    }
  }
}
class Temps {
  int principi;
  int enrera;
  PFont crono;
  
  Temps() {
    principi = millis();
    enrera = 6000 + principi;// 6000 = 6s, el temporizador se muestra desde el segundo 5.
  }

  void reiniciaEnrera(int segons) {
    enrera = millis() + segons * 1000;
  }
  int segons() {
    return (int)((millis() - principi)/ 1000)%60;
  }
  int minuts() {
    return (int)((millis() - principi)/ 60000);
  }

  int minutsEnrera() {
    int resultat = (int)((enrera-millis())/ 60000); 
    if (resultat < 0) {
      resultat = 0;
    }
    return resultat;
  }

  int segonsEnrera() {
    int resultat = (int)((enrera-millis())/ 1000)%60;
    if (resultat < 0) {
      resultat = 0;
    }
    return resultat;
  }

  boolean fiEnrera() {
    return minutsEnrera() == 0 && segonsEnrera() == 0;
  }
  
  void dibuixaComptaEnrere() {
    crono = createFont("Times New Roman", 55);
    textFont(crono);
    fill(0);
    text("00:"+minutsEnrera()+segonsEnrera(), 650, 100);
  }
  void reinicia() {
    principi = millis();
  }
}


void fase1() {
  image(fondo1, 0, 0);
  PFont fonBoto;
  
  fonBoto = createFont("Arial", 12);
  textFont(fonBoto);
  
  b1.dibuja(color(255, 0, 0));
  b2.dibuja(color(0, 0, 0));
  b3.dibuja(color(0, 0, 0));
  b4.dibuja(color(0, 0, 0));
}

void fase2() {
  image(fondo2, 0, 0);
  PFont fonBoto;
  
  fonBoto = createFont("Arial", 12);
  textFont(fonBoto);
  
  b1.dibuja(color(0, 0, 0));
  b2.dibuja(color(255, 0, 0));
  b3.dibuja(color(0, 0, 0));
  b4.dibuja(color(0, 0, 0));
}

void fase3() {
  image(fondo3, 0, 0);
  PFont fonBoto;
  
  fonBoto = createFont("Arial", 12);
  textFont(fonBoto);
  
  b1.dibuja(color(0, 0, 0));
  b2.dibuja(color(0, 0, 0));
  b3.dibuja(color(255, 0, 0));
  b4.dibuja(color(0, 0, 0));
}

void fase4() {
  image(fondo4, 0, 0);
  PFont fonBoto;
  
  fonBoto = createFont("Arial", 12);
  textFont(fonBoto);
  
  b1.dibuja(color(0, 0, 0));
  b2.dibuja(color(0, 0, 0));
  b3.dibuja(color(0, 0, 0));
  b4.dibuja(color(255, 0, 0));
}

void fondo5() {
  image(fondo5, 0, 0);
}


