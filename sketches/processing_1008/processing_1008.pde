


Butterfly flies;      
ViewButterfly viewFlies;   
ShadowOutline shadow;            

int numFlies = 20;

void setup(){
  size (800,600);
  background(255);
  noStroke();

  shadow = new ShadowOutline(width/2, height/2, 100);       
  flies = new Butterfly();                    

  oneFly of = new oneFly (10, 10);
  viewFlies = new ViewButterfly(of);                  
  
  for (int i = 0; i < numFlies; i++)  {
    flies.makePart();
  }
}

void draw(){
  background(255);
  shadow.drawCircle();              
  flies.update();                    
  viewFlies.drawFlies(flies); 
}

////////////////////////////////////////////////////////////////////////////////////

class ShadowOutline{
  float r;
  float cx;
  float cy;
  ShadowOutline (float tempcx, float tempcy, float tempr){
    r = tempr; 
    cx = tempcx;
    cy = tempcy;
  } 

  void drawCircle(){
    fill(160, 158, 158, 75);
    ellipse (mouseX, mouseY, r*2, r*2);
  }
  
  boolean goingToHit(float tempA, float tempB, float tempDa, float tempDb) {
    float a= tempA;
    float b= tempB;
    float dA = tempDa;
    float dB = tempDb;
    
    boolean state = false;                                     
    if (sqrt(sq(a - mouseX) + sq(b - mouseY)) <= r && sqrt(sq(a - dA - mouseX) + sq(b - dB - mouseY)) >= r)  {       
      state = true;
    }
    return state;
  }
}

////////////////////////////////////////////////////////////////////////////////////

class flyMove{
  float x, y, dX, dY;

  flyMove (float tempX, float tempY, float tempdX, float tempdY){
    x = tempX;
    y = tempY;
    dX = tempdX;
    dY = tempdY;
  }
  
  void update()  { 
    if (!shadow.goingToHit(x, y, dX, dY))  {
      x = x + dX;
      y = y + dY;
    }
    if (x >= width || x < 0)  {
      dX = -dX;
    }
    if (y >= height || y < 0)  {
      dY = -dY;
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////

class oneFly{
  int w, h;
  
  oneFly (int tempW, int tempH)  {
    w = tempW;
    h = tempH;
  }

  void drawFly (flyMove fly) {
    fill(252, 93, 236, 30);
    ellipse(fly.x, fly.y, w+20, h+20); 
    fill(252, 93, 236);
    ellipse(fly.x, fly.y, w, h); 
  }
}

////////////////////////////////////////////////////////////////////////////////////

class Butterfly{
  ArrayList  flyList;

  Butterfly () {
    flyList = new ArrayList();
  }

  void makePart()  {                                                                      
    float tempdX = random (-3,3);                                                               
    float tempdY = random(-3,3);
    flyMove newPar = new flyMove(random(100,700), random (50,550), tempdX, tempdY);
    flyList.add(newPar);                                                                    
  }

  void update()  {              
   if (mousePressed && mouseButton == LEFT) {
     if (shadow.r >= 20)  {
       shadow.r = shadow.r - 1;
     } else  { shadow.r = 20; }   
   }
   if (mousePressed && mouseButton == RIGHT){
     if (shadow.r <= 250)  {
       shadow.r = shadow.r + 1;
     } else  { shadow.r = 250; }
   }
    
   for (int i = flyList.size() - 1; i >= 0; i--)  {               
     flyMove p = (flyMove) flyList.get(i);
     p.update();
   }
  }                                                                    
}                                                                      

////////////////////////////////////////////////////////////////////////////////////

class ViewButterfly {
  oneFly v;    

  ViewButterfly (oneFly tempV)  {
    v = tempV;
  }
  
  void drawFlies (Butterfly a)  {
    for (int i = a.flyList.size() - 1; i >= 0; i--) { 
      flyMove p = (flyMove) a.flyList.get(i); 
      v.drawFly(p);
    } 
  }
}


