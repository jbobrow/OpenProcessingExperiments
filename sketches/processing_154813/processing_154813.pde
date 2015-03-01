
PFont font;

void setup ()
{
  size (600, 200);
  smooth();
  background (#57385c);
  frameRate (30);
  font = createFont ("Arial", 24);
  textFont (font, 24);
  textAlign (CENTER, CENTER);
}
 
 
 void draw ()
 {
 background (#57385c);
 String txt = timestamp ();
 text (txt, width/2, height/2);
 }

String timestamp ()
{
    // nf () ist eine Funtktion, die ganze Zahlen in Strings umwandelt
    // nf () formatiert die Zahl in gewünschter Art und Weise
    
    /**
     * bei nf (4, 3) gibt die 3 die Anzahl der Stellen an, die das Ergebnis haben soll
     * und 4 die Zahl, die in ein String umgewandelt werden soll 
     * das Ergebnis ist also "004"
     */ 
    String s = "";
    s = s + nf (year(), 4) + nf (month(), 2) + nf (day(), 2);
    s = s + "_";
    s = s + nf (hour(), 2) + nf (minute(), 2) + nf (second(), 2);
    
 return s;
}
