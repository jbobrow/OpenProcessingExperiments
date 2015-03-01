

void setup()
{

size(500, 500);
background(25);

}

void draw()
{


translate (250,250);
fill(255);
rotate(millis());  
rect(100,50,5,175);  

translate (0,0);
fill(50);
rotate(millis());  
rect(50,50,25,150); 
  
translate (0,0);
fill(75);
rotate(millis());  
rect(50,50,350,0); 

translate (0,0);
fill(255);
rotate(millis());  
rect(0,0,65,0); 









}
