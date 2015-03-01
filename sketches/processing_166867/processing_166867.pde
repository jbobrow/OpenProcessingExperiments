
int counter;

void setup()
{
      //lege die FenstergrÃ¶Ã�e fest
      size(400,400);
      //lade ein Bild unter dem Namen myMarioImage)
       
      myBackground = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
      //Reiehnfolge ebenfalls beachten
       
      myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
      x = 40;
      y = 40;
      myPouncer1 = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
      myPouncer2 = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
      myBlock = loadImage("http://image.made-in-china.com/74f64j00zSItewvKEpkD/Strong-Aluminum-Alloy-EPS-Mould-EPS-Mold-Icf-Building-Block-Mold.jpg");
      
      v = 1; // allgemeine Geschwindigketi
     
}
  
void draw()
{
    
      //male einen schwarzen Hintergrund
      background(255);
      //male das bild (das wir myMarioImage genannt haben) an position 200, 200
      image(myBackground, 0, 0); //auf die Reihenfolge achten! was zuerst kommt, ist im Hintergrund
      image(myMarioImage, x, y);
      image(myPouncer1, 160, 200);
      image(myPouncer2, 120, 120);
      image(myBlock, 320, 240);
      
      
      //Kollisionsabfrage
      
      if (x == 160) {
          if (y == 200) {
          setup();
          
          }
      }
      
      
      //Mario darf nicht gegen Block laufen
      
     
      
      
}


void keyPressed() 
{

      if (key == 'd') { // '=' ist zuweisung (bekannt), '==' ist vergleich (fÃ¼r Bedingung)
          if (x < 320)
              x = x + 40; // Bewegt sich im Raster um je 40
      }
      
      if (key == 'a') {
          if (x > 40)
              x = x - 40;
      }
      
      if (key == 'w') {
          if (y > 40)
              y = y - 40;
      }
      
      if (key == 's') {
          if (y < 320)
              y = y + 40;
      }
      
    
      if (keyCode == UP) {
          if (y > 40)
              y = y - 40;
      }
              
      if (keyCode == DOWN) {
          if (y < 320)
              y = y + 40;
      }
      
      
      if (keyCode == RIGHT) {
          if (x < 320)
              x = x + 40;
      }
      
      
      if (keyCode == LEFT) {
          if (x > 40)
              x = x - 40;
}
     
              
      
 
}
