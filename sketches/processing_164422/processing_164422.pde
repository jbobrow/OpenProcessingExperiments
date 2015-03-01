
void setup() 
{
// lege die fenstergröße fest
    size(400, 400); 
// lade ein bild (unter dem namen myMarioImage)
    myMarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png"); 
// lade den pouncer für Aufgabe 1.2
    myPouncerImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
// lade den background für Aufgabe 1.3
    Background1 = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
// lade animiertes sonic gif aus internet
    mySonicImage = loadImage("http://www.dan-dare.org/Dan%20Sonic/SonicRunSmallAni.gif");
// Variablen für die Position von Mario
    x = 40;
    y = 180;
    s = 1; // Geschwindigkeit von Mario
}

void draw() 
{
// male einen schwarzen hintergrund
    background(0);
// male das hintergrundbild
    image(Background1, 0, 0);
// male das bild (das wir myMarioImage genannt haben) an position 200, 200
    image(myMarioImage, x, y);
    image(myPouncerImage, 200, 37);
    image(mySonicImage, 0, 0);

// Debug Ausgabe: Gibt Position von Mario aus
    println("Position von Mario: x ist " + x + " und y is " + y);  

// Mario soll kontinuierlich nach rechts laufen
    x = x + s;
// Mario soll zurückgesetzt werden, wenn er links an den Bildrand kommt
    if (s > 0){
        println("Mario läuft nach rechts")
        };
    if (s < 0){
        println("Mario läuft nach links")
        };

// Mario soll nach links laufen wenn er rechts angekommen ist und nach rechts wenn er links ankommt 

  if (x < 39) {
    s = +5;
  } 

  if (x > 331) {
    s = -5;
  }
}
