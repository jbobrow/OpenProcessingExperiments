
//Variablen deklarieren
PFont myFont;
String textLaden[];
String textAlles;
String textEinzeln[];
Sucher textSucher[];
int zaehler=0;
int zaehler2=0;

int yverschiebung=0;
int xverschiebung=0;



int abstand = 100;

//sucher klasse anlegen
class Sucher implements Comparable {
  String wort;
  int anzahl;
  Sucher(String tempWort, int tempAnzahl) {
    wort=tempWort;
    anzahl=tempAnzahl;
  }

  int compareTo(Object otherObject) {
    Sucher otherSucher=(Sucher)otherObject;
    return otherSucher.anzahl-anzahl;
  }
}

//kreiszeichnen funktion
void kreiszeichnen(String para1, int para2) {

  float zufallX = random(width);
  float zufallY = random(height);

  if (zaehler2<60) {

    //positionieren
    if (  xverschiebung>=10) {
      xverschiebung=0;
      yverschiebung=yverschiebung+100;
    }
    fill(0, 255, 255, 50);
    stroke(0, 255, 255);
    ellipse(xverschiebung*abstand+50, yverschiebung+50, para2/10, para2/10);
    //rect(zaehler2*abstand+50, height/2 , 50, para2);
    fill(255);
    text(para1+"\n"+para2+" mal", xverschiebung*abstand+50, yverschiebung+100);
    zaehler2++;
    xverschiebung++;
  }
}

void setup() {


  myFont=loadFont("Verdana-12.vlw");
  textFont(myFont);
  textAlign(CENTER);

  size(1024, 640);
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




  //doppelte kennzeichnen
  for (int i=0;i<textSucher.length;i++) {
    for (int j=0;j<textSucher.length;j++) {
      if ((textSucher[i].wort.equals(textSucher[j].wort)==true) && (i!=j)) {
        textSucher[j].wort="doppel";
      }
    }
  }






  textSucher[0].compareTo(textSucher[1]);
  Arrays.sort(textSucher);
  //reverse(textSucher);


  for (int i=0;i<textSucher.length;i++) {
    if ((textSucher[i].wort.equals("doppel")==false) && (textSucher[i].wort.equals("fr")==false)) {
      kreiszeichnen(textSucher[i].wort, textSucher[i].anzahl);
    }
  }
}




