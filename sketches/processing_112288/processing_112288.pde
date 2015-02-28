
size(500,500);
  
smooth();
background(250);
 
 
 
  
noStroke();
fill(250,252,122);
  
for (int i=10; i<=width; i+=50)
{
  for (int j=0; j<=height; j+=50)
  {
      
rect(i,j,20,20);  
  }
}
 
 
fill(247,172,242,60);
  
for (int i=0; i<=width; i+=60)
{
  for (int j=0; j<=height; j+=60)
  {
      
rect(2*i,2*j,35,35);  
  
  }
}



