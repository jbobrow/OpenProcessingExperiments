
/**
 * Skizze eigener Idee - Farbsterne, kreisend, ein Ball bewegt sich,
 * Winkelteilung ändert sich mit Ball
 *
 */
  
int numZelles = 14;
int switch1 = 1;
float col01,col02,col03,col04;
float rad = 600/numZelles;
float hrad = rad / 2;
float focus = 110;
float rot_speed = random(0.005,0.2);
float radius2 = 40;
float x_center, y_center;
float r30_fix = 3.14/6;
float r30;
float mouseFactor,mouseDistance;
float xrad,yrad;
float mover_x = 300;
float mover_y = 300;
float blickwinkel, winkel01;
float mover_speedx = 2.3;
float mover_speedy = 3.2;
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
    Zelles[numZelles*i+j] = new Zelle(i*rad,j*rad, hrad, i, 1, Zelles,random(-5,5));
    }
  }
}

void draw() 
{
  background(0);
  mover_x = mover_x + mover_speedx;
  if ( mover_x > 600 || mover_x < 0)
  { mover_speedx = mover_speedx*(-1);}
  
  mover_y = mover_y + mover_speedy;
  if ( mover_y > 600 || mover_y < 0 )
  { mover_speedy = mover_speedy*(-1);}
  
  ellipse (mover_x,mover_y,10,10);
    
  
  
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
  float x1,y1,d1;
  float winkel = 0;
  float cellspeed ;
  int id;
  Zelle[] others;
 
  Zelle(float xin, float yin, float din, int idin, float winkelin, Zelle[] oin,float cellspeedin) {
    x = xin;
    y = yin;
    
    rad01 = din;
    id = idin;
    others = oin;
    winkel = winkelin;
    cellspeed = cellspeedin;
    
  } 
  
  void change_st() {
    if (switch1 == 1 )
    {
      x_center = x + rad01;
      y_center = y + rad01;
      
      mouseDistance = sqrt(sq(x_center-mover_x) + sq(y+rad01-mover_y));
         
      mouseFactor = 100/mouseDistance; 
      
      winkel = (winkel + .01);
      
      col01 += 0.0005;
      col02 = 210 + 45*sin(0.25*winkel);
      col03 = 170 + 85*sin(0.131*winkel);
        
     
      
           
      d1 = 0.2*abs(rad01*sin(1*winkel));
      
      r30 = r30_fix/mouseFactor;
      
      winkel = mouseFactor;
      
      xrad = 500*r30_fix/mouseFactor;
      yrad = 500*r30_fix/mouseFactor;
      
      x1 = x_center;
      y1 = y_center;
        
    }
  }

       
    void display() {
      
   // translate (radius2*cos(cellspeed*winkel),radius2*sin(cellspeed*winkel));
      
        
    if (d1 > 0 )
    {
    
    if (mouseDistance != 0) 
      { 
        
        winkel01 = asin((mover_y - y1)/mouseDistance);
        
        if ( y1 > mover_y  && x1 > mover_x)
        { blickwinkel = 3.14 - winkel01 ;}
        
        if ( y1 > mover_y && x1 < mover_x ) 
        { blickwinkel = winkel01;}
        
        if ( y1 < mover_y && x1 < mover_x ) 
        { blickwinkel = 6.28 + winkel01;}
        
        if ( y1 < mover_y && x1 > mover_x ) 
        { blickwinkel = 3.14 -  winkel01;}
        
        
      }
       
      
 
      
    fill((col01+100*mouseFactor)%255,col02,col03);
    
    arc(x1,y1,xrad,yrad,blickwinkel-0.1-3.14,blickwinkel+0.1-3.14);
    
    //stroke(100);
    //line(x1,y1,mover_x,mover_y);
       
    // translate (-radius2*cos(cellspeed*winkel),-radius2*sin(cellspeed*winkel));
    
    }
    }
}
    

void mouseClicked() {
  if(switch1 == 0) {
    switch1 = 1;
  } else {
    switch1 = 0;
  }
}


