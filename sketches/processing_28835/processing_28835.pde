
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import processing.pdf.*;

// globale Steuerungsvariable, in jeder Funktion sichtbar
RFont font; // Schriftart
RGroup grp; // Gruppe
RPoint[] pnts; // Liste von Koordinaten

// Dimensionen der Schrift
int fontSize = 200;
float lineSpacing = fontSize*1.5;
float letterX = 50; // wo Text anfängt
float letterY = lineSpacing; // wo Text anfängt
float textW = 0;
float textH = 0;

// Verzerrung
float danceFactor = 1; // Verzerrungsfaktor
float stepSize = 1;

// Tastaturabfragen
String typedString = "fine art.";

void setup() {

  size(900,600);
  frame.setResizable(true);  
  smooth();
  
// ab > 26 flüssig
  frameRate(30);
  
  RG.init(this);
  
  // eine schriftart in variable speichern
  font = new RFont("Times New Roman.ttf", fontSize, RFont.LEFT);
  font.setSize(fontSize);
  
  RCommand.setSegmentLength(50);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  
  grp = font.toGroup(typedString);
  textW = grp.getWidth();
  textH = grp.getHeight();
  pnts = grp.getPoints(); 
  
  background(255);

}


void draw() {
  
  // Einstellungen des Neuen Zeichendurchgangs
  
  stroke(0,1);
  
  letterX = ((width - textW)/2);
  letterY = ((height - textH)/2)+textH;

  // das Bild leeren
  noFill();
  pushMatrix();

  translate(letterX, letterY); // setzt Text an Position

  // Überprüfen ob Maus gedrückt
  if (mousePressed) {
    // Verzerrung verändern per Maus
    danceFactor = map(mouseX, height, width, 1,3);
  } else {danceFactor = 0.5;}

  if (grp.getWidth() > 0) {
  
    // Liste von Koordinaten durchlaufen
    for (int i = 0; i < pnts.length; i++ ) {
      // Buchstabe wird angezeigt, Pfadpunkte
      pnts[i].x += random(-stepSize,stepSize)*danceFactor;
      pnts[i].y += random(-stepSize,stepSize)*danceFactor;
    }
    
    // Linien zeichnen
    strokeWeight(1);
    beginShape();
    
     stroke(0,1);
    
    curveVertex(pnts[pnts.length-1].x,pnts[pnts.length-1].y);
    
    for (int i=0; i<pnts.length; i++){
      curveVertex(pnts[i].x, pnts[i].y);
    }
    
     curveVertex(pnts[0].x, pnts[0].y);
        
    curveVertex(pnts[1].x, pnts[1].y);
    
    endShape();
  
  }
  
  popMatrix();
  
}


void keyPressed() {
  if (key == 's') { saveFrame("Screenshot-####.tif");}
  
  if (key == 'p') {
    beginRecord(PDF, "zeichnung-####.pdf");
  background(#ffffff);
  }
  
  if (key == 'e') {endRecord(); }
}



