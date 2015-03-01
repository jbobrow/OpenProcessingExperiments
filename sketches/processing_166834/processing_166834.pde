
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

void draw() {

    
    
    image(back, 0, 0);
    image(myMarioImage, x, y);
    image(pouncer, 240, 240);
    
}
void keyPressed() {
        if (key == 'd') // "=" is zuweisung (bekannt), "==" ist vergleich (für Bedingungen)
            x=x+4;
        if (key == 'a')
            x=x-4;
        if (key == 'w') 
            y=y-4;
        if (key == 's')
            y=y+4;
    }        
