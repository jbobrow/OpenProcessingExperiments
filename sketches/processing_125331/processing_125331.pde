
float gravity = 0.05;
ArrayList p;
class Particle
{
  private float oPx,oPy;
  private float pX,pY;
  private float vX,vY;
  private float aX,aY;
  private float radius;
  private int timer;
  private boolean son;
  private int col;
  private int myArrayNumber;
  private boolean exists;
  Particle(float _pX, float _pY,float _aX,float _aY, float _radius, int _timer, boolean _son ,int _col,int arrayNumber)
  {
    oPx = _pX;
    oPy = _pY;
    pX = _pX;
    pY = _pY;
    aX = _aX;
    aY = _aY;
    radius = _radius;
    timer = _timer;
    son = _son;
    col = _col;
    exists = true;
    myArrayNumber = arrayNumber;
  }
  
  public int explode()
  {
     if(!son)
     {
          for(int i=1 ; i < N ; i++)
          {
            p.add(new Particle(pX,pY,random(-0.5,0.5),random(-1,0),radius,-40,true,(int)random(255),p.size()));
          }
     }
     return myArrayNumber;
  }
  
  public void tick()
  {
    if(timer < 40 && exists)
    {
      fill(255,255-col,col);
      stroke(255,255-col,col);
      strokeWeight(radius);
      line(oPx,oPy,pX,pY);
      aY+=gravity;// gravidade
      
      vX+=aX;// atualiza velocidade
      vY+=aY;
      
      oPx = pX;
      oPy = pY;
      
      pX+=vX;// atualiza posição
      pY+=vY;
      
      timer++;
      
      if(pY > height)
      {
        //vY = -vY;
      }
      if(pX > width)
      {
        vX = -vX;
      }
      if(pX < 0)
      {
        vX = -vX;
      }
      if(pY < 0)
      {
        vY = -vY;
      }
    }
    else if(timer == 40 && exists)
    {
       
      explode();
      timer++;
    }
    else if(timer == 80 && exists)
    {
      if(!son)
       {
        p.add(new Particle(random(width),height,random(-0.5,0.5),-1.3,radius,0,false,255,0));
        exists = false;
       }
    }
    else if(timer < 100 && exists)
    {
      fill(255,255-col,col);
      ellipse(pX,pY,radius,radius);
      aY+=gravity;// gravidade
      
      vX+=aX;// atualiza velocidade
      vY+=aY;
      
      pX+=vX;// atualiza posição
      pY+=vY;
      
      timer++;
      
      if(pY > height)
      {
        //vY = -vY/2;
      }
      if(pX > width)
      {
        vX = -vX/2;
      }
      if(pX < 0)
      {
        vX = -vX/2;
      }
      if(pY < 0)
      {
        vY = -vY/2;
      }
    }
    else if(exists)
    {
      exists = false;
    }
  }
}


int N = 100;
Particle aux;
void setup()
{
  p = new ArrayList();
  size(640,640);
  background(0);
  smooth();
  noStroke();
   p.add(new Particle(random(width),height,random(-0.5,0.5),-1,4,0,false,255,0));
} 
int w=0;
void draw()
{
  for(int i=0 ; i<p.size() ; i++)
  {
      aux = (Particle)p.get(i);
      aux.tick();
  }
  fill(0,20);
  noStroke();
  quad(0,0,width,0,width,height,0,height);

} 

