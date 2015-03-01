
ddvoid setup() 
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
    KeepPlayerInWindow();
        
        //Kollisionsabfrage
    if (IsSameField (x, y, 240, 240))
       setup();
        
    if (IsSameField (x, y, 120, 120))
       setup();
    


    image(back, 0, 0);
    image(myMarioImage, x, y);
    image(pouncer, 240, 240);
    image(pouncer, 120, 120);
}
void keyPressed()
{
    if (key == 'd')
        x = x + 40;
    if (key == 'a') 
        x = x - 40;
    if (key == 'w') 
        y = y - 40;
    if (key == 's') 
        y = y + 40;
}

void KeepPlayerInWindow()
{
    if (x > 320) // spielfeld nach rechts verlassen?
        x = 320;
    if (x < 40) // spielfeld nach links verlassen?
        x = 40;
    if (y > 320) // spielfeld nach unten verlassen?
        y = 320;
    if (y < 40) // spielfeld nach oben verlassen?ss
        y = 40;
}

var IsSameField(x1, y1, x2, y2)
{
    return (x1 == x2 && y1 == y2);
}
