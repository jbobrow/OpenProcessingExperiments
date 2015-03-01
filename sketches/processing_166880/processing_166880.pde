
void setup() 
{
    size(400, 400); 
    myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
    pouncer = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
    back = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
    x = 80;
    y = 80; 
}

void draw() 
{

keepPlayerInWindow ();


if (IsSameFile (x, y, 120,280))
setup ();

if (IsSameFile (x, y, 240, 120))
setup();


    image(back, 0, 0);
    image(myMarioImage, x, y);
    image(pouncer, 240, 120);
    image(pouncer, 120, 280);
}

var IsSameFile (x1, y1, x2, y2)
{
return (x1 == x2 && y1 == y2)
}

void keepPlayerInWindow () 
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


void keyPressed() // wird von processing immer aufgerufen wenn eine taste gedrÃ¼ckt wird
{
    if (key == 'd' || key == '3')
        x = x + 40;
    if (key == 'a' || key == '1') 
        x = x - 40;
    if (key == 'w' || key == '5') 
        y = y - 40;
    if (key == 's' || key == '2') 
        y = y + 40;

}
