

void setup()
{
size(192,157);
background (0);
}

void draw()
  
 
  
  {
for( int y = 0; y < 10; y++)
{
   for( int x = 0; x < 10; x++)
   {


     fill (x * 255 / 10);
     strokeWeight(3);
     smooth();
     ellipse(  x * 20 , y * 20, 12, 12);
       
     
    
  
     {          
for( int  a = 0; a < 10; a++)
{
   for( int b = 0; b < 10; b++)
   {
  
     
   
   fill(255);
   noStroke(); 
   smooth();
   ellipse(  b * 20 , a * 20, 4, 4);
 
 
        } 
     
 
    
    
     } 
}

}
}
}




   

