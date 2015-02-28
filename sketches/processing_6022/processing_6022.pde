
/**
 * Skizze nach Richard paul Loohse, Bewegung um eine Achse
 * an- und ausschalten mit Mausklick
 *
 */
  
int numBalls = 2;
int switch1 = 1;
float col01,col02,col03,col04;
float rad = 440/numBalls;
float hrad = rad / 2;
float focus = 110;

PFont fontA;

Ball[] balls = new Ball[numBalls*numBalls];

void setup() 
{
  size(440, 440);
  noStroke();
  smooth();
  colorMode(HSB, 255);
  col01 = random(255);
  col02 = random(255);
  col03 = random(255);
  col04 = random(255);
  
  for (int i = 0; i < numBalls; i++) {
    for (int j = 0; j < numBalls; j++)
    {
    balls[numBalls*i+j] = new Ball(i*rad,j*rad, hrad, i, 1, balls);
    }
  }
}

void draw() 
{
  background(0);
  for (int i = 0; i < numBalls; i++) {
    for (int j = 0; j < numBalls; j++)
    {
    balls[numBalls*i+j].change_st();
    balls[numBalls*i+j].display();   
    }
  }
}

class Ball {
  float x, y;
  float rad01;
  float x1,x2,x3,x4,x5,y1,y2,y3,y4,y5,d1;
  float w1,w2;
  float winkel = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, float winkelin, Ball[] oin) {
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
      
      d1 = 0.5*abs(sin(winkel))*rad01;
      
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
        
        
    
    fill(col01,230,255);
    rect(x1,y3,w1,rad01);
    
    fill((col01+255*w2/rad01)%255,55+2*255*w2/rad01,240);
    rect(x2,y3,w2,rad01);
    
    fill(col02,230,255);
    rect(x3,y4,rad01,w1);
    
    fill((col02+255*w2/rad01)%255,55+2*255*w2/rad01,240);
    rect(x3,y3,rad01,w2);
    
    
    fill((col03+255*w2/rad01)%255,55+2*255*w2/rad01,240);
    rect(x1,y2,rad01,w2);
    
    fill(col03,230,255);
    rect(x1,y1,rad01,w1);
    
    fill((col04+255*w2/rad01)%255,55+2*255*w2/rad01,240);
    rect(x3,y1,w2,rad01);
    
    fill(col04,230,255);
    rect(x4,y1,w1,rad01); 
    
    fill((col04+255*w2/rad01)%255,255,190);
    
    ellipse(x+rad01+(rad01-20)*sin(0.1*winkel),y+rad01+(rad01-20)*cos(winkel),40,40);
    
    
  
    }
}

void mouseClicked() {
  if(switch1 == 0) {
    switch1 = 1;
  } else {
    switch1 = 0;
  }
}

