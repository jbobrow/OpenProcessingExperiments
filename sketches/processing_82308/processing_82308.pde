
//ihansen
//2012
//practice exam 3

int MAX = 7;

int[] figureY = new int[MAX];
int[] figureX = new int[MAX];

int[]figureSizes = new int[MAX];
color [] figureColorA = new int[MAX];
color [] figureColorB = new int[MAX];

int deltaX, deltaY;




void setup()
{

size (600,600);
smooth();


for (int i=0; i <MAX; i++)
{
 figureY[i] = int(random(0,height));
 figureX[i] = int(random(0,width));
 figureSizes[i] = int(random(2,width/8));
 figureColorA[i]= color (random(200),random(150), random(100), 80);
 figureColorB[i]= color (random(100), random(50), random(120), 100);
 deltaY=1;
 deltaX=1;
}

}


void draw()
{
  background(255,230,220);
  stupidFigure();
}

void stupidFigure()
{
  for(int i=0; i<MAX; i++)
  {
    dumbFigure(figureX[i], figureY[i], figureSizes[i], figureColorA[i], figureColorB[i]);
    figureY[i] = figureY[i] + deltaY;
    figureX[i] = figureX[i] + deltaX;
    
    if (figureX[i] >=width)
    {
     figureX[i]=0;
    }
    if (figureY[i] >=height)
    {
      figureY[i]=0;
    }
    
}

  
}


void dumbFigure(float x, float y, float diam, color A, color B)
{
 fill(A);
 ellipse(x,y,(6*diam), (6*diam));
 fill(B);
 ellipse(x,y,(3*diam), (3*diam));
 fill(A);
 ellipse(x,y,diam, diam);
 }


void keyPressed()
{
  deltaY=int(random(1,5));
  deltaX=int(random(1,5));
}


void mousePressed()
{
  for(int i=0; i<MAX; i++)
  {
    figureColorA[i]= color (random(110), random(110), random(10), 60);
    figureColorB[i]= color (random(200), random(200), random(130), 120);
  }
}
