
float x,y;
float px,py;
float easing = 0.2;

void setup()
{
  size(500,500);
  stroke(0, 100);
  background(240);
}
void draw()
{
   float targetX = mouseX;
   x += (targetX-x) * easing;
   float targetY = mouseY;
   y += (targetY-y) * easing;
  
   float weight = dist(x,y, px,py);
   strokeWeight(weight*1.5);
   line(x,y, px,py);
   
   //back up x and y, so next frame we have current & previous!
   py=y;
   px=x; 
}

void mousePressed()
{
   background(200); 
}

