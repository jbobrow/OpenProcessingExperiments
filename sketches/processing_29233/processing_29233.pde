
String theText = "Sex Pistols";

PFont myFont;

void setup() {
  size(300, 200);
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
  background(255, 255, 0);  
  translate(10, 50);
  rotate (-0.2);
fill (255, 51, 255);
rect (30, 40, 230, 56);
 fill(255, 255, 0);

  // die Positionen der Texte
  // sie verändern sich innerhalb der for-Schleife für unsere Zwecke
  float wordPositionX = 30;
  float wordPositionY = 0;

  int x = 50;
  for (int i = 0; i < theText.length(); i++) {
    textSize(random(14, 80));
    text(theText.charAt(i), x, height/2);
    x += textWidth(theText.charAt(i));

  }
  noLoop();
  

}



