
int counter;

void setup()
{
      //lege die FenstergrÃ�ï¿½Ã�Â¶Ã�ï¿½Ã¯Â¿Â½e fest
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
      image(myBackground, 0, 0); //auf die Reihenfolge achten! was zuerst kommt, ist im Hintergrund
      image(myMarioImage, x, y);
      image(myPouncer, 100, 100);
      
}


void keyPressed() 
{

      if (key == 'd') { // '=' ist zuweisung (bekannt), '==' ist vergleich (fÃ�Â¼r Bedingung)
          if (x < 330)
              x = x + 1;
      }
      
      if (key == 'a') {
          if (x > 40)
              x = x - 1;
      }
      
      if (key == 'w') {
          if (y > 40)
              y = y - 1;
      }
      
      if (key == 's') {
          if (y < 320)
              y = y + 1;
      }
      
    
      if (keyCode == UP) {
          if (y > 40)
              y = y - 1;
      }
              
      if (keyCode == DOWN) {
          if (y < 320)
              y = y + 1;
      }
      
      
      if (keyCode == RIGHT) {
      if (x < 330)
              x = x + 1;
      }
      
      
      if (keyCode == LEFT) {
          if (x > 40)
              x = x - 1;
      }
     
              
              
 
}

