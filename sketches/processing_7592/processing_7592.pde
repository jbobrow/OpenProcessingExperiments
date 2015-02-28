
/**
 * Skizze eigener Idee - Farbsterne, kreisend, ein Ball bewegt sich,
 * Winkelteilung ändert sich mit Ball
 *
 */
  
int numZelles = 4;
int switch1 = 1;
float col01,col02,col03,col04;
float rad = 600/numZelles;
float hrad = rad / 2;
float focus = 110;
float rot_speed = random(0.005,0.2);
float radius2 = 40;
float x_center, y_center,x_factor, y_factor;
float r30_fix = 3.14/6;
float r30;
float mouseFactor;
float mover_x = 300;
float mover_y = 300;
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
  float x1,x2,x3,x4,x5,x6,x7,y1,y2,y3,y4,y5,y6,y7,d1;
  float xi1,xi2,xi3,xi4,xi5,xi6,xi7,yi1,yi2,yi3,yi4,yi5,yi6,yi7;
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
    
      mouseFactor = 399/( 50 + sqrt(abs(x+rad01-mover_x)*abs(x+rad01-mover_x) + 
         abs(y+rad01-mover_y)*abs(y+rad01-mover_y))); 
      
      winkel = (winkel + .01);
      
      col01 += 0.05;
      col02 = 210 + 45*sin(0.25*winkel);
      col03 = 170 + 85*sin(0.131*winkel);
      
      
      
      
      x_center = x + rad01;
      y_center = y + rad01;
      
      x_factor = mouseFactor; 
      y_factor = mouseFactor;
      
      d1 = 0.2*abs(rad01*sin(1*winkel));
      r30 = r30_fix*mouseFactor;
      
      x1 = x_center + sin(winkel) * rad01;
      x2 = x_center + sin(winkel + 2*r30) * rad01;
      x3 = x_center + sin(winkel + 4*r30) * rad01;
      x4 = x_center + sin(winkel + 6*r30) * rad01;
      x5 = x_center + sin(winkel + 8*r30) * rad01;
      x6 = x_center + sin(winkel + 10*r30) * rad01;
      x7 = x_center + sin(winkel + 12*r30) * rad01;
      
      y1 = y_center + cos(winkel) * rad01;
      y2 = y_center + cos(winkel + 2*r30 ) * rad01;
      y3 = y_center + cos(winkel + 4*r30 ) * rad01;
      y4 = y_center + cos(winkel + 6*r30 ) * rad01;
      y5 = y_center + cos(winkel + 8*r30 ) * rad01;
      y6 = y_center + cos(winkel + 10*r30 ) * rad01;
      y7 = y_center + cos(winkel + 12*r30 ) * rad01;
      
      xi1 = x_center + sin(winkel + 1*r30) * d1;
      xi2 = x_center + sin(winkel + 3*r30) * d1;
      xi3 = x_center + sin(winkel + 5*r30) * d1;
      xi4 = x_center + sin(winkel + 7*r30) * d1;
      xi5 = x_center + sin(winkel + 9*r30) * d1;
      xi6 = x_center + sin(winkel + 11*r30) * d1;
      xi7 = x_center + sin(winkel + 13*r30) * d1;
      
      yi1 = y_center + cos(winkel + 1*r30) * d1;
      yi2 = y_center + cos(winkel + 3*r30 ) * d1;
      yi3 = y_center + cos(winkel + 5*r30 ) * d1;
      yi4 = y_center + cos(winkel + 7*r30 ) * d1;
      yi5 = y_center + cos(winkel + 9*r30 ) * d1;
      yi6 = y_center + cos(winkel + 11*r30 ) * d1;
      yi7 = y_center + cos(winkel + 13*r30 ) * d1;
      
    }
  }

       
    void display() {
      
   translate (radius2*cos(cellspeed*winkel),radius2*sin(cellspeed*winkel));
      
        
    if (d1 > 0 )
    {
    
        
    fill((col01+32)%255,col02,col03);
    triangle(x1,y1,xi1,yi1,x2,y2);
    
    fill((col01+64)%255,col02,col03);
    triangle(x2,y2,xi2,yi2,x3,y3);
       
    fill((col01+128)%255,col02,col03);
    triangle(x3,y3,xi3,yi3,x4,y4);
    
    fill((col01+160)%255,col02,col03);
    triangle(x4,y4,xi4,yi4,x5,y5);
    
    fill((col01+192)%255,col02,col03);
    triangle(x5,y5,xi5,yi5,x6,y6);
    
    fill((col01+224)%255,col02,col03);
    triangle(x6,y6,xi6,yi6,x7,y7);
    
    
    translate (-radius2*cos(cellspeed*winkel),-radius2*sin(cellspeed*winkel));
    
    
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

