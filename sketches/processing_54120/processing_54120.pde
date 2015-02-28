
/**
 * Sketch using two grids
 * background: oscillating squares
 * foreground oscillating circles
 * code may contain unused stuff
 * this is a snapshot of a version that I like
 * position of mouse changes the colors of background
 * and foreground
 * click to stop movement
 */
  
int numZelles1 = int(random(5,13));
int numZelles2 = int(random(7,16));
int numZellesTotal1 = 289;
int numZellesTotal2 = 361;
int switch1 = 1;
float col01,col02,col03,col04;

float rad1 = 600/numZelles1;
float rad2 = 600/numZelles2;
float hrad1 = rad1/2;
float hrad2 = rad2/2;
float focus = 110;

PFont fontA;

Zelle[] Zelle1 = new Zelle[numZelles1*numZelles1];
Zelleb[] Zelle2 = new Zelleb[numZelles2*numZelles2];

void setup() 
{
  size(600, 600);
  noStroke();
  smooth();
  colorMode(HSB, 255);
  col01 = random(255);
  col02 = random(220,255);
  col03 = random(120,150);
  
  for (int i = 0; i < numZelles1; i++) {
    for (int j = 0; j < numZelles1; j++)
    {
    // Zelle(float xin, float yin, float din, int idin, float winkelin, Zelle[] oin)
    // Zelle2[numZelles2*i+j] = new Zelleb(i*rad2,j*rad2, hrad2, numZelles1*i+j, random(6.28),random(0.1), Zelle2);
    Zelle1[numZelles1*i+j] = new Zelle(i*rad1,j*rad1, hrad1, numZelles1*i+j, 0,random(0.1,1), Zelle1);
    }
  }
  for (int i = 0; i < numZelles2; i++) {
    for (int j = 0; j < numZelles2; j++)
    {
    // Zelle(float xin, float yin, float din, int idin, float winkelin, float winkelspeed, Zelle[] oin)
    // Zelle2[numZelles2*i+j] = new Zelleb(i*rad2,j*rad2, hrad2, numZelles1*i+j, random(6.28),random(0.1), Zelle2);
    Zelle2[numZelles2*i+j] = new Zelleb(i*rad2,j*rad2, hrad2, numZelles1*i+j, 0 ,random(0.1,1) , Zelle2);
    }
  }
}

void draw() 
{
  background(0);
  for (int i = 0; i < numZelles1; i++) {
    for (int j = 0; j < numZelles1; j++)
    {
    Zelle1[numZelles1*i+j].change_st();
    Zelle1[numZelles1*i+j].display();   
    }
  }
  for (int i = 0; i < numZelles2; i++) {
    for (int j = 0; j < numZelles2; j++)
    {
    Zelle2[numZelles2*i+j].change_st();
    Zelle2[numZelles2*i+j].display();   
    }
  }
}

/* ------------------------- Zelle */

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
    col01 = (255*mouseY/600)%255;
    // col02 = random(255);
    // col03 = random(255);
    
    // move triangles if switch = 1
      
    if (switch1 == 1 )
    {
    
      winkel = (winkel - winkelspeed);
      // winkel_120 = random(6.28);
      // winkel_240 = random(6.28);
            
      d1 = 2*abs(rad01*sin(0.1*winkel));
      
      // center
      
      x1 = x+rad01; // +10*mouseX/600-5;
      y1 = y+rad01; // +10*mouseY/600-5;
      
      
      // points
      /*
      x2 = x1 + hrad1*sin(winkel);
      y2 = y1 + hrad1*cos(winkel);
      x3 = x1 + hrad1*sin(winkel + winkel_120 );
      y3 = y1 + hrad1*cos(winkel + winkel_120 );
      x4 = x1 + hrad1*sin(winkel + winkel_240 );
      y4 = y1 + hrad1*cos(winkel + winkel_240 );
      */
      
      w1 = 2 * rad01;
      w2 = d1;
      
      // y verringern
      // y = y + 0.1*sin(rad01);
      
    }
  }

       
    void display() {
    // stroke(200,200,200); 
    // rotate(winkel);
    
    fill(col01,col02,col03);
    
    rect(x,y,d1,d1);
    // ellipse(x1,y1,rad01,rad01);
    
    // line(x1,y1,x2,y2);
    // stroke(22,255,255);
    // stroke(col01,col02,col03);
    // triangle(x2,y2,x3,y3,x4,y4);
    
    // line(x2,y2,x3,y3);
    // line(x3,y3,x4,y4);
    // line(x4,y4,x2,y2);
   
    
          
    }
}

/* ------------------------------ ZELLE B */

class Zelleb {
  float x, y;
  float rad01;
  float x1,x2,x3,x4,x5,y1,y2,y3,y4,y5,d1;
  float w1,w2;
  float winkel = 0;
  float winkel_120 = 6.28/3;
  float winkel_240 = 6.28*2/3;
  float winkelspeed;
  int id;
  Zelleb[] others;
 
  Zelleb(float xin, float yin, float din, int idin, float winkelin, float winkelspeedin,Zelleb[] oin) {
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
    col01 = (255*mouseX/600)%255;
    // col02 = 125;
    // col03 = 125;
    
    // move triangles if switch = 1
      
    if (switch1 == 1 )
    {
    
      winkel = (winkel + winkelspeed);
      // winkel_120 = random(6.28);
      // winkel_240 = random(6.28);
            
      d1 = 2*rad01*sin(0.01*winkel);
      
      // center
      
      x1 = x+rad01;
      y1 = y+rad01;
      
      
      // points
      /*
      x2 = x1 + hrad2*sin(winkel);
      y2 = y1 + hrad2*cos(winkel);
      x3 = x1 + hrad2*sin(winkel + winkel_120 );
      y3 = y1 + hrad2*cos(winkel + winkel_120 );
      x4 = x1 + hrad2*sin(winkel + winkel_240 );
      y4 = y1 + hrad2*cos(winkel + winkel_240 );
      */
      
      w1 = 2 * rad01;
      w2 = d1;
      
    }
  }

       
    void display() {
    // stroke(200,200,200); 
    fill(col01,col02,col03);
    
    // rect(x1,y1,rad01,rad01);
    ellipse(x1,y1,d1,d1);
    
    // line(x1,y1,x2,y2);
    // stroke(22,255,255);
    // stroke(col01,col02,col03);
    // triangle(x2,y2,x3,y3,x4,y4);
    
    // line(x2,y2,x3,y3);
    // line(x3,y3,x4,y4);
    // line(x4,y4,x2,y2);
    
    
          
    }
}

/* --------------- Maus */

void mouseClicked() {
  if(switch1 == 0) {
    switch1 = 1;
  } else {
    switch1 = 0;
  }
}

