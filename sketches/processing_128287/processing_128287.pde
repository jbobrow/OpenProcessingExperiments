
 
int rad = 60;        
float xpos, ypos;        

float xspeed = 2.8;  
float yspeed = 2.2;  

int xdirection = 1;  
int ydirection = 1; 
int shapenum = 1;


void setup() 
{
  size(640, 360);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  xpos = width/2;
  ypos = height/2;
}

void moveCircle ()
{
 xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
 
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
    shapenum++;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
    shapenum++;
  }

  ellipse(xpos, ypos, rad, rad);
}
void moveTriangle()
{
xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width-rad*) || xpos < rad*2) {
    xdirection *= -1;
    shapenum++;
  }
  if (ypos > height-rad*2 || ypos < rad*2) {
    ydirection *= -1;
    shapenum++;
    }
    
   triangle(xpos-rad, ypos, xpos+rad, ypos+rad, xpos+rad, ypos-rad);
}
void moveRectangle()
{
xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width-rad*) || xpos < rad*2) {
    xdirection *= -1;
    shapenum++;
  }
  if (ypos > height-rad*2 || ypos < rad*2) {
    ydirection *= -1;
    shapenum++;
    }
    rect(xpos,ypos,rad*2, rad*2);
}
void moveShape()
{
if (shapenum%2 == 0)
{
moveCircle();
}
else if(shapenum%2 == 1)
{
moveTriangle();
}
else if(shapenum%3==0)
{
moveRectangle();
}
}


void draw() 
{
  background(102);
  moveCircle();
 
}
