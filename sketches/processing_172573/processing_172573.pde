
void setup()
{
  size(400, 400);
  
  myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
  pouncer = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
  back = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
  
  x = 80;
  y = 80;
  
  /*    x = 320; 
        y = 80;  // weit Rechts starten
  
        x = 80;
        y = 320; // Links unten starten
   */
}


void draw()
{ 
  x = x + 1;
  y = y + 1; // Diagonal nach Rechts Unten laufen
  
  /*     x = x - 1; // Richtungswechsel
  
         x = x + 1;
         y = y - 1; // Diagonal nach Rechts Oben laufen
  
  */
          
  
  image(back, 0, 0);
  image(myMarioImage, x, y);
  image(pouncer, 240, 240);
}
