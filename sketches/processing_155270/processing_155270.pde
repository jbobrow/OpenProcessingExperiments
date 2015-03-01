
PFont font;
int fontSize = 24;


void setup ()
{
  size (600, 200);
  smooth();

  font = createFont ("Arial", fontSize);
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
  text ("Casting", x, y);
  
   // values ---------------------------------
   
   int zaehler = 50;
   int nenner = 11;
  
  // int ---------------------------------
  
  fill (#A75265);
  y +=fontSize*2;
  String txt = str (zaehler) + " / " + str (nenner) + " = " + str ((int) (zaehler/nenner));
  text (txt, x, y);
  
  // float ---------------------------------
  
  fill (#ffffff);
  y +=fontSize*2;
  txt = "(float) " + str (zaehler) + " / " + str (nenner) + " = " + str ((float) zaehler/nenner);
  text (txt, x, y);
  
  

 
}

