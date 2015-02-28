
/*
Datenvisualisierung Verschwendung von Lebensmitteln
8.7.12

Autor: Doro Schwartzmann & Julia Längert
Dozent: Steffen Klaue
Modul: Creative Coding HTW Berlin - SoSe 2012

Diese Visualisierung zeigt die prozentualen Verluste der Lebensmittel und Abfälle,
die für den menschlichen Verzehr produziert wurden.

Hierbei werden Daten ausgewiesen, die zeigen wir unterschiedliche Lebensmittel in der Produktionskette weggeworfen
werden und wieviel am Ende zum Verzehr noch übrig bleibt.
Die einzelnen Daten kann man mithilfe einer Weltkarte und Ringdiagrammen strukturell und thematisch abrufen.
Geht man mit der Maus über einen der Felder im Ringdiagramm,
so erscheinen spezielle Informationen in einer Textebene.

Quellen:  Studie "global food losses" der Initiative "Save Food" 2011
          http://www.save-food.de/
          http://www.save-food.de/doc/Global_Food_Losses.pdf
*/ 



//Bereich für die Definition von Variablen

PImage farbwahlbild, ringwahllatein, ringwahleuropa, ringwahlmittelafrika, ringwahlnordamerika, ringwahlsuedasien, ringwahlinduasia, ringwahlnordafrika;
PFont ueberschrift;
int kreishoehe, textboxstartlinks;
color farbpicker;
color detailPicker;
String[] haupttext;
PFont fliesstext;


void setup() {

  background(255);
  size(1280, 800);
  smooth();

  //lade Font is Fontvariable
  ueberschrift=loadFont("scalacaps35.vlw");

  //variiere Font
  textFont(ueberschrift); 

  //farbwahlbild ist nötig, um über dessen Farbwert die Länder anzuwählen
  farbwahlbild = loadImage("farbwahlbild.jpg");

  // y-Koordinate für die Kreise, die über die leere Grafik gelegt werden
  kreishoehe = 600;

  //Separater Aufruf jeder einzelnen Karte und den zugehörigen Diagrammen. 
  //Jeder Frame wird in eine png Datei gespeichert und dient dann dazu, die Kreissegmente über get() anzuwählen
  drawData("1_karte.png", "Europa.txt", "Europa1.txt", 1, farbwahlbild); 
  saveFrame("data/00.png");
  ringwahleuropa = loadImage("00.png");

  drawData("5_karte.png", "NordAfrika_Asien.txt", "Europa1.txt", 1, farbwahlbild);
  saveFrame("data/01.png");
  ringwahlnordafrika = loadImage("01.png");

  drawData("4_karte.png", "Mittelafrika.txt", "Europa1.txt", 1, farbwahlbild);
  saveFrame("data/02.png");
  ringwahlmittelafrika = loadImage("02.png");

  drawData("2_karte.png", "Nordamerika.txt", "Europa1.txt", 1, farbwahlbild);
  saveFrame("data/03.png");
  ringwahlnordamerika = loadImage("03.png");

  drawData("7_karte.png", "Lateinamerika.txt", "Europa1.txt", 1, farbwahlbild);
  saveFrame("data/04.png");
  ringwahllatein = loadImage("04.png");

  drawData("3_karte.png", "Industrialisierte_Asien.txt", "Europa1.txt", 1, farbwahlbild);
  saveFrame("data/05.png");
  ringwahlinduasia = loadImage("05.png");

  drawData("6_karte.png", "Suedasien.txt", "Europa1.txt", 1, farbwahlbild);
  saveFrame("data/06.png");
  ringwahlsuedasien = loadImage("06.png");

  //Laden der Bestandteile für den Erläuterungstext
  haupttext = loadStrings("Haupttext.txt");
  fliesstext = loadFont("scalaitalic13.vlw");
}

void draw() {
  background(255);
  cursor(HAND);




  fill(255);
  noStroke();
  rectMode(CENTER);
  //Auswahl und halten der Länder, gesteuert über die Farbwerte in Farbwahlbild. 
  //es wird immer nur ein Kanal abgelegt und mit Grenzwerten verglichen.
  color tmpFarbe = farbwahlbild.get(mouseX, mouseY);

  if (mousePressed || red(tmpFarbe) != 255  && red(tmpFarbe) != 0)
    farbpicker = tmpFarbe;

  //Auswahl nach Farbe des Farbwahlbildes. 
  //Es wird die Unterfunktion drawData aufgerufen mit den Parametern für jedes Land, abhängig von der Mausposition

  if (red(farbpicker)<245 && red(farbpicker)>235) {
    drawData("1_karte.png", "Europa.txt", "Europa1.txt", 0, ringwahleuropa);

    detailPicker = get(mouseX, mouseY);
  }
  else
    if (red(farbpicker)<185 && red(farbpicker)>175) {
      drawData("5_karte.png", "NordAfrika_Asien.txt", "Europa1.txt", 0, ringwahlnordafrika);
      detailPicker = get(mouseX, mouseY);
    }
    else
      if (red(farbpicker)<95 && red(farbpicker)>85) {
        drawData("4_karte.png", "Mittelafrika.txt", "Europa1.txt", 0, ringwahlmittelafrika);
        detailPicker = get(mouseX, mouseY);
      }
      else
        if (red(farbpicker)<65 && red(farbpicker)>55) {
          drawData("2_karte.png", "Nordamerika.txt", "Europa1.txt", 0, ringwahlnordamerika);
          detailPicker = get(mouseX, mouseY);
        }
        else
          if (red(farbpicker)<140 && red(farbpicker)>130) {
            drawData("7_karte.png", "Lateinamerika.txt", "Europa1.txt", 0, ringwahllatein);
            detailPicker = get(mouseX, mouseY);
          }
          else
            if (red(farbpicker)<205 && red(farbpicker)>195) {
              drawData("3_karte.png", "Industrialisierte_Asien.txt", "Europa1.txt", 0, ringwahlinduasia);
              detailPicker = get(mouseX, mouseY);
            }
            else
              if (red(farbpicker)<115 && red(farbpicker)>105) {
                drawData("6_karte.png", "Suedasien.txt", "Europa1.txt", 0, ringwahlsuedasien);
                detailPicker = get(mouseX, mouseY);
              }

              else {
                drawData("Welt.png", "blanko.txt", "Europa1.txt", 0, farbwahlbild);
                noFill();   
                int xPos = 140/2+50;
                for (int i = 1; i<=7;i++) {
                  ellipse(xPos, kreishoehe, 140, 140);
                  xPos+=175 ;
                }
              }




  //Setzen der Überschrift
  textFont(ueberschrift);
  textAlign(CENTER);
  text("Global Food Losses", width/2, 50);

  //Setzen des Fließtexts
  int textX = 160;
  int textY = 310;
  int textboxwidth = 220;
  int textboxheight = 350;

  textFont(fliesstext);

  textAlign(LEFT);
  text(haupttext[0], textX, textY, textboxwidth, textboxheight);
  text(haupttext[1], textX, textY+95, textboxwidth, textboxheight);
  text(haupttext[2], textX, textY+170, textboxwidth, textboxheight);
}


