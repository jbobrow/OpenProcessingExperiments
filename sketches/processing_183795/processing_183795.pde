

String alphabet = "abcdefghijklmnopqrstuvwxyz";
int[] counter = new int[alphabet.length()];

PFont font = null;

void setup () {
  size(600, 600);
  font = createFont("Arial", 24);
  loadText();
}

void draw() {
  background(#57385c);
  fill(#ffedbc);
  noStroke();
  textFont(font);
  textSize(24);
  
  
  int i = 0;
  
  while (i < alphabet.length()) {
    float x = 50;
    float y = map (i, 0, alphabet.length(), 30, height-10);
   
    char buchstabe = alphabet.charAt(i);
    int anzahl = counter[i];
    String ausgabe = buchstabe + " x " + anzahl;
    text(ausgabe, x, y);
    
    rect(x+100, y, map(anzahl, 0, 145, 10, 300), -14);
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
  
  
  String zusammengefuegt = join (raw, " ");
  zusammengefuegt = zusammengefuegt.toLowerCase();
  
  int i = 0;
  while (i < zusammengefuegt.length()) {
    char buchstabe = zusammengefuegt.charAt(i);
    int index = alphabet.indexOf(buchstabe);
    if (index >= 0) {
      int num = counter[index];
      num = num + 1;
      counter[index] = num;
    }
    i = i + 1;
  }
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  saveFrame("export/buchstabenzaehlen.png");
}
