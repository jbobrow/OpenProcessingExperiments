
int[] xspeed=new int[5];
int[] yspeed=new int[5];
int[] x=new int[5];
int[] y=new int[5];

void setup()
{
  size (400,200);
  for (int i=0; i<5; i++)
  {
     x[i]=5*i;  
     y[i]=5*i;
     xspeed[i]=3*i;
     yspeed[i]=4*i;
  }
}
 
void draw()
{
  for(int i=0; i<5; i++) 
  {
     x[i]=x[i]+xspeed[i];

      if (x[i]>=width || x[i]<=0)
      {
       xspeed[i]= xspeed[i]*-1;
       fill(100*i,0,0);
      }
        
      y[i]=y[i]+yspeed[i];
      if(y[i]>=height||y[i]<=0)
      {
        yspeed[i]=yspeed[i]*-1;
        fill(50*i,20,100);
       // rect(x[i],y[i],30,30);
      }
   // fill (0,100,45);
    stroke(0);
    // 25% opacity.
    fill(255,0,0,63);
    rect(x[i],y[i],30,30);
    
  }


}

