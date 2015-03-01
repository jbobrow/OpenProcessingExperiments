
int radius=100;

void setup()
{
 
 size(600,600); 
}

void draw()
{
  background(0,250,140);
  
  //if(mousePressed){
   //fill(255,255,0); 
  //}
  
  for(int i=100; i<height; i=i+200)
  {
    for(int j=100;   j<width; j=j+200)
    {
      ellipse(j,i,radius, radius);
      fill(255,0,255);
      
      if(mousePressed)
       {
        
         
               fill(255,255,0);
               
         }
    
       
       
       }
    }
  
  
  //if(mousePressed){
   //fill(255,255,0); 
  
  
}


