
size (500,500);
background (0);
smooth(); 

 stroke(30); 
 fill(10); 
 
int grid = 30;           
int stepSizeH = (int) (height/ grid); 
int stepSizeW = (int) (width/ grid); 


for ( int y = 0; y < height; y =y + stepSizeH)
{

  for ( int x = 0; x < width;x = x + stepSizeW)
  {
      
   
    fill(random(200), 15,9); 
    triangle(x-10, y, x+10, y, x, y-10);
        
    }
    for ( int i = 2; i < 300; i = i+1)
{

strokeWeight(random(5));   
stroke (random(25),random(25),0,random(55));
line (random(width),random(height),random(width),random(height));


}
}
saveFrame("1.png"); 


