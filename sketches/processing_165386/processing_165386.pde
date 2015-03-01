
int counter;
 
void setup()
{
      //lege die FenstergrÃ�Â¶Ã�ï¿½e fest
      size(400,400);
      //lade ein Bild unter dem Namen myMarioImage)
      
      myBackground = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
      //Reiehnfolge ebenfalls beachten
      
      myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
      x = 40 + round(random(280)); //40 wegen Rand oben + links; random280 ist der grÃ�Â¼ne Bereich, bei dem die linke obere            Ecke von Mario erscheinen darf
      y = 40 + round(random(280)); //Mario erscheint irgendwo
      myPouncer = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
     
    
}
 
void draw()
{ 
   
      //male einen weiÃ�ï¿½en Hintergrund
      background(255);
      //male das bild (das wir myMarioImage genannt haben) an position 200, 200
      image(myBackground, 0, 0); //auf die Reihenfolge achten! was zuerst kommt, ist im Hintergrund
      image(myMarioImage, x, y);
      
      x += (320 - x) / 40;  // (Rechter rand - position) / geschwindigkeit
      y += (40 - y) / 40;   // (Oberer rand - position) / geschwindigkeit
     
      image(myPouncer, 100, 100);
}
