
int []x=new int[4];
int []y=new int[4];
int[]xspeed=new int[4];
int[]yspeed=new int[4];


void setup ()
{
  size(400,400);
  stroke(200);
  for(int i=0;i<4; i++){
  x[i]=4*i;
  y[i]=2*i;
  xspeed[i]=2*i;
  yspeed[i]=1*i;
   }
   
 }

void draw()
{
    
  for(int i=0; i<4; i++)
  {
  x[i]=x[i]+xspeed[i];
  if (x[i]>=400||x[i]<=0)
  {
  xspeed[i]=xspeed[i]*-1;
  fill(100*i,220,0);
  }
  y[i]=y[i]+yspeed[i];
  if(y[i]>=400||y[i]<=0)
   {
    yspeed[i]=yspeed[i]*-1;
    }
  fill(0,200*i,100*i);
  ellipse(x[i],y[i],40,30);
  fill(200*i,0,0);
 ellipse(x[i],y[i],10,30); 
  
  
  
  }
  
}

