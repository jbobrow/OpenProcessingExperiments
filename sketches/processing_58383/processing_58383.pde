
int size = 50;   
float x, y ;   

float xspeed = 4; 
float yspeed = 2;  

int xdirection = 1;  
int ydirection = 1;  


void setup() 
{
  size(200, 200);
  noStroke();
  smooth();

  x = width/2;
  y = height/2;
}

void draw() 
{
  background(100,200,50);
  fill(40);
  
  x = x + ( xspeed * xdirection );
  y = y + ( yspeed * ydirection );
  

  if (x > width-size || x < 0) {
    xdirection *= -1;
  }
  if (y > height-size || y < 0) {
    ydirection *= -1;
  }

  ellipse(x+size/2, y+size/2, size, size);
}

