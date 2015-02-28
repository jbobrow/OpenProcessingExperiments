
//ihansen HW11
//copyright2012
//using parallel arrays to create a pseudo screen saver
//that consists of some changeable number of boxes
//bouncing around the window



int MAX = 409;

int [] boxx = new int[MAX];
int [] boxy = new int[MAX];
int [] boxsizes = new int[MAX];
color [] boxcolors= new int[MAX];
int [] speedX = new int[MAX];
int[] speedY=new int[MAX];

void setup()
{
 
  size(400,400);
  stroke(255,255,255);
  smooth();
  for(int i=0; i<MAX; i++) {
    boxx[i] = int(random(0, width));
    boxy[i] = int(random(0, height));
    boxsizes[i] = int(random(10, width/8));
    boxcolors[i] = color(random(200), random(150), random(100), 80);
    speedX[i] = int(random(1,20));
    speedY[i] = int(random(1,20));
  }
}

void draw()
{
  stupidBoxes();
}

void stupidBoxes()
{
  for(int i=0; i<MAX; i++) {
    fill(boxcolors[i]);
    rect(boxx[i], boxy[i], boxsizes[i], boxsizes[i]);
    boxx[i] += speedX[i];
    boxy[i] += speedY[i];
    
    if (boxx[i]>=width || boxx[i]<=0)
    {
      speedX[i]= -speedX[i];
    }
    if (boxy[i]>=height || boxy[i]<=0)
    {
      speedY[i] = -speedY[i];
    }
    
    
    
  }
}
