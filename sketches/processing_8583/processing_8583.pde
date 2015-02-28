
/**
 * Sketch - inspired by some art in  a Museum in Köln
 * random squares - probability changes gradually from 
 * 100% whithe to 100% black
 * however I have added some colors and added a background of
 * changing brightness
 * click to generate a new random value for background brightness
 */
  
int numZelles = 100;
int numZellesTotal = numZelles*numZelles;
int switch1 = 1;
float col01,col02,col03,col04;
float rad = 600/numZelles;
float hrad = rad;
float ratio = 0;
PFont fontA;
float random01;
float bg_brightness = random(255);

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
      ratio = 10 * sqrt(nummer / anzahl);
      random01 = random (0,10);
      // hue
      // col01 = random(255);
      col01 = winkel*10*ratio%255;
      // saturation
      col02 = 500/ratio;
      // Brightness
      
      if ( random01 < ratio ) {  col03 = bg_brightness;} else {  col03 = 25.5*ratio*ratio;}
      
      // col01 = ratio*225%255;
      // col01 = 120;

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
    // text(ratio,x1,y1+10);
    // text(random01,x1,y1+20);
          
    }
}

void mouseClicked() {
  bg_brightness = random(255);
  /*if(switch1 == 0) {
    switch1 = 1;
  } else {
    switch1 = 0;
  } */
}

