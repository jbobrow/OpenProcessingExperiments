
int size = 40;       
float xpos, ypos;        

float xspeed = 3;  
float yspeed = 4;  

int xdirection = 1;  
int ydirection = 1;  


void setup() 
{
  size(400, 400);
  noStroke();
  frameRate(40);
  smooth();
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(156, 1, 84);
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width-size || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
  }

 if (dist(xpos, ypos, mouseX, mouseY) <= width/2) {
    ydirection *= -1;
  }
   if (dist(xpos, ypos, mouseX, mouseY) <= height/2) {
    xdirection *= -1;
   }


  // Draw the shape
  ellipse(xpos+size/2, ypos+size/2, size, size);
}




