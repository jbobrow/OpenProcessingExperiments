
void setup() 
{
// lege die fenstergrÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¶Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½e fest
    size(400, 400); 
// lade ein bild (unter dem namen myMarioImage), Mario schaut nach rechts
    myMarioImage_right = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png"); 
// Mario schaut nach links
    myMarioImage_left = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario-flip.png"); 
// lade den pouncer fÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¼r Aufgabe 1.2
    myPouncerImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
// lade den background fÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¼r Aufgabe 1.3
    Background1 = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
// lade animiertes sonic gif aus internet
    mySonicImage = loadImage("http://www.dan-dare.org/Dan%20Sonic/SonicRunSmallAni.gif");
// Variablen fÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¼r die Position und Bewegung von Mario
    x = 40;
    y = 180; // 324 unterer Rand, 31 oberer Rand
    s = 0; // Geschwindigkeit von Mario links rechts
    t = 0; // Geschwindigkeit von Mario hoch runter
    g = 1; // Geschwindigkeit global
    //String r = "rechts"; // Richtung als string? WTF?
    r = 1; // Richtung 1 fÃ�Â¼r links, 0 fÃ�Â¼r rechts, lÃ�Â¤dt das entsprechende bild
}

void draw() 
{
// male einen schwarzen hintergrund
    background(0);
// male das hintergrundbild
    image(Background1, 0, 0);
// male Mario und die Gegner
    //image(myMarioImage_right, x, y);
    image(myPouncerImage, 200, 37);
    image(mySonicImage, 0, 0);

// Mario soll sich bewegen, um s nach rechts oder links, um t nach oben oder unten
    x = x + s;
    y = y + t;

  if (keyPressed == false) {
    s = 0;
    t = 0;
    r = r;
    } 

// Debug Ausgabe: Gibt Position von Mario aus
    println("Position von Mario: x ist " + x + " und y is " + y);  

// Mario soll nach links schauen, wenn er nach links lÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¤uft

    if (r == 1){
        println("Mario schaut nach rechts")
        image(myMarioImage_right, x, y);
        };
        
    if (r == 0){
        println("Mario schaut nach links")
        image(myMarioImage_left, x, y);
        };


/* Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½bung 1-3 Ohne Input
// Mario soll kontinuierlich nach rechts laufen
    x = x + s;

// Mario soll nach links laufen wenn er rechts angekommen ist und nach rechts wenn er links ankommt 

  if (x < 39) {
    s = +5;
  } 

  if (x > 331) {
    s = -5;
  }
  */
  
  // Mario soll nur auf den grÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¼nen Feldern laufen
  
  if (x < 39) {
    x = 39;
  } 

  if (x > 331) {
    x = 331;
  }
  
  if (y < 39) {
    y = 39;
  } 

  if (y > 324) {
    y = 324;
  }
  
  
}

void keyPressed() // Was passieren soll, wenn eine Taste gedrÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¼ckt wird, wird bei jedem Tastendruck aufgerufen
{
      
    // WASD 
    
    while (key == 'd'){ // wenn D gedrÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¼ckt wurde
        s = g; 
        r = 1;}
                
    if (key == 'a'){
        s = -g;
        r = 0;}
                
    if (key == 'w')
        
        t = -g;

    if (key == 's')
        
        t = g;
        
    // Cursor-Tasten
    
    if (keyCode == RIGHT){ // wie wenn D gedrÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¼ckt wurde
        s = g;
        r = 1;}
               
    if (keyCode == LEFT) {
        s = -g;
        r = 0;}
               
    if (keyCode == UP)
        
        t = -g;
    
    if (keyCode == DOWN)
        
        t = g;
}
