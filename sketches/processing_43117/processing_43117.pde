
PImage b;
PImage f;
PImage g;

int size = 120;       
float xpos, ypos;  

float xspeed = 4;  
float yspeed = 9; 


int xdirection = 1;  
int ydirection = 1;  


void setup() 
{
  size(800,529);
  noStroke();
  f= loadImage ("f.png");
  g= loadImage ("g.png");
  b= loadImage ("background.jpg");
  frameRate(60);
  smooth();
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  image (b,0,0);
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width-size || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
  }

  image(f,xpos+size/2, ypos+size/2, size, size);
  image(g,ypos+size/2, xpos+size/2, size, size);
}


