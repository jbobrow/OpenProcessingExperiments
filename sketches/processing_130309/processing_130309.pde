
Teclat entrada;
Boto begin, model, to;
int selector = 1;
PFont estil = createFont("Agency FB",30);
boolean keyboard = false;
boolean touch = false;
boolean classic = false;
boolean blanc = true;
boolean negre = false;
boolean plata = false;
boolean vermell = false;
boolean blau = false;
boolean verd = false;
boolean groc = false;

void setup(){
  size(400,600);
  entrada = new Teclat();
  begin = new Boto();
  model = new Boto(140,500,105,30,color(#FF0000),color(#00FF00),"CONTINUA",2,3);
  to = new Boto(140,500,105,30,color(#FF00FF),color(#FFFF00),"CONTINUA",3,4);
}

void draw(){
  switch (selector) {
    case 1: inici();break;
    case 2: mobil();break;
    case 3: tonalitat();break;
    case 4: autor();break;
    case 5: resultat();break;
  }
  //Selecció de color
  stroke(0);
  strokeWeight(4);
  if (blanc) {
    fill(255);
  }
  else if (negre) {
    fill(0);
  }
  else if (plata) {
    fill(180);
  }
  else if (vermell) {
    fill(#FF0000);
  }
  else if (blau) {
    fill(#0000FF);
  }
  else if (verd) {
    fill(#00FF00);
  }
  else if (groc) {
    fill(#FFFF00);
  }
  //Dibuix del model keyboard
  if (keyboard == true) {
    rect(60,200,120,180,10);
    rect(220,200,120,180,10);
    fill(80);
    rect(70,210,100,60);
    fill(210);
    strokeWeight(2);
    rect(70,280,100,20);
    line(110,280,110,299);
    line(130,280,130,299);
    int iniciX = 71;
    int iniciY = 310;
    int separa = 14;
    for (int j = 0; j < 4; j++) {
      for (int i = 0; i < 7; i++) {
        rect(iniciX,iniciY,separa,separa);
        iniciX = iniciX + separa;
      }
      iniciX = 71;
      iniciY = iniciY + separa;
    }
    rect(265,230,30,30,4);
    fill(#BABAFF);
    rect(270,235,21,21);
    fill(#8585BD);
    ellipse(280,245,16,16);
  }
  //Dibuix del model touch
  if (touch == true) {
    rect(100,200,80,150,15);
    bezier(101,330,101,380,180,380,180,330);
    rect(220,200,80,150,15);
    bezier(221,330,221,380,300,380,300,330);
    fill(80);
    rect(110,210,60,120);
    fill(210);
    strokeWeight(2);
    ellipse(140,353,15,15);
    triangle(110,338,136,338,120,353);
    triangle(144,338,170,338,160,353);
    rect(247,215,26,40);
    fill(#8585BD);
    ellipse(260,228,20,20);
    fill(#CCCC00);
    ellipse(260,246,10,10);
  }
  //Dibuix del model classic
  if (classic == true) {
    rect(92,230,88,112,10);
    bezier(93,330,93,365,180,365,180,330);
    rect(220,230,88,112,10);
    bezier(221,330,221,365,308,365,308,330);
    fill(0);
    rect(150,208,18,22);
    rect(232,208,18,22);
    bezier(151,208,151,200,168,200,168,208);
    bezier(233,208,233,200,250,200,250,208);
    fill(#8585BD);
    strokeWeight(2);
    ellipse(264,250,15,15);
  }
}


void keyReleased() {
  if (keyCode == ENTER || keyCode == RETURN) {
      entrada.comprovaModel();
      entrada.comprovaColor();
  }
  if (keyCode == BACKSPACE || keyCode == DELETE) {
      entrada.borrar();
  }
  else if (key != CODED){
    if (entrada.dades.length() < entrada.maxim) {
      entrada.afegeix(key);
    }
  }
}

void mousePressed() {
  begin.click();
  model.click();
  to.click();
}
class Teclat {
  String dades;
  float posX;
  float posY;
  int maxim;
 
  Teclat() {
    dades = "";
    posX = 142;
    posY = 450;
    maxim = 8;
  }
  
  Teclat(String dadess, float x, float y, int max) {
    dades = dadess; 
    posX = x;
    posY = y;
    maxim = max;
  }
  
  void dibuixa() {
    stroke (0);
    fill(255);
    rect (posX, posY, 100, 25);
    fill(0);
    textSize(18);
    text (dades+(frameCount/25 % 2 == 0 ? "_" : ""), posX + 10, posY + 20);
  }
  void borrar() { 
    dades = dades.substring(0,max(0,dades.length()-1));
  }
  
  void afegeix(char key) {
    dades = dades.concat(new String(key));
  }
  
  void comprovaModel() {
    if (dades == "keyboard") {
      keyboard = true;
      touch = false;
      classic = false;
    }
    else if (dades == "touch") {
      keyboard = false;
      touch = true;
      classic = false;
    }
    else if (dades == "classic") {
      keyboard = false;
      touch = false;
      classic = true;
    }
  }
  void comprovaColor() {
    if (dades == "blanc") {
      blanc = true;
      negre = false;
      plata = false;
      vermell = false;
      blau = false;
      verd = false;
      groc = false;
    }
    else if (dades == "negre") {
      blanc = false;
      negre = true;
      plata = false;
      vermell = false;
      blau = false;
      verd = false;
      groc = false;
    }
    else if (dades == "plata") {
      blanc = false;
      negre = false;
      plata = true;
      vermell = false;
      blau = false;
      verd = false;
      groc = false;
    }
    else if (dades == "vermell") {
      blanc = false;
      negre = false;
      plata = false;
      vermell = true;
      blau = false;
      verd = false;
      groc = false;
    }
    else if (dades == "blau") {
      blanc = false;
      negre = false;
      plata = false;
      vermell = false;
      blau = true;
      verd = false;
      groc = false;
    }
    else if (dades == "verd") {
      blanc = false;
      negre = false;
      plata = false;
      vermell = false;
      blau = false;
      verd = true;
      groc = false;
    }
    else if (dades == "groc") {
      blanc = false;
      negre = false;
      plata = false;
      vermell = false;
      blau = false;
      verd = false;
      groc = true;
    }
  }
}

class Boto {
  float x;
  float y;
  int llarg;
  int alt;
  color margeText;
  color fons;
  String nom;
  int pantAra;
  int pantSeg;
  
  Boto() {
    x = 150;
    y = 400;
    llarg = 100;
    alt = 30;
    margeText = color(#0000FF);
    fons = color(#FFFF00);
    nom = "COMENÇA";
    pantAra = 1;
    pantSeg = 2;
  }
  Boto(float xx, float yy, int llarg1, int alt1, color mar, color fonss, String nom1, int pantAra1, int pantSeg1) {
    x = xx;
    y = yy;
    llarg = llarg1;
    alt = alt1;
    margeText = mar;
    fons = fonss;
    nom = nom1;
    pantAra = pantAra1;
    pantSeg = pantSeg1;
  }
  void dibuixa() {
    stroke(margeText);
    strokeWeight(4);
    fill(fons);
    rect(x,y,llarg,alt,5);
    fill(margeText);
    textSize(18);
    text(nom,x + 6,y + 22);
  }
  void click() {
    if ((mouseX >= x && mouseX <= x + llarg) && (mouseY >= y && mouseY <= y + alt) && selector == pantAra) {
      selector = pantSeg;
    }
  }
}

//Pantalla d'inici
void inici() {
  background(#FF0000);
  textFont(estil);
  textSize(40);
  fill(#0000FF);
  text("PERSONALITZA",50,105);
  text("EL TEU MÒBIL",68,160);
  begin.dibuixa();
}

//Pantalla d'elecció del model de mòbil
void mobil() {
  background(#FFFF00);
  textFont(estil);
  textSize(25);
  fill(#FF0000);
  text("ESCULL UN MODEL",80,60);
  strokeWeight(4);
  fill(200);
  rect(20,80,360,80);
  fill(0);
  textSize(12);
  text("Models disponibles:",25,125);
  //Model keyboard
  stroke(0);
  rect(160,90,30,45);
  text("keyboard",150,150);
  //Model touch
  rect(260,90,20,38,5);
  bezier(261,125,261,138,280,138,280,125);
  text("touch",255,150);
  //Model classic
  rect(340,100,22,28,3);
  bezier(341,128,341,140,362,140,362,128);
  rect(354,86,4,18,2);
  text("classic",332,150);
  entrada.dibuixa();
  model.dibuixa();
}

void tonalitat() {
  background(#FF8800);
  textSize(25);
  fill(#FF00FF);
  text("ESCULL UN COLOR",80,60);
  strokeWeight(4);
  fill(200);
  rect(20,80,360,80);
  fill(0);
  textSize(12);
  text("Colors disponibles:",25,125);
  entrada.dibuixa();
  to.dibuixa();
}

void autor() {
}

void resultat() {
}


