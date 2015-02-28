
int []x=new int[4];
int []y=new int[4];
int[]xspeed=new int[4];
int[]yspeed=new int[4];


void setup ()
{
  size(600,400);
  stroke(200);
  for(int i=0;i<4; i++){
  x[i]=1*i;
  y[i]=10*i;
  xspeed[i]=1*i;
  yspeed[i]=1*i;
   }
   
 }

void draw()
{
    
  for(int i=0; i<4; i++)
  {
  x[i]=x[i]+xspeed[i];
  if (x[i]>=600||x[i]<=0)
  {
  xspeed[i]=xspeed[i]*-1;
  fill(200*i,0,0);
  }
  y[i]=y[i]+yspeed[i];
  if(y[i]>=400||y[i]<=0)
   {
    yspeed[i]=yspeed[i]*-1;
    }
  fill(0,0,100*i);
  rect(x[i],y[i],10,30);
  fill(0,0,90*i);
 rect(x[i],y[i],10*i,30); 
  
  
  
  }
  
}

