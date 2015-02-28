
int x = 200;
int speedX=2;
int radius=10;
int y = 200;


void setup() {
  size(400, 400);
  smooth();
  background(0);
  ellipseMode(RADIUS);
}


void draw() {
  
  noStroke();
  fill(255,100);
  rect(0,0,400,400);
  fill(255,0,0);
  ellipse (x, y, radius, radius);
  fill(0);  
  ellipse (mouseX, mouseY, radius, radius);

  
  if ((keyPressed)&&(dist(x,y,mouseX,mouseY)<radius)  &&
  (mouseY<y))
  {
  y= y+radius;  
  }
  
  
  if ((keyPressed)&&(dist(x,y,mouseX,mouseY)<radius)  &&
  (mouseY>y))
  {
  y= y-radius;
  }
  
   if ((mousePressed)&&(dist(x,y,mouseX,mouseY)<radius)  &&
  (mouseX>x) )
  {
  x= x-radius;
   }
   
   if ((mousePressed)&&(dist(x,y,mouseX,mouseY)<radius)  &&
  (mouseX<x) )
  {
  x= x+radius;
   }
   
   if ((x<0)||(x>width)||(y<0)||(y>height))  {
   x=200;
  y=200;;}

    
  
   }
  

  


 
  
  













