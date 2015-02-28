
int appletWidth=900;
int appletHeight=500;
int rectSize=5;

int movingValue1=1;
int movingValue1Dir=1;
int movingValue2=100;
int movingValue2Dir=-1;

int redVal,greenVal,blueVal;
int redDir,greenDir,blueDir;

int switchN;
int switchDir=1;

void setup() 
{
  redVal=100;
  greenVal=150;
  blueVal=120;
  
  redDir=1;
  greenDir=1;
  blueDir=1;
  

  switchN=int(random(45)+1);
  size(900, 500);
  noStroke(); //No rect borders
}

void draw() 
{
  
  drawRects();
  movingValues();
 
}

void movingValues()
  {
   if(movingValue1<=0||movingValue1>=1000)
     movingValue1Dir*=-1;
    
    if(movingValue2<=0||movingValue2>=1000)
     movingValue2Dir*=-1;
     
     if(redVal<=0||redVal>=255)
     redDir*=-1;
     
     if(greenVal<=0||greenVal>=255)
     greenDir*=-1;
     
     
     if(blueVal<=0||blueVal>=255)
     blueDir*=-1;
     
     if(int(random(2))==1)
     redVal+=redDir;
     
     if(int(random(2))==1)
     blueVal+=blueDir;
     
     if(int(random(2))==1)
     greenVal+=greenDir;
     
     
     if(switchN<=1||switchN>=46)
     switchDir*=-1;
     
     if(int(random(50))==1)
     switchN+=switchDir;
    
    movingValue1+=movingValue1Dir;
    movingValue2+=movingValue2Dir;
    
  }

void drawRects()
{
 for(int x=0;x<appletWidth;x+=rectSize)
 for(int y=0;y<appletHeight;y+=rectSize)
  {
    fill((redVal+getColor(x,y,switchN))%255,(greenVal+getColor(x,y,switchN))%255,(blueVal+getColor(x,y,switchN))%255);
    rect(x,y,rectSize,rectSize);
  }
}

int getColor(int x,int y,int switchNum)
  {
    x=Math.abs(x);
    y=Math.abs(y);
    
    switch(switchNum)
    {
    case 1:return  (x/(y+1)+1)%255;
    case 2: return (x^y)%255;
    case 3: return (abs(y*x+y+movingValue2)%255);
    case 4: return (x*2+y*movingValue1)%255;
    case 5: return (movingValue1+x)%255;
    case 6: return (x/(movingValue1+1)+1)*100%255;
    case 7: return (int)sqrt(movingValue1*x*100)%255;
    case 8: return ((abs(y*movingValue1)/(x+1))+2)%255;
    case 9: return (x|y|movingValue1)%255;
    case 10: return (x&y&movingValue1)*x%255;
    case 11: return ((x)|movingValue1)%255;
    case 12: return (x^movingValue1|y)%255;
    case 13: return (x|y|movingValue1+1)%255;
    case 14: return(x|y&movingValue1)%255;
    case 15: return (x|y)&(x|movingValue1)%255;
    case 16: return (x|y|movingValue1)%255;
    case 17: return abs(x-y-movingValue1&x)%255;
    case 18: return ((x*y)|(x+y)*movingValue2)%255;
    case 19: return (((x+1)%(y+1))|movingValue1)%255;
    case 20: return (((x+1)%(y+1))|(movingValue2&y))%255;
    case 21: return ((abs(x-movingValue1)+1)&(abs(y-movingValue2)+1))%255;
    case 22: return (movingValue1+(x|y)|(x&y))%255;
    case 23: return ((((int)pow(x, 2)+y)/15)*movingValue1)%255;
    case 24: return (((int)pow(x, 2)+1)|movingValue1|y)%255;
    case 25: return abs((x+y)|(x-movingValue1)+50)%255;
    case 26: return ((x & ~y) ^ movingValue1) %255;
    case 27: return (x^y|movingValue1+150)%255;
    case 28: return (((x&y)*(x|y))|movingValue1)%255;
    case 29: return((x&y)*movingValue1)%255;
    case 30: return (x^movingValue1|movingValue2)*(x|y)%255;
    case 31: return((((y*movingValue1)/(x+1))+1)%255)*(x^y|movingValue1+150)%255;
    case 32: return((x&y)^(x|y|movingValue1))%255;
    case 33: return(abs(x*~y^x*movingValue2)/(movingValue1+1))%255;
    case 34: return(((x|y^x)&y|x|movingValue1|movingValue2&x*y))%172;
    case 35: return ((x|y&x|x|y|x^x|y|movingValue1))*(movingValue1)%255;
    case 36: return (200+x*y|x|movingValue1)%255;
    case 37: return ((x|y&x|y|movingValue1*(int)cos(x))*movingValue2+100)%255;
    case 38: return ((x%(y+1))|y)%255;
    case 39: return (~((~x)|(~y)))%255;
    case 40: return abs((int) ((y%600)*sin(x)));
    case 41: return (int) abs( ((((sin(y)+1)*255)+((cos(x)+1)*255))/2));
    case 42: return 0;
    case 43: return abs(((int)((movingValue1)*sqrt(y))));
    case 44: return (int)(x+~y);
    case 45: return(int)(abs(x-550 + y-300));
    
    
    default: return y*movingValue1%255;
    }

    
  }

