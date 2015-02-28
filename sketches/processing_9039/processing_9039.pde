
int actRandomSeed = 0;
int count = 100;
int pSecond = second();
int factor = 0;
float faderX = 0;
float rad = 0;
boolean animate = false;
float angle = radians(360/float(count));
PFont font;
color c = color( 0, 130, 164 );
int a = 0;

void setup() {
  size(500,500); 
  smooth();
  frameRate(40);
  
  font = loadFont("YanoneKaffeesatz-Bold-150.vlw");
  textFont(font);
  textMode(CENTER);
  textAlign(CENTER);
  textSize(20);
  
  noStroke();
}

void draw() {
  background(255);
  noStroke();
  randomSeed(1);
  
  checkSignalForAnimation();
  
  generateAnimationFader();
    
  drawSmallEllipses();

  drawLargeEllipse(); 
  
  displaySeconds();
}


/*
  
- taktsignal holen
- factor bestimmen
- animation starten

*/
void checkSignalForAnimation() {
  
  // nur wenn eine neue sekunde angebrochen ist
  if(second() != pSecond) {
    
    // gerade oder ungerade sekunde? factor ändern
    if(second()%2 == 0) // even
      factor = 1;
    else
      factor = -1;
    
    // animation starten
    animate = true;
  }
  pSecond = second();
}



/*

fader für die animation generieren

*/
void generateAnimationFader() {
  
  // wenn animation gestartet
  if(animate) {
    
    // je nach factor von 0 zu half_pi ... oder umgekehrt
    if( factor == 1 )
      rad += (HALF_PI-rad)*0.1;
    else
      rad -= rad*0.1;
    
    // wenn das ziel erreicht wurde ... animation beenden
    if( rad < 0 || rad > HALF_PI )
      animate = false;
    
    // minimal, maximal werte berücksichtigen
    rad = constrain( rad, 0, HALF_PI );
  }
  
  // rad (0 bis half_pi) ind faderX (0 bis 1) übersetzen
  faderX = sin(rad);
}





void drawSmallEllipses() {
  fill(c);
  for (int i=0; i<count; i++) {
    // positions
    float randomX = random(0,width);  
    float randomY = random(0,height);
    float circleX = width/2 + cos(angle*i)*100;
    float circleY = height/2 + sin(angle*i)*100;
    
    /*
    lerp übersetzt den faderX-wert in einen
    wert zwischen randomX/Y und circleX/Y
    0 = randomX/Y
    1 = circleX/Y
    */
    float x = lerp( randomX, circleX, faderX );
    float y = lerp( randomY, circleY, faderX );

    ellipse(x,y,5,5);
  }
}



/*
großen kreis anzeigen
*/
void drawLargeEllipse() {
  fill(0,230);
  ellipse(250,248,lerp(0,125,faderX),lerp(0,125,faderX));
}



/*

uhrzeit darstellen

*/
void displaySeconds() {
  a = int(lerp(0,255,faderX));
  fill(255,a);
  String h = "";
  String s = "";
  if(hour() < 10) h = "0";
  if(second() < 10) s = "0";
  text(h+hour()+":"+minute()+":"+s+second(), 250, 254);
}

