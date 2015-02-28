
   
void setup()
{
  size(400,400);
  background(255);
  frameRate(20);
}
float angle=0.0;
float inc=12.0;
float radius = 0.15; 
float cx = 200; // Center x- and y-coordinates 
float cy = 200; 
float px = cx; // Start with center as the 
float py = cy; // previous coordinate 
float deg=0.0;
float dx=0.0;
float dy=0.0;
void draw()
{
  drawlines();
  smooth(); 

float angle = radians(deg);
float x = cx + (sin(angle) * radius); 
float y = cy + (cos(angle) * radius); 
stroke(255,0,0);
line(px, py, x, y); 
radius = radius +random(0.5,3); 
px = x; 
py = y; 
deg+=24;
} 






void drawlines()
{
  stroke(0);
  if(dx<width){
line(dx,0,width-dx,height);
dx=dx+30;
  }
else
if(dy<height-10){
line(0,dy,width,height-dy);
dy+=30;
}

  
}


