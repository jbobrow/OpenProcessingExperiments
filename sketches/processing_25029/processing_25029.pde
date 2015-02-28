
// ***************************
// Farbwahlgedöns und Zeichnen
// ***************************

  int bg1 = 0;                            // BG Farben festlegen
  int bg2 = 0;
  int bg3 = 0;
  
  int colorR = 0;                         // Variablen für Farbwähler in draw()
  int colorG = 0;
  int colorB = 0;
  
  
void setup() {                             // Setup einmalig festlegen

    size(800, 600);                        // fenstergröße festlegen
    smooth();                              // Anti-Aliasing aus
    background(bg1,bg2,bg3); 
    colorMode(RGB);
    
    farbwahl();                            // Farbwähler starten
    
}

//// * FARBWÄHLER  *////

void farbwahl() {
  
  // Farbwähler als Image laden
  
   PImage b;
   b = loadImage("farbwahl.jpg");
   image(b, 0, 0);
  
  /// Farbwähler über Programmierung
  /* 
  int fillcolor1 = 1;
  int fillcolor2 = 111;
  int fillcolor3 = 122;
  int rectposX = 0;
  int strokegroesse = 4;  
  
  for (int i=0; i < height; i++) {
    stroke(fillcolor1, fillcolor2, fillcolor3);
    strokeWeight(strokegroesse);
    line (0, rectposX, 20, rectposX);
    fillcolor1 = fillcolor1 + 2;
    fillcolor2 = fillcolor2 + 10;
    fillcolor3 = fillcolor3 + 3;
    rectposX = rectposX + strokegroesse-1;    
  } */
  
}

///// **** FARBWAEHLER ENDE ****  //////

void keyReleased() {
    if  ( key == 'l' || key == 'L' ) {  
     background(bg1, bg2, bg3);            // BG zurücksetzen
     farbwahl();                           // Neuer Farbwähler
  }
}


void keyPressed() {
  if (key == 's' || key == 'S') {
    println("SCREENSHOT DONE!");
    saveFrame("screenshot-####.jpg");
  }
  
  if (key == 'p' || key == 'P') {
    beginRecord(PDF, "skecth.pdf");
    colorMode(HSB, 100);
    background(100);  
  }
}


//// *** MALEN *** ////

void draw() {


  float abstand = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  if (abstand > 20) {  abstand = 20; }
  
  if (mousePressed && (mouseButton == LEFT))  {  
    if (mouseX >= 35 ) {                       // verhindern, das über Farbwähler gemalt wird
      strokeWeight(20-abstand);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
  }
  
  
 if (mousePressed && (mouseButton == LEFT) && mouseX < 34) {
 
    color mouseColor = get(mouseX, mouseY);
    println (round(red(mouseColor)) + "," + round(green(mouseColor)) + "," + round(blue(mouseColor)));
  
    colorR = (round(red(mouseColor)));
    colorG = (round(green(mouseColor)));
    colorB = (round(blue(mouseColor)));
    
    stroke(colorR, colorG, colorB);
  
  }
  
  if (mousePressed && (mouseButton == LEFT)) {
      if (mouseX <=34 && mouseY >= 550) {
        background(bg1,bg2,bg3); 
       farbwahl();     
     }
    
  }
}

//// *** MALEN ENDE *** ///

