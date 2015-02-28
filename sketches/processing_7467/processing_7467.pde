
/**
 * Skizze eigener Idee - Farbsterne, kreisend, Grösse ändern mit Mausposition
 * an- und ausschalten mit Mausklick
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
float mouseFactor;
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
    
      mouseFactor = 50/( 50 + sqrt(abs(x+rad01-mouseX)*abs(x+rad01-mouseX) + 
         abs(y+rad01-mouseY)*abs(y+rad01-mouseY))); 
      
      winkel = (winkel + .01);
      
      col01 += 0.05;
      col02 = 210 + 45*sin(0.25*winkel);
      col03 = 170 + 85*sin(0.131*winkel);
      
      d1 = 0.97*abs(rad01*sin(1*winkel));
      
      x_center = x + rad01;
      y_center = y + rad01;
      
      x_factor = mouseFactor; 
      y_factor = mouseFactor;
      
      x1 = x_center - x_factor * rad01;
      x2 = x_center - x_factor * d1;
      x3 = x_center;
      x4 = x_center + x_factor * d1;
      x5 = x_center + x_factor * rad01;
      
      y1 = y_center - y_factor * rad01;
      y2 = y_center - y_factor * d1;
      y3 = y_center;
      y4 = y_center + y_factor * d1;
      y5 = y_center + y_factor * rad01;
      
     
      
    }
  }

       
    void display() {
      
    
    
    translate (radius2*cos(cellspeed*winkel),radius2*sin(cellspeed*winkel));
      
        
    if (d1 > 0 )
    {
    
    fill((col01+15)%255,col02,col03);
    rect(x1,y1,(x2-x1),(x2-x1));
    
    fill((col01+15)%255,col02,col03);
    rect(x1,y4,(x2-x1),(x2-x1));
    
    fill((col01+15)%255,col02,col03);
    rect(x4,y1,(x2-x1),(x2-x1));
    
    fill((col01+15)%255,col02,col03);
    rect(x4,y4,(x2-x1),(x2-x1));
    
    fill((col01+143)%255,col02,col03);
    rect(x2,y2,(x4-x2),(x4-x2));
    
    fill((col01+224)%255,col02,col03);
    triangle(x1,y1,x1,y2,x5,y2);
    
    fill((col01+192)%255,col02,col03);
    triangle(x5,y5,x5,y4,x1,y4);
       
    fill((col01+128)%255,col02,col03);
    triangle(x1,y5,x2,y5,x2,y1);
    
    fill((col01+160)%255,col02,col03);
    triangle(x5,y1,x4,y1,x4,y5);
    
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

