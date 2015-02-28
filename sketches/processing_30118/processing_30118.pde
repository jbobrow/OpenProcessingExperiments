

/**
 
 * Farben aus einem Bild extrahieren und nach Farbpaletten sortieren
 *
 * Tasten drücken      
 * 1-3                 : lädt eine Auswahl unterschiedlicher Bilder
 * 4                   : keine Sortierung
 * 5                   : nach Farbton
 * 6                   : Sättigung
 * 7                   : Helligkeit
 * 8                   : Graustufen (Luminanz)
 * s                   : speichert als png
 * p                   : speichert als pdf
 * c                   : speichert die Farbpalette
 */

import generativedesign.*;
import processing.pdf.*;
boolean savePDF = false;

PImage img;
color[] colors;

String sortMode = null;



void setup() {
  size(489, 650);
  // Definition des Farbraumes (HSB)
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  noCursor();
  img = loadImage("Brand eins_1.jpg");
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, timestamp()+".pdf");
    colorMode(HSB, 360, 100, 100, 100);
    noStroke();
  }

  // Gibt Anzahl und Spalten des Rasters vor
  int tileCount = width / max(100, 5);
  // definiert die größe der Kacheln
  float rectSize = width / float(tileCount);

  // nimmt sich die Farben des Bildes heraus
  int i = 0; 
  colors = new color[tileCount*tileCount];
  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      // Bild wird Zeile für Zeile im vorher definierten Ratserabstand abgetastet und Farbe ausgelesen
      // und ins Array [] geschrieben
      int px = (int) (gridX * rectSize);
      int py = (int) (gridY * rectSize);
      colors[i] = img.get(px, py);
      i++;
    }
  }

  // sortiert die Farben durch Moduswahl
  if (sortMode != null) colors = GenerativeDesign.sortColors(this, colors, sortMode);


  // zeichnet das Raster
  i = 0;
  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
  // Einfärbung der raster nach Ergebniswerten
      fill(colors[i]);
      rect(gridX*rectSize, gridY*rectSize, rectSize, rectSize);
      i++;
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

// Speicherformate
void keyReleased() {
  if (key=='c' || key=='C') GenerativeDesign.saveASE(this, colors, timestamp()+".ase");
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
  if (key=='p' || key=='P') savePDF = true;
// Abfrage der Bildquelle durch Tastebestimmung
  if (key == '1') img = loadImage("Brand eins_1.jpg");
  if (key == '2') img = loadImage("Brand eins_2.jpg"); 
  if (key == '3') img = loadImage("Brand eins_3.jpg"); 
// Abfrage der Sortierungsart durch Tastebestimmung
  if (key == '4') sortMode = null;
  if (key == '5') sortMode = GenerativeDesign.HUE;
  if (key == '6') sortMode = GenerativeDesign.SATURATION;
  if (key == '7') sortMode = GenerativeDesign.BRIGHTNESS;
  if (key == '8') sortMode = GenerativeDesign.GRAYSCALE;
}


// timestamp ??
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}












