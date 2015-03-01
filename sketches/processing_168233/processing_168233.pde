
void setup()
{
    size(400, 400);
    myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
    pouncer = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
    back = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
    x = 80;
    y = 80;
    p1 = 240;
    q1 = 120;
    p2 = 120;
    q2 = 280;
    v1 = 2;
    v2 = 2;
   
}
 
void draw()
{
    if (x > 320) // spielfeld nach rechts verlassen?
        x = 320;
    if (x < 40) // spielfeld nach links verlassen?
        x = 40;
    if (y > 320) // spielfeld nach unten verlassen?
        y = 320;
    if (y < 40) // spielfeld nach oben verlassen?
        y = 40;
        
    
         
    if (IsSameField(x, y, p1, q1))
        setup();
    if (IsSameField(x, y, p2, q2))
        setup();
        
        q1 = q1 + v1;
        if (q1 < 40)
            v1 = -v1;
        if (q1 > 320)
            v1 = -v1;
            
        p2 = p2 + v2;
         if (p2 < 40)
            v2 = 2;
       
        if (p2 > 200)
            v2 = -2;
 
    image(back, 0, 0);
    image(myMarioImage, x, y);
    image(pouncer, p1, q1);
    image(pouncer, p2, q2);
}
void keyPressed() // wird von processing immer aufgerufen wenn eine taste gedrückt wird
{
    if (key == 'd')
        x = x + 40;
    if (key == 'a')
        x = x - 40;
    if (key == 'w')
        y = y - 40;
    if (key == 's')
        y = y + 40;
    if (key == '3')
        x = x + 40;
    if (key == '1')
        x = x - 40;
    if (key == '5')
        y = y - 40;
    if (key == '2')
        y = y + 40;
}
 
var IsSameField(x1, y1, x2, y2) {
 
    return (x1 == x2 && y1 == y2);
}
