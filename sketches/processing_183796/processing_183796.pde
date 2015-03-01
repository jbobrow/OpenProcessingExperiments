


PFont font = null;
String eingabe = null;

void setup () {
  size(600, 600);
  font = createFont("Arial", 24);
  loadText();
  noLoop();
}

void draw() {
  background(#57385c);
  fill(#ffedbc);
  noStroke();
  textFont(font);
  textSize(24);
  
  String[] woerter = splitTokens(eingabe, ",.;:()?![]{}& ");
  int i = 0;
  while (i < woerter.length) {
    float x = random (0, width);
    float y = random (0, height);
    float txtSize = random (5, 24);
    
    textSize(txtSize);
    
    text(woerter[i], x, y);
    i = i + 1;
  }
  
}

void loadText() {
  
  // Textdateien laden funktioniert nicht in javascript modus, daher wird hier der Text in den Quellcode eingefuegt
  String[] raw = new String[3];
  raw[0] = "Als Rekursion (lateinisch recurrere ‚zurücklaufen‘) bezeichnet man die Technik in Mathematik, Logik und Informatik, eine Funktion durch sich selbst zu definieren (rekursive Definition). Wenn man mehrere Funktionen durch wechselseitige Verwendung voneinander definiert, spricht man von wechselseitiger Rekursion.";
  raw[1] = "Nicht jede rekursive Definition ist eine Definition im eigentlichen Sinn, denn die zu definierende Funktion braucht nicht wohldefiniert zu sein. Jeder Aufruf der rekursiven Funktion muss sich durch Entfalten der rekursiven Definition in endlich vielen Schritten auflösen lassen. Ist dies nicht erfüllt, so spricht man von einem infiniten Regress (vulgo Endlosschleife).";
  raw[2] = "Rekursion ist eine Problemlösungsstrategie, sie führt oft zu eleganten Darstellungen. Das Grundprinzip der Rekursion ist das Zurückführen einer allgemeinen Aufgabe auf eine einfachere Aufgabe derselben Klasse. Die rekursive Programmierung ist Bestandteil vieler Programmiersprachen. Prozeduren oder Funktionen können sich dabei selbst aufrufen. Rekursion und Iteration sind im Wesentlichen gleichmächtige Sprachmittel.";
  
  /** 
   * bei Arbeiten im java Modus statt der obigen Zeilen:
   * String[] raw = loadStrings("text.txt");
   */
  
  /* String array zu einer einzelnen Zeichenkette zusammenfuegen */
  eingabe = join (raw, " ");
  
  // alles in Groß- oder Kleinbuchstaben umwandeln
  // text = text.toLowerCase();
  //text = text.toUpperCase();
  
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  saveFrame("export/buchstabenzaehlen.png");
}
