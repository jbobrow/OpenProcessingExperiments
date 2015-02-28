

int [ ] x=new int[3];
int [ ] y=new int[3];
int [ ] xspeed=new int[3];
int [ ] yspeed=new int[3];

void setup()
{ 
  for (int i=0; i<3; i++)
  {
    x[i]=3*i;
    y[i]=3*i;
    xspeed[i]=15*i;
    yspeed[i]=2*i;
   }
  
    size(400,400);
    
}

void draw()
{
  for (int i=0; i<3; i++)
  {
  x[i]=x[i]+xspeed[i];
  if (x[i]>=width||x[i]<=0)
  {
  xspeed[i]= xspeed[i]*-1;
  }
  
  y[i]=y[i]+yspeed[i];
  if(y[i]>=height||y[i]<=0)
  {
  yspeed[i]=yspeed[i]*-1;
  } 
  
  fill (100,0,500*i);
  rect(x[i],y[i],40,40);
  fill (100*i,0,500);
  ellipse(x[i],y[i],15,30);
  
  
  
  }
 

}


