
import processing.pdf.*;

void setup() {
size(600,600); /**bestimmt die Bildschrimgröße*/
smooth();
/** hier kann man auch den farbmodus einstellen, wie man die farben eingibt: colorMode(HSB, 100); oder colorMode(RGB,100); zum beispiel bestimmt die farben und die sättigung*/
}

void draw () {
  if(mousePressed == true) { /**zeichnet nur wenn maus gedrückt ist*/
    ellipse(
    mouseX,
    mouseY /**bestimmt die koordinaten wo die ellipse gezeichnet werden soll*/, 
    dist (pmouseX, pmouseY, mouseX, mouseY) /** berechnet die Distanz zwischen 2 punkten*/, 
    dist (pmouseX, pmouseY, mouseX, mouseY)/**dist bla bla ist 1 wert, die beiden dist sagen also aus mit welchem wert sich die ellipse in x und in y richtung ausdehnt*/
    ); 
    
     /** oder man erstellt zuerst eine variable durch: " float durchmesser = dist (pmouseX, pmouseY, mouseX, mouseY) " und dann in der " ellipse(mouseX, mouseY, durchmesser, durchmesser) " */
  }
  
  float abstand = dist (pmouseX, pmouseY, mouseX, mouseY);
  
  if (abstand > 20) { 
    abstand = 20; /** wenn der abstand größer 20 ist, wird er auf 20 zurückgesetzt, ist auch möglich so zu schreiben: abstand = min(abstand,20)*/
  }
  strokeWeight (20- abstand); /** sagt wie dick die Linie ist die wir malen, alles was in den Klammern steht, wird als Parameter genommen, man kann da auch eine andere funktion reinschreiben für die parameter*/
  line (pmouseX, pmouseY, mouseX, mouseY); /**male eine linie von der vorherigen Position zur jetzigen*/
  
 
}

/**
void mouseClicked (){
  println("mouse clicked");
  stroke(255); / sobald man einaml klickt malts weiß weiter /
}
*/

void mousePressed () {
  println("mouse gedrückt");
  stroke(random(255),0,0);
  /** immer wenn ich drück wird eine neue farbe definiert  " fill(random(255)); " braucht man nicht, da wir nur eine linie zeichnen, die kann nicht gefüllt werden */
}

void keyPressed () {
 if (key == 's') {
   println("Frame abspeichern");
   saveFrame("screenshot-####.tif");
 } /** wenn man s drückt, machts nen screenshot, über apfel+k kann man ordner aufrufen*/
 
 if (key =='p') {
   beginRecord(PDF, "zeichnung.pdf");
 }
  if (key == 'e') {
   endRecord();
  }
 
 /** wenn man p drückt fängts an ne pdf zu speichern bis man e drückt, alles was dazwischen gezeichnet wird ist in der pdf drin*/
 if (key == 'b') {
 background(100);
 } /** wenn man b drückt, färbts entsprechend den hintergrund ein und löscht somit das bisher gezeichnete*/
}

