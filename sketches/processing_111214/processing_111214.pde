
// globale Variablen zum Ablegen
// der Mausposition(en)
int[] xpos = new int[70];
int[] ypos = new int[70];
 
void setup(){
  size(550, 200);
  smooth();
  noStroke();
}
 
void draw(){
  background (79);
 
  /* Wir verschieben in jedem Einzelbild 
   * alle bisher gespeicherten Mauspositionen 
   * um eins nach vorn in unserem Array. In 
   * das letzte Feld kommt später die 
   * aktuelle Position der Maus.
   */
  for (int i=0; i< xpos.length - 1; i++) {
    xpos[i] = xpos[i + 1];
    ypos[i] = ypos[i + 1];
  }
   
  // aktuelle Mausposition in das letzte Feld speichern
  xpos[xpos.length - 1] = mouseX;
  ypos[xpos.length - 1] = mouseY;
 
  // Zeichnen aller Kreise
  for (int i=0; i < xpos.length; i++) {
    fill (229, 90, 38, 25);
    ellipse (xpos[i], ypos[i], i / 0.85, i / 0.85);
  }
}
