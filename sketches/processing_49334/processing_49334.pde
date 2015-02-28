
/*----------------------------------------------------
The Kong
Processing Projekt 2 von Jan Adam und Sandeep Abraham
-----------------------------------------------------*/

import processing.video.*;          //Benötigt für die Webcamfunktion, funktioniert aber nur auf MAC
Capture myCapture;                  // Aktiviert die myCapture Funktion der Kamera

// Deklaration der Arrays für die x-, y-koordinate und der Geschwindigkeit der Feuerbälle
float[] m = new float[50], n = new float[50], 
vm = new float[10], vn = new float[10]; 

// Deklaration der x-Koordinate der Bananen
float a = 650;
float b = 100;
float c = 30;
float d = 23;
float e = 812;

// Deklaration der Geschwindigkeiten der verschiedenen Bananen
float va = 5;
float vb = 8;
float vc = 6;
float vd = 7;
float ve = 4;

// Deklaration des Counters, der die Punkte zählt
int counter = 0;
int count = 1;

// Deklaration des Textfunktions mit "schrift"
PFont schrift;

// Deklaration der y-Koordinate der verschiedenen Bananen
float bananey = 0;
float banane2y = -4;
float banane3y = -30;
float banane4y = 0;
float banane5y = 0;

// Deklaration des Textes "Guter Monkey" auf str1
String str1 = "Mario is angry";

// Deklaration der Koordinaten von Donkey Kong und vom neuen Kong
int y = 300;     // y-Koordinate von Kong
float fx = 450;   // x-Koordinate vom neuen Kong
float fy = 420;   // y-Koordinate vom neuen Kong



// Deklaration der Variabeln für die Bilder
PImage land;
PImage land2;
PImage movingkong;
PImage movingkonglinks;
PImage standingkong;
PImage standingkong2;
PImage standingkonglinks;
PImage happykong;
PImage banana;
PImage banana2;
PImage fire;
PImage mario;

void setup () {
  size (1024, 572); // Fenstergrösse 1000 x 572 Pixel (dem Hintergrundbild angepasst)
  noCursor(); // sorgt dafür, dass der Mausanzeiger im Fenster nicht angezeigt wird
  //frameRate(25); // setzt die Aktualisierung der Bilder auf 60 frames pro Sekunde. Macht das Programm flüssiger.

  // Initialisierung der Arrays
  for (int i=0; i<5; i++) { 
    vm[i] = random(10);
    vn[i] = random(10);
  }

  // Upload der Bilder
  fire = loadImage("fire.gif");
  mario = loadImage("mario.gif");
  land = loadImage("country.jpg");
  land2 = loadImage("country2.jpg");
  banana = loadImage("banane_normal.gif");
  banana2 = loadImage ("banane_blau.gif"); 
  happykong = loadImage("happykong.gif");
  movingkong = loadImage("movingkong.gif");
  standingkong = loadImage("standingkong.gif");
  standingkong2 = loadImage("standingkong.gif");
  movingkonglinks = loadImage("movingkong_links.gif");
  standingkonglinks = loadImage("standingkonglinks.gif");

   //Kamera-aktivierung und Bestimmung der Grösse auf dem Fenster
   myCapture = new Capture(this, 400, 400, 30);

} // end for setup


// Aktiviert die Kamerafunktion und sucht sie im System
void captureEvent(Capture myCapture) {
 myCapture.read();
 }


