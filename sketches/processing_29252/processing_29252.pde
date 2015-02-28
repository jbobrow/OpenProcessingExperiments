
// Der zu visualisierende String
String theText = "\nDer Kabeljau\nDas Meer ist weit, das Meer ist blau, \nim Wasser schwimmt ein Kabeljau.\nDa kömmt ein Hai von ungefähr, \nich glaub’ von links, ich weiß nicht mehr,\nverschluckt den Fisch mit Haut und Haar, \ndas ist zwar traurig, aber wahr.\nDas Meer ist weit, das Meer ist blau, \nim Wasser schwimmt kein Kabeljau.";

PFont myFont;

void setup() {
  size(400, 700);
    frameRate(1);
  // Zeige eine Liste der vorhandenen Schriften
  println(PFont.list());
  // Die Schrift erstellen
  //  myFont = createFont("Helvetica-Bold", 18);
  myFont = loadFont("LucidaBright-DemiItalic-48.vlw");
  // Die Schrift auswählen. Es sind auch mehrere Möglich
  textFont(myFont);
  smooth();
}

void draw() {
  background(255);
  textSize (random(16, 24));


  // die Positionen der Texte
  // sie verändern sich innerhalb der for-Schleife für unsere Zwecke
  float wordPositionX = 10;
  float wordPositionY = 0;

  // laufe durch den String, bis zum Ende
  for (int i = 0; i<theText.length(); i++) {
    // soll ganz vorne anfangen und dann wissen, wei viele
    //Zeichen es sind bis zum ende des Strings ("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    // bekomme das zeichen an der Stelle 'i'
    char letter = theText.charAt(i);
    float letterWidth = textWidth(letter);

    // prüfe das zeichen und verarbeite es gegebenenfalls
    switch (letter) {
      // zeichne ein rechteck wenn das kleine 'a' erkannt wurde
    case 'M':
      noStroke();
      fill(0, 153, 255);
      rect (wordPositionX, wordPositionY+10, int(letterWidth), 15);
      break;
    case 'W':
      noStroke();
      fill(0, 153, 255);
      rect (wordPositionX, wordPositionY+10, int(letterWidth), 15);
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
      wordPositionX = 10;
      wordPositionY = wordPositionY + 40;
      break;
    default:
      // zeige den Zahlenwert des Buchstaben
      noFill();
      stroke(0, 153, 255, 70);
      line(wordPositionX, wordPositionY+int(letter-60), wordPositionX+50, wordPositionY+int(letter-60));
    }


    // schreibe das zeichen
    fill(0);
    text(letter, wordPositionX, 30 + wordPositionY);

    wordPositionX = wordPositionX + letterWidth;


    // gehe in die nächste Zeile wenn sie über den Bildschirmrand läuft
    if (wordPositionX > width-30) {
      wordPositionX = 30;
      wordPositionY = wordPositionY + 40;
    }
  }
}


