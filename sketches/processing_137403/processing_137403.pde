
float timer = 0;
float x = 0;
float y = 0;
float x2 = 0;
float y2 = 0;
PFont Broadway;
PFont Bauhaus;
PFont Viner;
PFont Old;
PFont Jokerman;
PFont Cracked;
PFont Comic;
PFont Harrington;
PFont Goudy;

void setup ()
{
  size ( 500, 500);
  Broadway = createFont ("Broadway", 32);
  Bauhaus  = createFont ("Bauhaus 93", 50);
  Viner    = createFont ("Viner Hand ITC Regular", 60);
  Old      = createFont ("Old English Text MT", 55);
  Jokerman = createFont ("Jokerman", 40);
  Cracked  = createFont ("CF Crack and Bold", 35);
  Comic    = createFont ("Comic Sans MS", 80);
  Harrington = createFont ("Harrington", 60);
  Goudy    = createFont ("Snap ITC", 100);
   
}

void draw()
{
  background( 10);
  frameRate = 1/30;
  timer = timer + frameRate;
  x = x + 1;
  y = y + 1;
  x2 = x2 + 2;
  y2 = y2 + 2;
  fill (229, 186, 42);
  textFont (Old);
  textAlign (LEFT, TOP);
  
  text("Stuck Up", (510 - x), 250);
  text("Rich", (680 - x), 50);
  text("Conceited", ( 780 - x), 450);
  
  fill (227, 169, 204);
  textAlign (CENTER);
  textFont (Comic);
  text("annoying", 160, (-250 + y2));
  text("loud", 350, ( 750 - y2));
  
  fill(3, 95, 162);
  textFont(Broadway);
  text("Simple", (-350 + x2), 400);
  text("Ordinary", (750 - x2), 110);
  
  fill( 15, 95, 14);
  textFont(Viner);
  text("scary", 100, (- 700 + y2));
  text("observant", ( 950 - x2), 400);
  text("loner", 360, (1050 - y2));
  
  fill( 234, 220, 166);
  textFont (Jokerman);
  text("funny", 400, (2000 + y2));
  text("silly", 200, (2100 - y2));
  text("sunny", (-2000 + x2), 275);
  
  fill( 252, 115, 115);
  textFont (Bauhaus);
  text("kind", (- 2200 + x2), 140);
  text("outgoing", 350, (-2250 + y2));
  text("caring", (2300 - x2), 260);
  
  fill ( 195, 243, 245);
  textFont( Harrington);
  text("Joyful", 200, (-2400 + y2));
  text("Quirky", (-2500 + x2), 160);
  text("Random", (2600 - x2), 410);
  text("Open", 365, ( - 2700 + y2));
  
  fill (235, 245, 195);
  textFont(Goudy);
  text("Happy", 250, (-1600 + y));
}
  


