
int abstand = 60;
String theText = " DURCH HÖHEN UND TIEFEN";

PFont myFont;

int x = 50;
int y = 80;
int wordCount = 1;

void setup() {
  size(450, 600);

  myFont = loadFont("Info-Book-48.vlw");
  textFont(myFont);

  smooth();
}

void draw() {
  background(255);
  
//Linie im HG gestuft
  for(int y = 0; y <= height; y = y + abstand){
    for(int x = 0; x <= width; x = x + abstand){
      line (x, y, x+200, y-800);
    }
  }
  
  for (int i = 0; i < theText.length(); i++) {
    
    // x = x-Koordinate
    // w = Breite des Textzeichens
    println("Zeichen:" + theText.charAt(i) + " x:" + x + " w:" + int(textWidth(theText.charAt(i))));

    // immer der erste Buchstabe eines Wortes wird groß geschrieben
    if (i > 0) {
      if (theText.charAt(i - 1) == ' ') {
        fill(255,102,0);
      }
      else {
        fill(60);
      }
    }


    // stellt Text dar
    text(theText.charAt(i), x, y);

    // zählt Wörter
    if (theText.charAt(i) == ' ') {
      wordCount++;
    }

    // prüft das der Text nicht aus der Zeichenfläche fließt
    if (x > width - 400) {
      if (theText.charAt(i) == ' ') {
        y = y + 50;
        x = 50;
      }
    }

    // verändert die x Koordinate des Textzeichens für die Anzeige
    x = x + int(textWidth(theText.charAt(i)));
     fill(255, 30);
 noStroke ();
 rect (220, 138, 160, 235);
  }

  println("Anzahl der Worte: " + wordCount);
  
  fill(40); 
  textSize (18);
 text ("Jemand musste Josef K. verleumdet haben, denn ohne dass er etwas Böses getan hätte, wurde er eines Morgens verhaftet. »Wie ein Hund! « sagte er, es war, als sollte die Scham ihn überleben.", 230, 144, 155, 260);

  // Loop würde durchgängig random-Ausgaben ausspucken und flackern
  noLoop();
}



