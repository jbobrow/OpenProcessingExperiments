
int counter;
 
void setup()
{
      //lege die FenstergrÃ¶Ã�e fest
      size(400,400);
      //lade ein Bild unter dem Namen myMarioImage)
      
      myBackground = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
      //Reiehnfolge ebenfalls beachten
      
      myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
      x = 200;
      y = 200;
      myPouncer = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
      v = 1; // allgemeine Geschwindigketi
    
}
 
void draw()
{ 
   
      //male einen schwarzen Hintergrund
      background(255);
      //male das bild (das wir myMarioImage genannt haben) an position 200, 200
      image(myBackground, 0, 235); //auf die Reihenfolge achten! was zuerst kommt, ist im Hintergrund
      image(myMarioImage, x, y);
   
      if (x<360)
      x = x + v; // 1 ist normale Geschwindigkeit, "0.5" halbe Geschwindigkeit
                 // v allgemein definiert als Geschwindigkeit
                 
      if (x>400){x = -30} // if (frage) {wenn die Bedingung richtig ist, dann XXX in der geschweiften Klammer}
      else {} // wenn nicht, dann ...
      image(myPouncer, 100, 100);
     
}
