
int rad = 20;        
float xpos, ypos;       

float xspeed = 20; 
float yspeed =  10;  
float gravity = -3;
int xdirection = 1;  
int ydirection = 1;  
int shapenum = 1;

void setup() { 
  size(800, 500);
    
    noStroke();
  frameRate(20);
  ellipseMode(RADIUS);
  xpos = 300;
  ypos = rad+1;
}

int changeDistance ()
{
 if(ydirection > 0)
 {
 yspeed = yspeed - gravity;
 }
 if(ydirection < 0)
 {
 yspeed = yspeed + gravity;
 }
  
  
  
  int newpos = ypos + (yspeed * ydirection);
  ypos = newpos;
  return newpos;
 
  /*
  if(yspeed <= 5)
  {
  yspeed ==0;
  ypos == height-rad-1;
  }
*/
}

void moveCircleGravity ()
{
int newpos = changeDistance();


/*
  if (xpos > width-rad || xpos < rad) 
  {
    xdirection *= -1;

  }
  if (ypos > height-rad|| ypos <rad) 
  {
    ydirection *= -1;

  }
*/

if (newpos > height-rad|| newpos < rad) 
  {
    ydirection *= -1;

  }
  
  
 xpos = xpos;

  ellipse(xpos, newpos, rad, rad);
}

void draw() {  
background(143, 150, 95);
fill(0);
moveCircleGravity();
 
}
