
//I used code learned in class
//made three triangles at different places on the screen, and the orbiting circle connects them
//also you can draw circles on it if you want. 
float x,y,angle;
float dX,dY;
float easing;

void setup(){
  size(500,500);
  smooth();
  x = 0;
  y = 0;
  angle=0;
  easing = .01;
  background(255);
}

void draw(){
  fill(0,0,150,10);
  
  
  dX = mouseX - x;
  dY = mouseY - y;
  
  x = x + dX*easing;
  y = y + dY*easing;
  triangle(x,y,35,75,100,25);
  triangle(x,y,75,125,300,450);
  triangle(x,y,325,400,450,500);
  
  x = cos(radians(angle))*200 +width/2;
  y = sin(radians(angle))*200 + height/2;
  ellipse(mouseX,mouseY,50,50);
  angle++;
}

