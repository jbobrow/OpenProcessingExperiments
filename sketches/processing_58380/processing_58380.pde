
int rAmount = 255;

int [] x = new int [rAmount];
int [] y = new int [rAmount];

int [] xS = new int [rAmount];
int [] yS = new int [rAmount];



void setup () 
{ 
  size (500,500);
  
  for(int i = 0; i<rAmount; i++)
  {
    x[i] = 50*(i+1);
    y[i] = 50*(i+1);
    
    xS[i] = i+5; //hiz
    yS[i] = i+1;
  }
  

}

void draw () 
{
  background(100); // arkada kareler kalmamasi icin
  
  for (int i=0; i<rAmount; i++) 
  {
    x[i] = x[i] + xS[i];
    y[i] = y[i] + yS[i];
    
    if (y[i]>=height || y[i]<=0) 
    {
      yS[i]= yS[i]*-1;
    }
    
    if (x[i]>=width || x[i]<=0)
    {
       xS[i]=xS[i]*-1;
    }
    
    rect(x[i],y[i],10,10); // karelerin boyutlari ayni olmasin diyosan 10 yerine x[i], y[i] koy
  }

}

