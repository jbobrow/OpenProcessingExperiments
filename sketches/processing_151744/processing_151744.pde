
PFont font = createFont ("Arial", 24);
int fontSize = 24;

int value = 10;
int modulo = 2;

void setup ()
{
  size (600, 200);
  smooth();

  textFont (font, fontSize);
  textAlign (LEFT);
}

void draw ()
{
  background (#57385c);
  noStroke();

  // HEADLINE ------------------------------------------

  int x = 150;
  int y = 50;
  fill (#ffedbc);
  text ("Modulo (%)", x, y);

  // MODULO -----------------------------------------------

  y +=fontSize*2;
  String displayModulo = str (value) + " % " + str (modulo) + " = ";
  fill (255);
  text (displayModulo, x, y);

  x += textWidth (displayModulo);

  fill (#A75265);
  text (str (value%modulo), x, y);

  // DIVISION ----------------------------------------------

  fill (255);

  x = 150;
  y+= fontSize;

  String displayDivision = str (value) + " / " + str (modulo) + " = " + str ( int (value/modulo));

  text (displayDivision, x, y);

  String remain = " Remain: " + str (value - int (value/modulo)*modulo);

  fill (#A75265);
  x += textWidth (displayDivision);

  text (remain, x, y);

  // GEGENRECHNUNG ------------------------------------------------------------s--

  x = 150;
  y+= 2*fontSize;


  String displayMultiplication = str (int (value/modulo)) + " * " + str (modulo) + " = " + str (int (value/modulo)*modulo);

  fill (#ffedbc);
  text (displayMultiplication, x, y);

  x += textWidth(displayMultiplication);

  fill (#A75265);
  text (" + " + str (value%modulo), x, y);

  x += textWidth (" + " + str (value%modulo));
  
  fill (#ffedbc);
  text (" = " + str (value), x, y);
}

void keyPressed ()
{
  if (key == '+') value++;
  if (key == '-') value--;

  if (key == 'm') modulo++;
  if (key == 'n') modulo--;
}

