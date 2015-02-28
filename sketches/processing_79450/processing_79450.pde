
//CLASSES-------------------------

//PULSE CLASS-------------------------------
class Pulse
{
  float x,y,rad,init_rad;
  float theFill, theAlpha, scaler,growthRate, r,g,b;
  
  Pulse()
  {
    x = random(width);
    y = random(height);
    rad = random(width/40,width/15);
    init_rad = rad;
    theFill = 0;
    theAlpha = random(10,100);
    growthRate = random(.005,.05);
    scaler = 1;
    r = 0;
    g = 0;
    b = 0;
  }
  
  void update()
  {
    if(scaler > 1 || scaler < -1)
    {
      growthRate *= -1;
    }
    
    scaler += growthRate;
  }
  
  void display()
  {
    noStroke();
    fill(r,g,b);
    
    pushMatrix();
      translate(x,y);
      scale(scaler);
      ellipse(0,0,rad,rad);
    popMatrix();
  }
  
  float getX()
  {
     return x; 
  }
  
  float getY()
  {
    return y;
  }
  
  void setColor(float _r, float _g, float _b)
  {
    r = _r;
    g = _g;
    b = _b;
  }
  
}//end class
  

//PULSESTREAK CLASS------------------  
class PulseStreak
{
  float startX, startY, endX, endY, x,y, stepCount, numSteps;
  float growthRate, dx,dy, r,g,b;
  float stepX, stepY, strokeW, strokeColor;
  boolean reachedEnd = false;

  PulseStreak(float sX, float sY, float eX, float eY)
  {
    startX = sX;
    startY = sY;
    endX = eX;
    endY = eY;
    x = sX;
    y = sY;
    dx = eX - sX;
    dy = eY - sY;
    numSteps = 1;
    stepCount = 0;
    stepX = dx/numSteps;
    stepY = dy/numSteps;
    strokeW = random(1,height/100);
    r = g = b = 0;
    
    /*
    dx = startx-endx;
    dy = starty-endy;
    
    stepx = dx/numsteps;
    stepy = dy/numsteps;
    stepcount++;
    while stepcount < numsteps
    x+=stepx
    y+=stepy
    */
    
    growthRate = .2;
  }
  
  void update()
  {
    
    if(stepCount < numSteps){
      stepCount++;
      x += stepX;
      y += stepY;
    }else{
      reachedEnd = true;
    }
  }
  
  void display()
  {
    //stroke(0,0,strokeColor);
    stroke(r,g,b);
    strokeWeight(strokeW);
    line(startX,startY,x,y);
  }
  
  boolean reachedEnd()
  {
    return reachedEnd;
  }
  
  void setColor(float _r, float _g, float _b)
  {
    r = _r;
    g = _g;
    b = _b;
  }
}
  
  
 //STREAK CLASS-----------------------------
class Streak
{
  float x,y,sizeWid,sizeHei, rRange,gRange,bRange;
  float theFill, theAlpha, hGrowthRate, vGrowthRate;
  float deathTime;
  boolean horizontal;
  
  Streak(boolean colorSwitch)
  {
    float start = random(-1,1);
    hGrowthRate = random(width/500,width/10);
    vGrowthRate = random(height/500,height/10);
    
    
    if(colorSwitch)
    {
      rRange = gRange = bRange = 0;
      theAlpha = 255;
    }
    else
    {
      rRange = random(255);
      gRange = random(255);
      bRange = random(255);
      
      theAlpha = random(10,100);
    }
    
    
    if(start >= 0)
    {
      horizontal = true;
      x = 0;
      y = random(height);
      sizeWid = 0;
      sizeHei = random(height/10);
    }
    else
    {
      horizontal = false;
      x = random(width);
      y = 0;
      sizeWid = random(width/10);
      sizeHei = 0;
    }
  }
  
  void update()
  {
    if(horizontal && sizeWid <= width){
      sizeWid += hGrowthRate;
    }
    else if(!horizontal && sizeHei <= height){
      sizeHei += vGrowthRate;
    }
  }
  
  void display()
  {
    noStroke();
    //fill(0,0,random(255), theAlpha);
    //fill(random(255),0,0, theAlpha);
    fill(random(rRange),random(bRange),random(gRange), theAlpha);
    rect(x,y,sizeWid,sizeHei);
 
  }
  
