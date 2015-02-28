
// Schritt eins: Schriftfont laden (mit bestimmter SchriftgrÃ¶Ã�e)

// >> Eine Liste aller installierter Schriften kann man Ã¼ber PFont.list() abfragen
// >> Schriftladen: PFont font = createFont ("Fontname", fontSize);
// >> Beachte: Der Fontname muss genauso geschrieben werden, wie in der Liste
// >> Beachte auch: Der Schriftname wird mit doppelten AnfÃ¼hrungszeichen gerahmt

// Schritt zwei: Schriftanzeigen

// >> Font und SchriftgrÃ¶Ã�e festlegen >> textFont (PFont, fontsize);
// >> Anzeigen >> text ("Hallo", 100,100);
// >> Formatieren
// >>>> horizontal >> textAlign (LEFT); textAlign (CENTER); textAlign (RIGHT);
// >>>> horizontal & vertikal >> textAlign (LEFT, TOP); textAlign (LEFT, BOTTOM); (...)
// >> Zeilenabstand 
// >>>> textLeading (20);

// Sonderzeichen (Auswahl)
// >>>> Zeilenumbruch >>     \n   >> Beispiel: text ("Bla\nBla", 100, 100);
// >>>> Tabulator >>         \t   >> Beispiel: text ("Bla\tBla\", 100, 100);
// >>>> AnfÃ¼hrungszeichen >> \"   >> Beispiel: text ("Bla\"Bla\"", 100, 100);
// >>>> Backslash >>         \\   >> Beispiel: text ("Bla\\Bla", 100, 100);

PFont font;
int fontSize;

void setup ()
{
  size (600, 200);
  smooth();

 // println (PFont.list());

  fontSize = 100;
  font = createFont ("Rockwell", fontSize);
  textAlign (CENTER, BASELINE);
}

void draw ()
{
  background (#A75265);

  fill (255);
  noStroke();

  textFont (font, fontSize);
  textLeading (80);
  text ("Hallo\nWelt!", width/2, height/2);
}

void keyPressed ()
{
  if (key == '0') 
  {
    textAlign (CENTER, BASELINE);
  }

  if (key == '1') 
  {
    textAlign (LEFT, CENTER);
  }
  if (key == '2') 
  {
    textAlign (LEFT, TOP);
  }
  if (key == '3') 
  {
    textAlign (LEFT, BOTTOM);
  }
  if (key == '4') 
  {
    textAlign (RIGHT, CENTER);
  }
  if (key == '5') 
  {
    textAlign (CENTER, TOP);
  }
  if (key == '6') 
  {
    textAlign (CENTER, CENTER);
  }
  if (key == '7') 
  {
    textAlign (CENTER, BOTTOM);
  }
}

