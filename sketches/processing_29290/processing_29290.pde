
// Der zu visualisierende String
String theText = "Das Deutsche ist, was das Lautinventar betrifft. eine der vokalreichsten Sprachen der Welt. Zu den Vokalen des Standarddeutschen Hochdeutsch. gehören der i-Laut in Igel, der i-Laut in Iltis, der e-Laut in Eva, der ä-Laut in Käse siehe unten, der e-Laut in Esra, der mit. dem Buchstaben e. wiedergegebene Laut in Ute, der a-Laut in Pate, der a-Laut in Paste, der o-Laut in Ton, der o-Laut in von, der u-Laut in Ute, der u-Laut. in Bus, der ü-Laut in Tüte, der ü-Laut in Küste, der ö-Laut in Flöte, der ö-Laut in öfter und der dem kurzen a-Laut. ähnliche, aber doch klar von ihm unterschiedene Vokal am Ende des Wortes Leder durch die Buchstabenkombination er repräsentiert; im Unterschied zu Schreibung und Aussprache des Wortes Leda. Der lange ä-Laut wird in einem bedeutenden Teil Deutschlands .nicht vom langen e-Laut unterschieden. Das heißt, dass dort in der Aussprache zum Beispiel nicht zwischen Gewähr und Gewehr. unterschieden wird. Die kurz ausgesprochenen Buchstaben ä und e bezeichnen im Standarddeutschen aber immer denselben Laut: den kurzen, halboffenen Vokal: die Aussprachen von Fälle und Felle sind identisch. Wenn man den langen ä-Laut hinzuzählt, besitzt das Deutsche also 17 Vokale. Da die durch den Buchstaben e in Ute und die Buchstabenkombination er in Leder bezeichneten. Vokale im Deutschen den Wortakzent. nicht tragen können und auch nur in den sogenannten Reduktionssilben vorkommen, werden sie von den meisten Phonologen nicht zu den Phonemen gerechnet, was dazu führte, dass sie hin und wieder in den Darstellungen des deutschen Vokalbestandes vergessen wurden.";
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
    fill(0);
        text(letter, wordPositionX, 30 + wordPositionY);

 
    wordPositionX = wordPositionX + letterWidth;
 
    // gehe in die nächste Zeile wenn sie über den Bildschirmrand läuft
    if(wordPositionX > width-30) {
      wordPositionX = 30;
      wordPositionY = wordPositionY + 30;
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


