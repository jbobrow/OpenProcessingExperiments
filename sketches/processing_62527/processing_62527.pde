
// Kontrolliert den Radius des größten Kreises
int groessterRadius = 30;

// Anzahl von verschachtelten Kreisen
int innenkreise = 5;

// Anzahl der großen Kreise (wird automatisch gesetzt!)
int anzahlKreise = 0;

// Definiert die maximalen Farbwerte, die der User bestimmt
int farbeR = int(random(255));
int farbeG = int(random(255));
int farbeB = int(random(255));

// Beinhaltet die Farben der verschachtelten Kreise
int[] farben;

void setup() {
  size(480, 480);
  background(0);
  smooth();
  
  aendereGroesse(0);
  erzeugeFarben();
}

// Erzeugt ein Array mit den Farben, die für die verschachtelten Kreise verwendet werden

void erzeugeFarben() {
  // Lege das Array an
  farben = new int[innenkreise];

  // Bestimmt die Schrittweite zwischen den Farbwerten
  int[] schrittGroesse = new int[3];
  schrittGroesse[0] = int(farbeR / innenkreise);
  schrittGroesse[1] = int(farbeG / innenkreise);
  schrittGroesse[2] = int(farbeB / innenkreise);

  // Erzeuge die Farben
  for (int i=1; i<=innenkreise; i++) {
    farben[i-1] = color(i * schrittGroesse[0], i * schrittGroesse[1], i * schrittGroesse[2]);
  }  
}

// Ändert den Radius des größten Kreises um differenz und berechnet die Anzahl der nötigen Kreise neu
   
void aendereGroesse(int differenz) {
  // Zuerst ändern wir den Radius
  groessterRadius += differenz;
  
  // Nun verhindern wir einen zu kleinen Radius
  groessterRadius = (groessterRadius < 5) ? 5 : groessterRadius;
  
  // Und schließlich berechnen wir die Anzahl der benötigten
  // Kreise neu
  anzahlKreise = floor(width / (2*groessterRadius));  
}

//Und die Anzahl der Innenkreise

void aendereInnenkreise(int differenz) {
   if (innenkreise+differenz > 1) {
      innenkreise += differenz;
      erzeugeFarben();
   }
}

void draw() {
  // Alles löschen, was vorher da war
  background(0);
  
  // Über die gesamte Breite gehen
  for (int i=1; i<=anzahlKreise; i++) {
    
    // Über die gesamte Höhe gehen
    for (int j=1; j<=anzahlKreise; j++) {
      
      // Über alle Iterationen gehen
      for (int t=0; t<innenkreise; t++) {
     
        // Pinsel einstellen
        stroke(farben[t]);
        fill(farben[t]);
        
        // Radius des momentanen Kreises
        int kreisRadius = groessterRadius - t*groessterRadius/innenkreise;
       
        // Kreis zeichnen
        ellipse((2*i-1)*groessterRadius, (2*j-1)*groessterRadius, 2*kreisRadius, 2*kreisRadius); 
      }
    } 
  }  
  
  if (keyPressed) {
    switch (key) {
      case '+':
        aendereGroesse(1);
        break;
      case '-':
        aendereGroesse(-1);
        break;  
      case '#':
        aendereInnenkreise (1);
        break; 
      case '.':
        aendereInnenkreise (-1);
        break;  
        
      case 'r':
         farbeR += 10;
         farbeR = (farbeR > 255) ? 0 : farbeR;
         erzeugeFarben();
         break;
      case 'g':
         farbeG += 10;
         farbeG = (farbeG > 255) ? 0 : farbeG;
         erzeugeFarben();
         break;
      case 'b':
         farbeB += 10;
         farbeB = (farbeB > 255) ? 0 : farbeB;
         erzeugeFarben();
         break;
    }  
  }
}