  void resetColor(boolean colorSwitch)
  {
    if(colorSwitch)
    {
      rRange = gRange = bRange = 0;
      theAlpha = 255;
    }
    else
    {
      rRange = random(255);
      gRange = random(255);
      bRange = random(255);
    }
  }
  
}//END CLASS

//GLOBAL VARIABLES
Pulse[] p;
Streak s;
PulseStreak pS;
ArrayList streaks = new ArrayList();
ArrayList pulseStreaks = new ArrayList();
int prevPSEnd = -1;
float r = 0, g = 0, b = 0;
boolean colorSwitch = false;
int changeRate;


//SETUP FUNCTION ---------------------
void setup()
{
  //size(1000,500);
  
  size(1200,600);  
  smooth();
  
  changeRate = (int)frameRate * (int)random(5,30);
  
   p = new Pulse[height/4];
  
  for(int i = 0; i < p.length; i++)
  {
    p[i] = new Pulse();
  }
  //s = new Streak();
  streaks.add(new Streak(colorSwitch));
  
  //pS = new PulseStreak(0,0,width,height);
}



//DRAW FUNCION-----------------
void draw()
{
  
  
  background(r,g,b);
  
  for(int i = 0; i < streaks.size(); i++)
  {
    Streak s1 = (Streak) streaks.get(i);
    s1.update();
    s1.display();
  }
  
  //CREATE STREAK EVERY (FILL IN) SECOND(S)
  if(frameCount % 64 == 0)
  {
    streaks.add(new Streak(colorSwitch));
  }
  
  if(streaks.size() > 10)
  {
    streaks.clear();
  }
  
  //CREATE PULSE STREAKS
  if(frameCount % 32 == 0)
  {
    float sX = 0, sY = 0;
    
    if(pulseStreaks.size() > 0){//check if pulse streak arraylist is empty
      
      PulseStreak pS = (PulseStreak) pulseStreaks.get(pulseStreaks.size()-1);
    
      /*
      if(pS.reachedEnd()){
        sX = p[prevPSEnd].getX();
        sY = p[prevPSEnd].getY();
        
        float range = 10;
        
        //check for pulses within range
        for(int i = 0; i < p.length; i++){
          if((p[i].getX() - sX <= range || p[i].getX() - sX >= range)
          && (p[i].getY() - sX <= range || p[i].getY() - sX >= range)){
            
            float eX = p[i].getX();
            float eY = p[i].getY();
            
            pulseStreaks.add(new PulseStreak(sX,sY,eX,eY));
            prevPSEnd = i;
          }
        }
      }
        */
        
        sX = p[prevPSEnd].getX();
        sY = p[prevPSEnd].getY();
        
        int pulseIndex2 = int(random(p.length-1));
        
        float eX = p[pulseIndex2].getX();
        float eY = p[pulseIndex2].getY();
        
        pulseStreaks.add(new PulseStreak(sX,sY,eX,eY));
        prevPSEnd = pulseIndex2;
      
    }else{
      int pulseIndex1 = int(random(p.length-1));
      int pulseIndex2 = int(random(p.length-1));
      
      sX = p[pulseIndex1].getX();
      sY = p[pulseIndex1].getY();
      
      float eX = p[pulseIndex2].getX();
      float eY = p[pulseIndex2].getY();
    
    
      pulseStreaks.add(new PulseStreak(sX,sY,eX,eY));
      prevPSEnd = pulseIndex2;
    }
  }
  
 
    //pS.display();
    //pS.update();
  
  //s.update();
  //s.display();
  
  for(int i = 0; i < pulseStreaks.size(); i++)
  {
    PulseStreak pS1 = (PulseStreak) pulseStreaks.get(i);
    pS1.setColor(r,g,b);
    pS1.update();
    pS1.display();
  }
  
  if(pulseStreaks.size() > 100)
  {
    pulseStreaks.clear();
  }
  
  for(int i = 0; i < p.length; i++)
  {
    p[i].setColor(r,g,b);
    p[i].update();
    p[i].display();
  }
  
  
  //COLOR CHANGE SETTINGS
  
  if(frameCount % changeRate == 0)
  {
    colorSwitch = !colorSwitch;
    
    if(colorSwitch)
    {
      r = random(255);
      g = random(255);
      b = random(255);
    }
    else
    {
      r = g = b = 0;
    }
    
    for(int i = 0; i < streaks.size(); i++)
    {
      Streak s1 = (Streak) streaks.get(i);
      s1.resetColor(colorSwitch);
    }
    
    changeRate = 32 * (int)random(15,30);
  }
}




