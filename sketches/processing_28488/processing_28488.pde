
// Der zu visualisierende String
String theText = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
+ "abcdefghijklmnopqrstuvwxyz\n"
+ "Creative Coding 2011";

PFont myFont;

void setup() {
  size(800, 600);
  // Zeige eine Liste der vorhandenen Schriften
  println(PFont.list());
  // Die Schrift erstellen
  myFont = createFont("Helvetica-Bold", 18);
  // Die Schrift auswählen. Es sind auch mehrere Möglich
  textFont(myFont);
}

void draw() {
  background(255);
  smooth();
  
  // die Positionen der Texte
  // sie verändern sich innerhalb der for-Schleife für unsere Zwecke
  float wordPositionX = 30;
  float wordPositionY = 0;

  // laufe durch den String, bis zum Ende
  for (int i = 0; i<theText.length(); i++) {
    // bekomme das zeichen an der Stelle 'i'
    char letter = theText.charAt(i);
    float letterWidth = textWidth(letter);
    
    // prüfe das zeichen und verarbeite es gegebenenfalls
    switch (letter) {
    // zeichne ein rechteck wenn das kleine 'a' erkannt wurde
    case 'a':
      noStroke();
      fill(175, 255, 50);
      rect(wordPositionX, wordPositionY, int(letterWidth), int(letter));
      break;
     // zeichne ein rechteck wenn das große 'C' erkannt wurde
    case 'C':
      noStroke();
      fill(240);
      rect(wordPositionX, wordPositionY, int(letterWidth), int(letter));
      break;
    // ein leerzeichen wurde erkannt
    case ' ':
      wordPositionX = wordPositionX+textWidth(" ");
      break;
    // eine neue zeile beginnt
    case '\n':
      wordPositionX = 30;
      wordPositionY = wordPositionY + 150;
      break;
    default:
      // zeige den Zahlenwert des Buchstaben
      noFill();
      stroke(200);
      line(wordPositionX, wordPositionY, wordPositionX, wordPositionY + int(letter));
    }

    // schreibe das zeichen
    fill(0);
    text(letter, wordPositionX, 30 + wordPositionY);

    wordPositionX = wordPositionX + letterWidth;

    // gehe in die nächste Zeile wenn sie über den Bildschirmrand läuft
    if(wordPositionX > width-30) {
      wordPositionX = 30;
      wordPositionY = wordPositionY + 200;
    }
  }

  // Gut zu Wissen, so zählt man die Häufigkeit eines Wortes:
  String gesuchtesWort = "and";
  // indexOf, gibt die Position zurück an der das gesuchte Wort steht
  // wenn keines vorhandes ist, wird eine -1 zurück gegeben
  int wordIndex = theText.indexOf(gesuchtesWort);
  int wordCount = 0;
  // solange weitersuchen, bis indexOf -1 zurück gibt, also kein Wort mehr gefunden wird
  while(wordIndex > -1) {
    wordCount = wordCount + 1;
    // ab der gefundenen Position bis zum nächsten Wort weiter suchen
    wordIndex = theText.indexOf("and", wordIndex+1);
  }
  // println(wordCount);
}

void keyPressed() {
  // testen ob shift gedrückt wurde
  // ansonsten wird das gedrückte zeichen an die vorhandene Zeichenkette angefügt
  if((int)key != 65535) {
    theText += key;
    // Welchen Zahlenwert hat das zeichen?
    println("Wert des Zeichens " + key + " ist " + int(key));
  }
}



