


int x=200;

int noofants=1;

Ant[] a=new Ant[noofants];
void setup()
{
  size(1200, 700);
  smooth();
  for(int i=0;i<noofants;i++)
  {
    a[i]=new Ant(random(300,900),random(200,500),random(360));
  }
}
int count=0;
void draw()
{
  background(255);
  for(int i=0;i<noofants;i++)
  {
    a[i].compute();
  }
}














class Ant{
  
  public float x;
  public float y;
  public float theta;
  
  private float speed=1;
  private float currtime;
  private float walktimepluscurr=0;
  private float randdir;
  private float maxdiffa=60;
  private int shouldwait=0;
  private int freewalk=0;
  Ant(float x,float y,float theta)
  {
    this.x=x;
    this.y=y;
    this.theta=theta;
  }
  public void draw()
  {
    fill(150,140,120);
    
    line(x,y,x+10*cos(PI*(theta+50)/180),y+10*sin(PI*(theta+50)/180));
    line(x,y,x+10*cos(PI*(theta-50)/180),y+10*sin(PI*(theta-50)/180));
    line(x,y,x+8*cos(PI*(theta+90)/180),y+8*sin(PI*(theta+90)/180));
    line(x,y,x+8*cos(PI*(theta-90)/180),y+8*sin(PI*(theta-90)/180));
    line(x,y,x+10*cos(PI*(theta+140)/180),y+10*sin(PI*(theta+140)/180));
    line(x,y,x+10*cos(PI*(theta-140)/180),y+10*sin(PI*(theta-140)/180));
    ellipse(this.x,this.y,10,10);
    ellipse(x+7.5*cos(PI*theta/180),y+7.5*sin(PI*theta/180),5,5);
    //line(x,y,x+40,y);
    
  }
  public void walk()
  {
    if(shouldwait!=1)
    {
    
    x+=speed*cos(theta*PI/180);
    y+=speed*sin(theta*PI/180);
    }
  }
  
  public void compute()
  {
    currtime=millis();
    if(walktimepluscurr<currtime)
    {
    walktimepluscurr=currtime+random(300,700);
    randdir=randomGaussian()*maxdiffa;
    println();
    float var=random(100);
    if(var<20)
    shouldwait=1;
    else
    {
      shouldwait=0;
      theta+=randdir;
    }
    }
    speed=random(1,1.2);
    walk();
    draw();
  }
  
  
};


