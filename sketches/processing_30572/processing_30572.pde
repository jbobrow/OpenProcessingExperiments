
size (500,500);
background (0); 
smooth(); 
noStroke();

for ( int i = 20; i < 900; i = i +1)
{
 
    stroke (55,50,90, 130);
    line(random(width), random(height), random(width), random(height) );

}   

for ( int i = 0; i < 100; i = i +1)
{
  
   float a =  random(width); 
   float b = random (height); 
   float c = random(210, 55); 
   float d = random (7, 5); 
 
    noFill(); 
    stroke (c,0,205);
    strokeWeight(d);
    float radius = random (5, 300);
    line ( width/2, height/10, a,b); 
    
    fill(10,2,80); 
    ellipse ( a,b, d,d); 
   
} 

fill(0); 
ellipse (width/2, height/8, 200,200); 




saveFrame("2.png");

