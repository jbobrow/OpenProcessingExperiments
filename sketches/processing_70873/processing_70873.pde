
int numCircles= 10;

void setup() 
{
  size(500,500);
  background(0);
  noStroke();
}


void draw()
{
  
  
  for (int r = 1; r <= 4; r++)
  {
    for (int c = 1; c <= 4; c++)
    {
          
       
       for(int i = 1; i<=numCircles; i++)
       {
    
         if(i%2==0)
         {
           smooth();
           fill(255);
           ellipse(r*100,c*100,80-7*i,80-7*i);
         }
         
         else
         {
           smooth();
           fill(255,0,0);
           ellipse(r*100,c*100,80-7*i,80-7*i);
         }
        }
        
    }
   }


}
