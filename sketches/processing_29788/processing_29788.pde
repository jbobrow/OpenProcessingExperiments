
//Variablen deklarieren
PFont myFont;
String textLaden[];
String textAlles;
String textEinzeln[];
Sucher textSucher[];
int zaehler=0;
int zaehler2=0;

int abstand = 50;

float maxanzahl=0;
float verhaeltnis=0;



//sucher klasse anlegen
class Sucher {
  String wort;
  int anzahl;
  Sucher(String tempWort, int tempAnzahl) {
    wort=tempWort;
    anzahl=tempAnzahl;
  }
}

//kreiszeichnen funktion
void kreiszeichnen(String para1, int para2) {


  float zufallY = random(height);
  fill(255, para2);
  text(para1+"\n"+para2, para2*verhaeltnis, zufallY+12);
  zaehler2++;
}


//String in einzelne Wörter aufteilen und Satzzeichen etc entfernen
void setup() {


  myFont=loadFont("Verdana-12.vlw");
  textFont(myFont);
  textAlign(CENTER);

  size(1024, 768);
  background(0);
  noStroke();
  smooth();

  rectMode(CENTER);

  //text einladen
  textLaden = loadStrings("Sido1.txt");

  //text aus array in normalen string
  textAlles = join(textLaden, "");


  //text in die einzelnen wörter splitten und sonderzeichen etc entfernen
  textEinzeln = splitTokens(textAlles, " .,!?:");

  //sucher-objekte erstellen
  textSucher = new Sucher[textEinzeln.length];
  for (int i=0;i<textEinzeln.length;i++) {
    textSucher[i]= new Sucher(textEinzeln[i].toLowerCase(), 0);
  }



  //vorkommen zaehlen
  for (int i=0;i<textSucher.length;i++) {
    for (int j=0;j<textSucher.length;j++) {

      if (textSucher[i].wort.equals(textSucher[j].wort)==true) {
        textSucher[i].anzahl++;
      }
    }
  }





  for (int i=0;i<textSucher.length;i++) {
    for (int j=0;j<textSucher.length;j++) {
      if ((textSucher[i].wort.equals(textSucher[j].wort)==true) && (i!=j)) {
        textSucher[j].wort="doppel";
      }
    }
  }




  //verhaeltnis zwischen häuftigsten word und width herstellen
  for (int i=0;i<textSucher.length;i++) {
    if ((textSucher[i].wort.equals("doppel")==false) && (textSucher[i].wort.equals("fr")==false)) {

      if (textSucher[i].anzahl>maxanzahl) {
        maxanzahl=textSucher[i].anzahl;
        verhaeltnis=0.01+((width-100)/maxanzahl);
      }
    }
  }



  for (int i=0;i<textSucher.length;i++) {
    if ((textSucher[i].wort.equals("doppel")==false) && (textSucher[i].wort.equals("fr")==false)) {
      kreiszeichnen(textSucher[i].wort, textSucher[i].anzahl);
    }
  }
}






