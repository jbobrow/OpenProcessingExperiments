
String theText = "Durch alle Höhen und Tiefen";

PFont myFont;

int x = 50;
int y = 80;
int wordCount = 1;

void setup() {
  size(300, 200);

  myFont = loadFont("Miso-80.vlw");

  textFont(myFont);

  smooth();
}

void draw() {
  background(0); 

  fill(255);

  for (int i = 0; i < theText.length(); i++) {
    
    // x = x-Koordinate
    // w = Breite des Textzeichens
    println("Zeichen:" + theText.charAt(i) + " x:" + x + " w:" + int(textWidth(theText.charAt(i))));
    
    // immer der erste Buchstabe eines Wortes wird groß geschrieben
    if (i > 0) {
      if (theText.charAt(i - 1) == ' ') {
        textSize(80);
      }
      else {
        textSize(28);
      }
    }

    // stellt Text dar
    text(theText.charAt(i), x, y);
  
    // zählt Wörter
    if (theText.charAt(i) == ' ') {
      wordCount++;
    }
  
    // prüft das der Text nicht aus der Zeichenfläche fließt
    if (x > width - 100) {
      if (theText.charAt(i) == ' ') {
        y = y + 80;
        x = 50;
      }
    }
    
    // verändert die x Koordinate des Textzeichens für die Anzeige
    x = x + int(textWidth(theText.charAt(i)));
  }
  
  println("Anzahl der Worte: " + wordCount);

  // Loop würde durchgängig random-Ausgaben ausspucken und flackern
  noLoop();
}


