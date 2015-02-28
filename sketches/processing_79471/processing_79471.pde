
// PACMAN
// Variables globales
   float a=0.0;
   float b=TWO_PI;   
   float c=QUARTER_PI;
   float d=5.83;
   float t=0;
   int x=0;
    
  
void setup()
{
  size(500,300);
  frameRate(4);
  strokeWeight(5);
  smooth();
  noStroke();
}
  
void draw ()
{
   background(5);
    
  rect(x, 1, 0, 150);
   
    x=x+1;
     
   fill(0,0,255);
   arc(mouseX,mouseY,80,80,a,b);
   stroke(255,0,0);
   point(250,100);
   stroke(0,255,0);
   point(250,200);
   stroke(0,0,255);
   point(400,200);
 
     t=a; 
     a=c; 
     c=t; 
     t=b;
     b=d;
     d=t;
}
