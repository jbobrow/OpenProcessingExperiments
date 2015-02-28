
String theText = "Durch alle Höhen und Tiefen";

PFont myFont;

void setup() {
  size(640, 160);
  // Zeige eine Liste der vorhandenen Schriften
  println(PFont.list());
  // Die Schrift erstellen
  myFont = loadFont("InfoText-Book-80.vlw");
  //  myFont = loadFont("Serif-48.vlw");
  // Die Schrift auswählen. Es sind auch mehrere Möglich
  textFont(myFont);
  fill(100);
  noStroke();
  smooth();
}

void draw() {
  background(255);  
  fill (0);
  //Balken
  rect (30, 21, 560, 55);
  //Bezieht sich auf Schrift
  fill(255);

  // die Positionen der Texte
  // sie verändern sich innerhalb der for-Schleife für unsere Zwecke
  float wordPositionX = 30;
  float wordPositionY = 0;

  int x = 50;
  for (int i = 0; i < theText.length(); i++) {
    textSize(random(14, 80));
    text(theText.charAt(i), x, height/2);
    // textWidth()Abstand der Zeichen
    x += textWidth(theText.charAt(i));
  }
  // Loop würde durchgängig random-Ausgaben ausspucken und flackern
  noLoop();
}


