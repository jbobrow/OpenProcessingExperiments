
// Der zu visualisierende String
String theText = "O";
PFont myFont;
 
void setup() {
  size(800, 600);
 

  // Zeige eine Liste der vorhandenen Schriften
  println(PFont.list());
  // Die Schrift erstellen
  myFont = createFont("DIN-Regular-12.vlw", 18);
  // Die Schrift auswählen. Es sind auch mehrere Möglich
  textFont(myFont);
  smooth();


}
 
void draw() {
     PImage b;
b = loadImage("papier_grau.jpg");
b.resize(width, height);
background(b);    
  // die Positionen der Texte
  // sie verändern sich innerhalb der for-Schleife für unsere Zwecke
  float wordPositionX = 30;
  float wordPositionY = 30;
 
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
      rotate(PI/3.0);
      fill(175, 255, 50);
      ellipse(wordPositionX+int(letterWidth)/2, wordPositionY, int(letterWidth)-2, int(letterWidth)-2);
      break;
      
        case 'e':
      noStroke();
      fill(175, 255, 50);
      ellipse(wordPositionX+int(letterWidth)/2, wordPositionY, int(letterWidth)-2, int(letterWidth)-2);
      break;
      
          case 'i':
      noStroke();
      fill(175, 255, 50);
      ellipse(wordPositionX+int(letterWidth)/2, wordPositionY, int(letterWidth)-2, int(letterWidth)-2);
      break;
      
                case 'o':
      noStroke();
      fill(175, 255, 50);
      ellipse(wordPositionX+int(letterWidth)/2, wordPositionY, int(letterWidth)-2, int(letterWidth)-2);
      break;
      
                case 'u':
      noStroke();
      fill(175, 255, 50);
      ellipse(wordPositionX+int(letterWidth)/2, wordPositionY, int(letterWidth)-2, int(letterWidth)-2);
      break;
      
      
      case 'A':
      noStroke();
      fill(255, 51, 102);
      ellipse(wordPositionX+int(letterWidth)/2, wordPositionY, int(letterWidth)-2, int(letterWidth)-2);
      break;
      
        case 'E':
      noStroke();
      fill(255, 51, 102);
      ellipse(wordPositionX+int(letterWidth)/2, wordPositionY, int(letterWidth)-2, int(letterWidth)-2);
      break;
      
          case 'I':
      noStroke();
      fill(255, 51, 102);
      ellipse(wordPositionX+int(letterWidth)/2, wordPositionY, int(letterWidth)-2, int(letterWidth)-2);
      break;
      
                case 'O':
      noStroke();
      fill(255, 51, 102);
      ellipse(wordPositionX+int(letterWidth)/2, wordPositionY, int(letterWidth)-2, int(letterWidth)-2);
      break;
      
                case 'U':
      noStroke();
      fill(255, 51, 102);
      ellipse(wordPositionX+int(letterWidth)/2, wordPositionY, int(letterWidth)-2, int(letterWidth)-2);
      break;
      
                case '.':
      noFill();
      stroke(80);
      line(wordPositionX, wordPositionY, wordPositionX, 800);
      break;


    default:
      // zeige den Zahlenwert des Buchstaben
      noFill();
      noStroke();
      fill(100);
      rect(wordPositionX, wordPositionY, int(letterWidth)-2, int(letterWidth)-2);
    }
 
    // schreibe das zeichen
    fill(0, 90);
     //text(letter, wordPositionX, 30 + wordPositionY);
     text(theText, wordPositionX, 30+ wordPositionY, 100, 300);
     
     wordPositionX = wordPositionX + letterWidth;
     //wordPositionY = wordPositionY + letterWidth;
 
    // gehe in die nächste Zeile wenn sie über den Bildschirmrand läuft
    if(wordPositionX > width-30) {
      // if(wordPositionY > height-100) {

            
      wordPositionX = 30;
      wordPositionY = wordPositionY + 40;
      
     //  }
    }
  }

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


