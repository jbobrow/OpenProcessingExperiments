
void setup ()
{
 
size (500,500);
 
 
 
}
 
void draw ()
{
background(250);
stroke(0);
strokeWeight(random(0,10));
 
smooth();
rect(random(210,245),random(200,225),random(80,10),random(60,10),random(60,10));
 
 

 
smooth();
noFill();
}
