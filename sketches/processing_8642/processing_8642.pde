
/**
 * Karos - Inspiriert durch ein Kunstwerk von Peter Struyken
 * Komputerstruktur
 * Übergang von weiss nach schwarz
 * wahrscheinlichkeit ändert sich von 100% weiss
 * zu 100% schwarz oder entsprechend einer Funktion
 * eingebaut sind 5 verschiedene Funktionen
 * 1 - Quadratwurzel
 * 2 - linear
 * 3 - quadratisch
 * 4 - (1 + sinus) eine Periode
 * 5 - (1 + sinus) mehrere Perioden
 */
  
int numZelles = 100;
int numZellesTotal = numZelles*numZelles;
int switch1 = 1;
int switch2 = 1;
float col01,col02,col03,col04;
float rad = 600/numZelles;
float hrad = rad;
float ratio = 0;
PFont fontA;
float random01;

Zelle[] Zelles = new Zelle[numZelles*numZelles];

void setup() 
{
  size(600, 600);
  noStroke();
  smooth();
  colorMode(HSB, 255);
  col01 = random(255);
  frameRate(5);

  
  fontA = loadFont("Monospaced.plain-12.vlw"); 
  textFont(fontA); 
  
  for (int i = 0; i < numZelles; i++) {
    for (int j = 0; j < numZelles; j++)
    {
    Zelles[numZelles*i+j] = new Zelle(i*rad,j*rad, numZelles*i+j, numZellesTotal, 1, Zelles);
    }
  }
}

void draw() 
{
  background(0);
  for (int i = 0; i < numZelles; i++) {
    for (int j = 0; j < numZelles; j++)
    {
    Zelles[numZelles*i+j].change_st();
    Zelles[numZelles*i+j].display();   
    }
  }
}

class Zelle {
  float x, y;
  float nummer;
  int anzahl;
  float x1,x2,x3,x4,x5,y1,y2,y3,y4,y5,d1;
  float w1,w2;
  float winkel = 0;

  Zelle[] others;
 
  Zelle(float xin, float yin, float din, int idin, float winkelin, Zelle[] oin) {
    x = xin;
    y = yin;
    nummer = din;
    anzahl = idin;
    others = oin;
    winkel = winkelin;
    
  } 
  
  void change_st() {
    if (switch1 == 1 )
    {
    
      winkel = (winkel + 0.5);
      // berechne einen Wert zwischen 0 und 10
      
      if ( switch2 == 1)
      { ratio = 10 * sqrt(nummer / anzahl);}
      else if ( switch2 == 2)
      { ratio = 10 * (nummer / anzahl);}
      else if ( switch2 == 3)
      { ratio = 10 * sq(nummer / anzahl);}
      else if ( switch2 == 4)
      { ratio = 5 + 5 * sin(3.14*nummer / anzahl);}
      else if ( switch2 == 5)
      { ratio = 5 + 3 * sin(3.14*x/600) + 3 * sin(3.14*y/600);}
      else if ( switch2 == 6)
      { ratio = 5 + 3 * sin(9*3.14*x/600) + 3 * sin(9*3.14*y/600);}
      else if ( switch2 == 0)
      { ratio = 5 + 5 * sin(9*3.14*nummer / anzahl);}
      ;
      
      //Berechne Zufallszahl zwischen 0 und 10
      random01 = random (0,10);
      col01 = 255;//winkel*10*ratio%255;
      
      // Falls Zufallszahl unter der berechneten Zahl liegt setze schwarz
      // Falls Zufallszahl über der berechneten Zahl liegt: weiss
      if ( random01 < ratio ) {  col03 = 10;} else {  col03 = 255;}
      
      // col01 = ratio*225%255;
      // col01 = 120;
      col02 = 1;
      // col03 = 255;
      
      d1 = nummer*sin(winkel);
      
      x1 = x;
      y1 = y;
      
      w1 = 2 * nummer;
      w2 = d1;
      
    }
  }

       
    void display() {
    stroke(10); 
    fill(col01,col02,col03);
    rect(x1,y1,rad,rad);
    fill(100,100,100);
    text(ratio,x1,y1+10);
    // text(random01,x1,y1+20);
          
    }
}

void mouseClicked() {
  switch2 = (switch2 + 1)%7;
  
  /*
  if(switch1 == 0) {switch1 = 1;} else {switch1 = 0;}
  */
}

