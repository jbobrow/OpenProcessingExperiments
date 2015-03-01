
PVector[] blobs = new PVector[20];
float[]   m = new float[20];
float[]   h = new float[20];

void setup()
{
  rectMode(CENTER);
  size(600, 400);
  background(0);
  smooth();
  fill(0);
  noStroke();
  strokeJoin(ROUND);
  frameRate(30);
  for (int idx=0; idx < blobs.length; idx++)
  {
    blobs[idx]= new PVector(300+random(30),random(30));  
  }
  
  
}

void draw()
{
  noStroke();
  for (int idx=0; idx < blobs.length; idx++)
  {
    int valuex = floor(2*random(3) - 2*random(3));
    int valuey = floor(2*random(7) - 3*random(3));
    float cx = blobs[idx].x+valuex;
    float cy = blobs[idx].y+valuey; 
    if (cx < 0)
    {
      cx = 500; 
    }
    if (cx > 600)
    {
       cx = 500;
    }
    if (cy < 0)
    {
      cy = 0; 
    }  
    if (cy > 400)
    {
      cy = 0; 
    }  
    blobs[idx] = new PVector(cx, cy);  
  }

   background(0);
   
   for (int x=0; x<600; x+=4)
   {
     for (int y=0; y<400; y+=4)
     {
       float result = 0;
       for (int idx=0; idx < blobs.length; idx++)
       {     
         m[idx] = mag(x-blobs[idx].x, y-blobs[idx].y);
         h[idx] = 0;
         
         if (m[idx] < 80)
         {
           h[idx] = pow(m[idx]-80, 2);
         }
         result += h[idx];
       }
      
       result /=30;
         
       if (result > 255)
       {
          result = 255; 
       }
       
       fill (result/2,0,0);
       
         if (result > 80)
         {
           rect(x,y,4,4);
         }
         
         if ((result > 100) && (result < 180)) 
         {
           fill (255,255,255,result);
           rect(x,y,2,2);
         }
       
     }
   }
}
