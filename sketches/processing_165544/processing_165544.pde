
void setup ()
{
    size (500, 500);
    Pacman = loadImage ("http://img3.wikia.nocookie.net/__cb20121107184819/fantendo/images/7/78/PACKMAN.png");
   x = 20;
   y = 20;
  
     
}
 
void draw ()
{   
    background(0);
    image(Pacman,x,y);
     
     
    stroke(0,0,255); // Spielfeld
    fill(0,0,255);
    RandO = rect(0,0,499,20);
    RandU = rect(0,459,499,20);
    RandL = rect(0,0,20,459);
    RandR = rect(479,0,20,459)
    
 }
 
 void keyPressed ()
 {
     if (key == CODED)
     {
         if (keyCode == UP) // nach oben bewegen, aber nur im Spielfeld
         {
          if (y > 20)
          y = y - 10;
          }
         
         if (keyCode == DOWN) // nach unten bewegen, aber nur im Spielfeld
         {
         if ( y < 420)
         y = y + 10;
         }
         
         if (keyCode == RIGHT) // nach rechts bewegen, aber nur im Spielfeld
         {
         if (x < 440)
         x = x + 10;
         }
         
         if (keyCode == LEFT) // nach links bewegen, aber nur im Spielfeld
         {
         if (x > 20)
         x = x - 10;
         }
      }

 
 } 
 
