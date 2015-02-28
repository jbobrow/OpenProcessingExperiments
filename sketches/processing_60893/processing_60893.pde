
// Dieses Programm ist der Mondrian-Macher
// Es ist Teil des Projektes KCatU.zapto.org
// Es soll einfache Bilder im Stiel von Piet 
// Mondrian erzeugen.
// Sollte dir das Programm gefallen dann
// 1. Helfe dem Programm zur Verbreitung 
// 2. Entwickle den Code des Programms weiter
// 3. Schlage andere Programme vor



// Eingabe der Start Parameter
int BildBreite = 400; // Breite des Bildes in Pixel
int BildHoehe = 600;  // Hoehe des Bildes in Pixel
int MaximaleAnzahl = 10; // Ballance zwischen Buntheit und Komplexität
int Feinheit = 10; // Ballance zwischen Gliderung und Komplexität

// Berechnung der Darzustellenden Elementen
int Anzahl = int(random(MaximaleAnzahl));

// Begin der eigentlichen Routine
void setup(){
  
// Deffinition der Leinwand
size(400,600);
background(255);
}

void draw(){}

void mousePressed() { // Erstellungs Routine
  if (mouseButton == LEFT) {
// Erstellung der einzelnen Elemente
background(255);
for(int Zahler = 0; Zahler <= Anzahl; Zahler++){

// Auswahl der darzustellenden Richtungen
  int Richtung = int ( random(2));
  switch(Richtung){
  case 0: Wagerecht(); break;
  case 1: Senkrecht(); break; 
  }  
}
}
  if (mouseButton == LEFT){
  }
}

// Erstellung eines Wagrechten Elements
 void Wagerecht(){ 
   
   // Auswahl der Farbe
  int Farbe = int(random(3));
  switch(Farbe){
    case 0: fill(255,0,0); break; // 1. Farbe
    case 1: fill(0,255,0); break; // 2. Farbe
    case 2: fill(0,0,255); break; // 3. Farbe
  }
  
  // Berechnung der Dimensionen des Elements
  int StartHoehe = int(random(BildHoehe));
  // int Weite = int(random(BildHoehe - StartHoehe));
  int Weite = int(random(BildHoehe / Feinheit ));
  
  // Zeichnen des Elements
  rect( 0, StartHoehe, BildBreite, Weite);
}

// Erstellung des Senkrechten Elements
 void Senkrecht(){ 
  
   // Auswahl der Farbe
   int Farbe = int(random(3));
  switch(Farbe){
    case 0: fill(255,0,0); break; // 1. Farbe
    case 1: fill(0,255,0); break; // 2. Farbe
    case 2: fill(0,0,255); break; // 3. Farbe
  }
  
  // Berechnung der Dimensionen des Elements
  int StartBreite = int(random(BildBreite));
  // int Weite = int(random(BildHoehe - StartHoehe));
  int Lange = int(random(BildBreite / Feinheit ));
  
  // Zeichnen des Elements
  rect( StartBreite, 0, Lange, BildHoehe);
}
