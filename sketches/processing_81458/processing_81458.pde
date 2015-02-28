
PImage img;

float sizInc = 0.9;
float splatSizDec = 0.7;
float dripSizDec = 0.7;
float splatSlow = 0.135;
float splatGrav = 0.1;
float dripSlow = 0.03;
float minSpeed = 0.8;
float maxOffset = 5;
float maxSiz = 20;
float maxKay = 350;
float maxJay = 350;
float maxVar = 300;
float maxDots = 12;
float mousX = 50;
float prevMousX;
float mousY = 50;
float prevMousY;
float mousVX;
float mousVY;
float time = 0;
ArrayList paintDots;
 
void setup() 
{
    size(600, 450);
    background(0);
  
  img = loadImage("background.png");
   background(img);
  smooth();
  paintDots = new ArrayList();
}

void draw() { 
  updateAll();  
  fade();
  time += 0.01;
} 

void fade()
{
  if(time > 15)
  {
    fill(255,255,255,30);
    rect(0,0,600,450);
    time = 0;
  }
  if(mousePressed && (mouseButton == RIGHT))
  {
    for(int i = paintDots.size()-1; i >= 0; i--)
    {  paintDots.remove(i);  }
    fill(255,255,255);
    rect(0,0,700,500);
  }
}

void updateAll()
{
  prevMousX = mousX;
  prevMousY = mousY;
  mousX = mouseX;
  mousY = mouseY;
  mousVX = mousX - prevMousX;
  mousVY = mousY - prevMousY;
  if(mousePressed && (mouseButton == LEFT))
  {   
      int n = (int)pow(random(0,maxDots),2);
      float Jay = random(-1*maxJay,maxJay);
      float Kay = random(-1*(maxKay-Jay),maxKay-Jay);
      float Var = random(0,maxVar);
      for(int i = 0; i < n; i++)
      {
        paintDots.add(new paintDot(mousX, mousY, Jay,Kay,Var));
      }
   }
   updateDots();
}

void updateDots()
{
    print(paintDots.size());
    for (int i = paintDots.size()-1; i >= 0; i--) 
    { 
      paintDot drop = (paintDot)paintDots.get(i);// An ArrayList doesn't know what it is storing so we have to cast the object coming out
      drop.update();
      drop.display();
      if (drop.finished()) 
      {
        paintDots.remove(i); 
      }
    }
}

class paintDot { 
  float x, y, vx, vy, siz, prevx,prevy, slow, sizDec,life,vectorVar,vectorJay,vectorKay;
  int r,g,b;
  boolean dripping;
  paintDot (float moux, float mouy, float vJ, float vK, float vV) { 
    r = (int)random(0,10);
    g = (int)random(0,5);
    b = (int)random(0,5);
    vectorKay = vK;
    vectorVar = vV;
    vectorJay = vJ;
    slow = splatSlow;
    sizDec = splatSizDec;//random(0,splatSizDec);
    float offsetX = pow(random(0,maxOffset),2);
    float offsetY = pow(random(0,maxOffset),2);
    x = moux + random(-1,1)*offsetX;
    y = mouy + random(-1,1)*offsetY;
    vx = vectorJay + random(-1*vectorVar,vectorVar); 
    vy = vectorKay + random(-0.75*vectorVar,vectorVar);
    siz = random(1,maxSiz); 
  } 
  
  void update() { 
    vx *= slow;
    vy *=slow;
    if(dripping == false)
    {  vy += splatGrav; }
    prevx = x;
    prevy = y;
    x += vx;
    y += vy;
    siz = (siz * sizDec) + sizInc;
    if(dripping)
    {  siz -= (int)(sizInc);  }
    //print("Dot at " + x + ", " + y + "\nvx = " + vx + "\nvy = " + vy + "\nsiz = " + siz);
  }
 
   void display()
  {
    stroke(#FCC03D);
    strokeWeight((int)siz);
    line(x,y,prevx,prevy);
  } 
  
  boolean finished()
  {
    if(vx*vx + vy < minSpeed)
    {
      if(dripping == false)
      {
        dripping = true;
         slow = random(dripSlow,1);
         sizDec = dripSizDec;
         vx = 0;
         vy = pow(random(0,1.5),2);
         return false;  }
      else{
        return true;
      }
    }
    else
    {
      return false;
    }
  }
}

