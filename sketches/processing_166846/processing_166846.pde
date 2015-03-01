
void setup() 
{
    // lege die fenstergröße fest
    size(400, 400); 
    // lade die bilder (dabei geben wir ihnen einen namen um später darauf zuzugreifen)
    myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
    pouncer = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
    back = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
    // lege variablen für die position an, an der wir mario rendern wollen
    x = 80;
    y = 80; 
}

void draw() 
{
    // rendere zuerst den hintergrund (wichtig, damit er nicht alles überdeckt) an pos (0,0)
    image(back, 0, 0);
    image(myMarioImage, x, y);
    image(pouncer, 240, 240);
}
void draw() 
{
    
    if (x < 30)
        x = 30;
    if (x > 330)
        x = 330;   
    if (y < 30)
        y = 30;
    if (y > 330)
        y = 330;
    
    //v = 1;
    // bewege mario pro frame um einen pixel nach rechts
    //x = x+1;
    // falls er nach rechts aus dem bild läuft
    /*if (x > 400)
    {
        x = 0 // setze ihn zurück nach links
        println("Position-Reset"); // und gib eine meldung aus
             
    }
    */
 
    image(back, 0, 0);
    image(myMarioImage, x, y);
    image(pouncer, 240, 240);
}

void keyPressed() 
 {
     if (key == 'd')
         x = x + 2;
     if (key == 'a')
         x = x - 2;
     if (key == 's')
         y = y + 2;
     if (key == 'w')
         y = y - 2;
         
     if (key == 'j')
         x = x + 2;
     if (key == 'g')
         x = x - 2;
     if (key == 'h')
         y = y + 2;
     if (key == 'z')
         y = y - 2;
         
     if (keyCode == RIGHT)
         x = x + 2;
     if (keyCode == LEFT)
         x = x - 2;
     if (keyCode == DOWN)
         y = y + 2;
     if (keyCode == UP)
         y = y - 2;
        
         
 }
