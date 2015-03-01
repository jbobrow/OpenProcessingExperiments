
void setup()
{
//Fenstergröße
size(400, 400);

x = 70;
y = 300;
//Bild laden
myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");

myPouncerImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");

myBackgroundImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
}

void draw()
{ 



if (x < 320)
    x = x + 3;
    

if (y > 40)
    y = y - 3;



//male einen schwarzen Hintergrund
background(0);
//male das Bild (das wir myMarioImage gennant haben) an Position 200, 200

image(myBackgroundImage, 0, 0);

image(myMarioImage, x, y);

image(myPouncerImage, 240, 240);
}
