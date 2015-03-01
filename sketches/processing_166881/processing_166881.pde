
int counter;

void setup()
{
      //lege die FenstergrÃ�Â¶Ã�ï¿½e fest
      size(400,400);
      //lade ein Bild unter dem Namen myMarioImage)
       
      back = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
      //Reiehnfolge ebenfalls beachten
       
      myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
      x = 40;
      y = 40;
      pouncer = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
      block = loadImage("http://image.made-in-china.com/74f64j00zSItewvKEpkD/Strong-Aluminum-Alloy-EPS-Mould-EPS-Mold-Icf-Building-Block-Mold.jpg");
      
      v = 1; // allgemeine Geschwindigketi
     
}
  
void draw()
{
KeepPlayerInWindow(); // ruft Funktion auf (void KeepPlayerInWindow)

    if (x == 240 && y == 120)
        println("Kollision");

    if (x == 120 && y == 280)
        println("Kollision");

    image(back, 0, 0);
    image(myMarioImage, x, y);
    image(pouncer, 240, 120);
    image(pouncer, 120, 280);
    image(block, 160, 160);
    
    
      if (x == 160) {
          if (y == 160) {
          setup();
          }
      }
      
     
      
}


void keyPressed() 
{

    if (key == 'd' || keyCode == RIGHT) // d nach retchst und Pfeiltaste nach rechts
        x = x + 40;
    if (key == 'a' || keyCode == LEFT)
        x = x - 40;
    if (key == 'w' || keyCode == UP)
        y = y - 40;
    if (key == 's' || keyCode == DOWN)
        y = y + 40;
}


void KeepPlayerInWindow() // Funktion, dass Mario im GrÃ¼nen Feld bleibt
                          // Kann beliebig benannt werden
{
    

    if (x > 320) // spielfeld nach rechts verlassen?
        x = 320;
    if (x < 40) // spielfeld nach links verlassen?
        x = 40;
    if (y > 320) // spielfeld nach unten verlassen?
        y = 320;
    if (y < 40) // spielfeld nach oben verlassen?
        y = 40;




}
