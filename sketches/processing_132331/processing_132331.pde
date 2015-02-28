
/* Variabelen */
RegenDruppel bewegen;
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
int sleutel = 100;
float snelheid = 0;
float snelheidOnthouden = 0;
float xOnthouden = 0;
float yOnthouden = 0;
int level = 0;
int levelonthouden = 0;
int punten;
boolean tellen = false;
boolean pause = false;
boolean begonnen = false;

/* Setup functie; laad de plaatjes & maak object aan */
void setup() {
  size(500,500);
  //Object aanmaken
  bewegen = new RegenDruppel(100,-50,snelheid);
  //Plaatjes laden
  img = loadImage("regenton.png");
  img2 = loadImage("regendrup.png");
  img3 = loadImage("landschap1.jpg");
  img4 = loadImage("button1.png");
  img5 = loadImage("button2.png");
  img6 = loadImage("button3.png");
  img7 = loadImage("button4.png");
  img8 = loadImage("beginmenu.png");
}

/* Draw functie; roep functies aan die constant
aangeroepen moeten worden */
void draw() {
  //Achterplaatje tekenen
  image(img3, 0, 0, width, height);
  tekenTekst();
  regenTon();
  if(begonnen == false) {
  beginScherm();
  }
  bewegen.updateRegenDruppel();
  bewegen.tekenRegenDruppel();
}

/* Dit is een aanvulling! */
void beginScherm() {
  image(img8, 50, 100);
}

/* Dit is een aanvulling! */
/* tekenTekst functie; tekenen van het level
en de highscore in de linkerboven hoek */
void tekenTekst() {
  String s = "Level: "+ level;
  fill(50);
  text(s, 10, 10, 80, 80); 
  String u = "Highscore: "+ levelonthouden;
  fill(50);
  text(u, 10, 30, 80, 80); 
}

/* regenTon functie; de regenton tekenen met controle
voor als een druppel de ton raakt */
void regenTon() {
  //X druppel met X ton vergelijken en Y druppel met Y ton vergelijken
  //Zit een marge van 35 bij de Y omdat draw niet snel genoeg
  //wordt aangeroepen waardoor het druppeltje soms niet als
  //aangeraakt aangegeven wordt.
  if((sleutel == bewegen.x) && (bewegen.y>335 && bewegen.y<370)) {
    if(tellen == false) {
    tellen = true;
    punten++;
    } else if(tellen == true) {
      tellen = false;
    }
    /* Dit is een aanvulling! */
    //Om de 5 punten level up en snelheid omhoog
    if(punten == 5) {
      punten = 0;
      snelheid += 0.5;
      level++;
    }
    //Laat regendruppel willekeurig op 1 van de 4 plaatsen vallen
    if(int(random(0,3)) == 0) {
      tellen = false;
      bewegen = new RegenDruppel(100,0,snelheid);
    }
    if(int(random(0,3)) == 1) {
      tellen = false;
      bewegen = new RegenDruppel(200,0,snelheid);
    }
    if(int(random(0,3)) == 2) {
      tellen = false;
      bewegen = new RegenDruppel(300,0,snelheid);
    }
    if(int(random(0,3)) == 3) {
      tellen = false;
      bewegen = new RegenDruppel(400,0,snelheid);
    }
  } else if(bewegen.y > 450) {
    //Als een druppel niet wordt opgevangen
    punten = 0;
    snelheid = 3;
    if(level > levelonthouden) {
    levelonthouden = level;
    }
    level = 0;
    //Laat regendruppel willekeurig op 1 van de 4 plaatsen vallen
    //na dat een druppel niet wordt opgevangen
    if(int(random(0,3)) == 0) {
      bewegen = new RegenDruppel(100,0,snelheid);
    }
    if(int(random(0,3)) == 1) {
      bewegen = new RegenDruppel(200,0,snelheid);
    }
    if(int(random(0,3)) == 2) {
      bewegen = new RegenDruppel(300,0,snelheid);
    }
    if(int(random(0,3)) == 3) {
      bewegen = new RegenDruppel(400,0,snelheid);
    }
  }
  image(img, sleutel-37, 300);
}  

/* keyPressed functie; zorgt ervoor dat een actie
wordt ondernomen als een bepaalde toets wordt ingedrukt */
void keyPressed()
{
  if(pause == false && begonnen == true) {
  //Verplaats ton naar x = 100
  if(key == '1') {
    sleutel = 100;
  } else
  //Verplaats ton naar x = 200
  if(key == '2') {
    sleutel = 200;
  } else
  //Verplaats ton naar x = 300
  if(key == '3') {
    sleutel = 300;
  } else
  //Verplaats ton naar x = 400
  if(key == '4') {
    sleutel = 400;
  }
  }
  /* Dit is een aanvulling! */
  if(key == 's') {
    //Start spel bij het beginscherm
    if(snelheid == 0 && begonnen == false) {
    pause = false;
    snelheid = 3;
    bewegen = new RegenDruppel(bewegen.x,bewegen.y,snelheid);
    begonnen = true;
    //Start spel na een pauze
    } else if(pause == true) {
    snelheid = snelheidOnthouden;
    bewegen.x = xOnthouden;
    bewegen.y = yOnthouden;
    bewegen = new RegenDruppel(bewegen.x,bewegen.y,snelheid);
    pause = false;
    begonnen = true;
    }
  }
  /* Dit is een aanvulling! */
  if(key == 'p') {
    //Pauzeer spel
    if(pause == false && begonnen == true) {
    begonnen = false;
    snelheidOnthouden = snelheid;
    xOnthouden = bewegen.x;
    yOnthouden = bewegen.y;
    bewegen = new RegenDruppel(-50,0,0);
    beginScherm();
    pause = true;
    }
  }
}
/* De RegenDruppel class */
class RegenDruppel {
  float x;
  float y;
  float snelheid;
  
  RegenDruppel(float tempX, float tempY, float tempSnelheid) {
    x = tempX;
    y = tempY;
    snelheid = tempSnelheid;
  }
  
  /* updateRegenDruppel functie; geef een regendruppel een snelheid */
  void updateRegenDruppel(){
    y = y+snelheid;
  }
  
  /* tekenRegenDruppel functie; teken een regendruppel */
  void tekenRegenDruppel() {
  image(img2, x, y);
  }
}


