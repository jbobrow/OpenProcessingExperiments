
/**
 * Skizze eigener Idee - Farbstern
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
    Zelles[numZelles*i+j] = new Zelle(i*rad,j*rad, hrad, i, 1, Zelles);
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
  int id;
  Zelle[] others;
 
  Zelle(float xin, float yin, float din, int idin, float winkelin, Zelle[] oin) {
    x = xin;
    y = yin;
    
    rad01 = din;
    id = idin;
    others = oin;
    winkel = winkelin;
    
  } 
  
  void change_st() {
    if (switch1 == 1 )
    {
    
      winkel = (winkel + .01);
      rotate (rot_speed*winkel);
      col01 += 0.05;
      col02 = 210 + 45*sin(0.25*winkel);
      col03 = 170 + 85*sin(0.131*winkel);
      
      d1 = 0.97*abs(rad01*sin(0.1*winkel));
      
      x1 = x;
      x2 = x + rad01 - d1;
      x3 = x + rad01;
      x4 = x + rad01 + d1;
      x5 = x + 2*rad01;
      
      y1 = y;
      y2 = y + rad01 - d1;
      y3 = y + rad01;
      y4 = y + rad01 + d1;
      y5 = y + 2*rad01;
      
      w1 = rad01 - d1;
      w2 = d1;
      
    }
  }

       
    void display() {
    
    /* fill(col01%255,col02,col03);
    triangle(x1,y5,x4,y4,x3,y3);
    
    fill((col01+32)%255,col02,col03);
    triangle(x3,y3,x5,y1,x2,y2);
    
    fill((col01+64)%255,col02,col03);
    triangle(x3,y3,x1,y1,x2,y4);
    
    fill((col01+96)%255,col02,col03);
    triangle(x3,y3,x5,y5,x4,y2); */
    
    
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
    
    
    
    
    
    }
    
   /*  if (d1 < 0 )
    {
    
    fill((col01+224)%255,col02,col03);
    triangle(x5,y5,x2,y2,x2,y1);
    
    fill((col01+128)%255,col02,col03);
    triangle(x5,y1,x1,y4,x2,y4);
      
    fill((col01+192)%255,col02,col03);
    triangle(x4,y5,x4,y4,x1,y1);
    
    fill((col01+160)%255,col02,col03);
    triangle(x4,y2,x1,y5,x5,y2); 
    
    
    
    } */
    
    
    
    
  
    
    /* fill((col01+224)%255,col02,col03);
    rect(x1,y2,rad01,w2);
    
    fill((col01+192)%255,col02,col03);
    rect(x1,y1,rad01,w1);
    
    fill((col01+160)%255,col02,col03);
    rect(x3,y1,w2,rad01);
    
    fill((col01+128)%255,col02,col03);
    rect(x4,y1,w1,rad01); */
    
    }
}

void mouseClicked() {
  if(switch1 == 0) {
    switch1 = 1;
  } else {
    switch1 = 0;
  }
}