void draw() {

  background (land); // Bestimmt den Hintergrund. In diesem Fall das Bild "land".


  // Schrift laden und Punktestand anzeigen
  schrift = loadFont ("art.vlw"); // Ladet die Schriftart "Art" und wird als "schrift" deklariert.
  textFont(schrift, 24); // Bestimmt welche Schrift und deren Schriftgrösse.
  fill (255); // Färbt die Schrift Weiss.
  text("Bananapoints:", 800, 50);
  text(counter, 970, 50); // Zeigt den Punktestand an.


  // Anzeige der Bananen plus Bestimmung der Koordinaten und der y-Geschwindigkeit der Bananen.
  image(banana, a, bananey, 50, 50);
  image(banana2, b, banane2y, 50, 50);
  image(banana, c, banane3y, 30, 30);
  image(banana2, d, banane4y, 40, 40);
  image(banana, e, banane5y, 40, 40);

  // Sorgt dafür, dass jede Banane ihre eigene Geschwindigkeit hat.
  bananey = bananey + va;
  banane2y = banane2y + vb;
  banane3y = banane3y + vc;
  banane4y = banane4y + vd;
  banane5y = banane5y + ve;


  // Wiederaufruf der Bananen, wenn sie den Zeichenbereich übertreten.
  if (bananey > height) {
    bananey = 0;          // y-Koordinate der Banane = 0
    a = random(1000);     // x-Koordinate der Banane = Zufällig
    va = random (10, 30); // Geschwindigkeit der Banane auch zufällig, jedoch zwischen 14 und 30 Frames/sek.
  }

  if (banane2y > height) {
    banane2y = 0;
    b = random(1000);
    vb = random (15, 40);
  }

  if (banane3y > height) {
    banane3y = 0;
    c = random(1000);
    vc = random (15, 40);
  }

  if (banane4y > height) {
    banane4y = 0;
    d = random(1000);
    vd = random (15, 40);
  }

  if (banane5y > height) {
    banane5y = 0;
    e = random(1000);
    ve = random (15, 40);
  }

 
 
  if (counter < 20 || count < 2) { // Wenn der Punktestand unter 20 ist.   
  
    // Sorgt dafür, dass Donkey Kong die Bananen sammeln kann inkl. der Reaktion des Counters (Punkteaufnahme und -abnahme)
    if ((bananey > 260 && bananey < 340) && (mouseX+45 > a && pmouseX-45 < a + 45)) {  // Wenn Donkey sich im Zeichenbereich der Banane befindet
      bananey = 0;   
      a = random(1000);
      va = random (5, 15);
      counter = counter + 2;
    }

    if (banane2y > 260 && banane2y < 340 && mouseX+45 > b && pmouseX-45 < b + 45) {
      banane2y = 0;   
      b = random(1000);
      vb = random (5, 15);
      counter = counter - 2;
    }

    if (banane3y > 260 && banane3y < 340 && mouseX+45 > c && pmouseX-45 < c + 45) {
      banane3y = 0;   
      c = random(1000);
      vc = random (5, 15);
      counter ++;
    }

    if (banane4y > 260 && banane4y < 340 && mouseX+45 > d && pmouseX-45 < d + 45) {
      banane4y = 0;   
      d = random(1000);
      vd = random (5, 15);
      counter --;
    }

    if (banane5y > 260 && banane5y < 340 && mouseX + 45 > e && pmouseX-45 < e + 45) {
      banane5y = 0;   
      e = random(1000);
      ve = random (5, 15);
      counter ++;
    }
  } // end for counter < 20



  // Definition von Donkey Kong.
  imageMode(CENTER); // Positioniert das Bild im Zentrum.
  image(standingkong, mouseX, y, 150, 150);

  // Sorgt dafür, dass sich das Bild der Links- und Rechtbewegung der Maus anpasst.
  if (mouseX < pmouseX) { //Wenn sich die Maus nach Links bewegt.
    standingkong = standingkonglinks;
  }
  if (mouseX > pmouseX) { //Wenn sich die Maus nach Rechts bewegt.
    standingkong = standingkong2;
  }


  // Anpassung der y-Position von Donkey Kong auf das Hintergrundbild.
  if (mouseX > 745 || mouseX > 150 && mouseX < 370) {
    y = 250;
  }
  else {
    y = 300;
  }




  // Bestimmt die Reaktion von Donkey Kong, wenn er eine bestimmte Punktezahl erreicht. Er wird durch andere Donkey-Bilder ersetzt.
  if (counter < 0) {
    tint(0, 200, 255); // Färbt alles bläulich.
  } // end for counter < 0
  
  else {
    noTint(); // Löscht die Färbung.
  }

  if (counter > 4) {
    if (mouseX > pmouseX) {
      standingkong = movingkong;
    }
    if (mouseX < pmouseX) {
      standingkong = movingkonglinks;
    }
  } // end for counter > 4

  if (counter > 9) {
    standingkong = happykong;
    
    image(mario, 100, 100, 274, 181); // Erzeugt das Bild von Super Mario

    for (int i=0; i<5; i++) { // for-Schleife für die Aktualiserung des Arrays
      m[i] = m[i] + vm[i];    // Berechnung der neuen x-Position der Feuerbälle.
      n[i] = n[i] + vn[i];    // Berechnung der neuen y-Position der Feuerbälle.

      if ((m[i]>width) || (m[i]<0)) {    // Abprall an den Wänden. Sobald der Ball i ausserhalb des Zeichenbereichs ist,
        vm[i] = -vm[i];                  // wird die x- bzw. y-Geschwindigkeit in Gegenrichtung gekehrt.
      } 
      if ((n[i]>height) || (n[i]<0)) { 
        vn[i] = (-1)*vn[i];
      } 

      image(fire, m[i], n[i], 30, 30); // Zeichnet die 5 Feuerbälle.
            fill (200);

      text(str1, 20, 240); // Ladet den Text, der als str1 deklariert worden ist.
      text("just some more points!", 20, 270);

      // Reaktion nach Donkey Kongs Berührung mit einem Feuerball
      if (n[i] > 260 && n[i] < 340 && mouseX+45 > m[i] && pmouseX-45 < m[i] + 45) {
        count = 3;
      }
    } // end for for Feuerbälle
  } // end for counter > 9

  if (counter > 19 || count > 2) {
    
    
    cursor (); // Zeigt den Mauspfeil wieder an
    background (land2); //Ladet einen neuen Hintergrund
    fill (10);  // Aktiviert die Schriftfarbe Schwarz
    text("Gratulations! Your score:", 100, 450);
    text("Now put Donkey on the arrow to end this game", 100, 490);
    text(counter, 350, 450);
    textFont(schrift, 64);
    text("The Kong", 500, 120);
    image(happykong, fx, fy, 150, 150); // Bild von Happy Donkey Kong
    textFont(schrift, 18);
    text("© Jan Adam and Sandeep Abraham", 740, 550);
     image(myCapture, 200, 200);  // Aktiviert die Kamera nach 19 Punkte um ein Foto zu machen.


  } // end for counter > 19
} // end for draw


void mouseDragged() { //Funktion, wenn man die Maus bewegt und die Maustastegedrückt hält.
  fx = mouseX; // x und y-Position vom neuen Happy Donkey Kong entsprechen
  fy = mouseY; // der Maus-Koordinaten, wenn man die Maustaste gedrückt hält.
}
void mouseReleased() { // Funktion, sobald man die Maustaste loslässt
  if (fx > 580 && fx < 680 && fy > 150 && fy < 250) { //Sobald Donkey im Bereich des Pfeils kommt.
    saveFrame();     // Speichert dden Zeichenbereich, um das Foto zu schiessen.
    exit(); //Schliesst das Programm.
  }
}


