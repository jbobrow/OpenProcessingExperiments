
void setup() 
{
    size(400, 400); 
    myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
    x = 200;
    y = 200;
    pouncer = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
    back = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg"); 
}

void draw() 
{
    image(back, 0, 0);
    image(myMarioImage, 80, 80);
    image(pouncer, 240, 240);
}
