
int []x=new int[4];
int []y=new int[4];
int[]xspeed=new int[4];
int[]yspeed=new int[4];


void setup ()
{
  size(800,400);
  stroke(100);
  for(int i=0;i<4; i++){
  x[i]=90*i;
  y[i]=93*i;
  xspeed[i]=5*i;
  yspeed[i]=4*i;
   }
   
 }

void draw()
{
    
  for(int i=0; i<4; i++)
  {
  x[i]=x[i]+xspeed[i];
  if (x[i]>=800||x[i]<=0)
  {
  xspeed[i]=xspeed[i]*-1;
  fill(300*i,0,0);
  }
  y[i]=y[i]+yspeed[i];
  if(y[i]>=400||y[i]<=0)
   {
    yspeed[i]=yspeed[i]*-1;
    }
  fill(0,0,100*i);
  rect(x[i],y[i],20,20);
  fill(200*i,0,0);
 ellipse(x[i],y[i],30,30); 
  
  
  
  }
  
}

