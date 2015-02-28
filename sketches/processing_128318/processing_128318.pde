
 
int rad = 40;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 20;  // Speed of the shape
float yspeed =  10;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
int shapenum = 1;

void setup() 
{
background(0);
  size(600, 600);
  noStroke();
  frameRate(120);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = 30;
  ypos = 300;
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
  
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
   
    shapenum++;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  
    shapenum++;
    }
    
   triangle(xpos-rad, ypos+rad, xpos+rad, ypos+rad, xpos, ypos-rad);
}

void moveRectangle()
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
  
    rect(xpos-rad, ypos-rad, rad*2, rad*2);

}

void moveShape()
{
  
if (shapenum%2 == 0)
{

moveCircle();
}
else if(shapenum%2 == 1 && !(shapenum%3==0))
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
int r = random(255);
int g = random(255);
int b = random(255);
  fill(r,g,b);
 moveShape();
}
