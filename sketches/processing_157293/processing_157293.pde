
int count = 0; 
 
Circle[] circles = new Circle[20];    
 
void setup()
{
  size(400,400);  
  background(255);
  smooth();
 
  
  for (int i = 0; i < circles.length; i++) circles[i] = new Circle();
}
 
void draw()
{
  background(255);
 
 
  for (int i = 0; i < circles.length; i++) circles[i].update();
}
 
void mouseDragged () {
  circles[count].x = mouseX; 
  circles[count].y = mouseY;
}
 

void mouseReleased () {
  circles[count].xSpeed = mouseX - pmouseX;
  circles[count].ySpeed = mouseY - pmouseY;
 
  count ++;  
  if(count >= circles.length) count = 0; 
}
class Circle {
 
  float x;  
  float y;  
  float radius;  
  float xSpeed;  
  float ySpeed;  
 
  Circle()
  {
    xSpeed = 0.0;  
    ySpeed = 0.0;
    x = width/2;  
    y = height/2;
    radius = 5.0;  
  }
 
 
  void  update()
  {
    
    x += xSpeed;
    y += ySpeed;
    if(x > width || x < 0 ) xSpeed = -xSpeed;
    if(y > width || y < 0 ) ySpeed = -ySpeed;
    //noStroke();
    fill(0);
    ellipse(x,y,radius,radius);  
  }
}


