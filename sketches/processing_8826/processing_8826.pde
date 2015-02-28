
/**
 * Skizze eigener Idee - Dreiecke die sich drehen
 * verlangsamen, und wenn sie zu langsam sind
 * wieder einen Schubs bekommen
 * an- und ausschalten mit Mausklick
 *
 */
  
int numZelles = 4;
int numZellesTotal = 16;
int switch1 = 1;
float col01,col02,col03,col04;
float rad = 600/numZelles;
float hrad = rad/2;
float focus = 110;

PFont fontA;

Zelle[] Zelles = new Zelle[numZelles*numZelles];

void setup() 
{
  size(600, 600);
  noStroke();
  smooth();
  colorMode(HSB, 255);
  col01 = random(255);
  
  for (int i = 0; i < numZelles; i++) {
    for (int j = 0; j < numZelles; j++)
    {
    // Zelle(float xin, float yin, float din, int idin, float winkelin, Zelle[] oin)
    Zelles[numZelles*i+j] = new Zelle(i*rad,j*rad, hrad, numZelles*i+j, random(6.28),random(0.1), Zelles);
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
  float rad01;
  float x1,x2,x3,x4,x5,y1,y2,y3,y4,y5,d1;
  float w1,w2;
  float winkel = 0;
  float winkel_120 = 6.28/3;
  float winkel_240 = 6.28*2/3;
  float winkelspeed;
  int id;
  Zelle[] others;
 
  Zelle(float xin, float yin, float din, int idin, float winkelin, float winkelspeedin,Zelle[] oin) {
    x = xin;
    y = yin;
    rad01 = din;
    id = idin;
    others = oin;
    winkel = winkelin;
    winkelspeed = winkelspeedin;
    
  } 
  
  void change_st() {
    
    // set colors
    col01 = (2*id+winkel)%255;
    col02 = 255;
    col03 = 255;
    
    // move triangles if switch = 1
      
    if (switch1 == 1 )
    {
     winkelspeed = winkelspeed + winkelspeed*random(-0.01,0);
     if (winkelspeed < 0.01) {winkelspeed = random(0.33);}
      winkel = (winkel + winkelspeed );
            
      d1 = rad01*sin(winkel);
      
      // center
      
      x1 = x+rad01;
      y1 = y+rad01;
      
      
      // points
      x2 = x1 + hrad*sin(winkel);
      y2 = y1 + hrad*cos(winkel);
      x3 = x1 + hrad*sin(winkel + winkel_120 );
      y3 = y1 + hrad*cos(winkel + winkel_120 );
      x4 = x1 + hrad*sin(winkel + winkel_240 );
      y4 = y1 + hrad*cos(winkel + winkel_240 );
      
      w1 = 2 * rad01;
      w2 = d1;
      
    }
  }

       
    void display() {
    // stroke(200,200,200); 
    fill(col01,col02,col03);
    // ellipse(x1,y1,rad01,rad01);
    // line(x1,y1,x2,y2);
    stroke(22,255,255);
    triangle(x2,y2,x3,y3,x4,y4);
    /* 
    line(x2,y2,x3,y3);
    line(x3,y3,x4,y4);
    line(x4,y4,x2,y2);
    */
    
          
    }
}

void mouseClicked() {
  if(switch1 == 0) {
    switch1 = 1;
  } else {
    switch1 = 0;
  }
}

