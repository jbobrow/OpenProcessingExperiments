
int x;
int y;
int diameter;
color center;
color rings;

int xspeed;
int yspeed;

int[] savedPt = new int[2];

void setup() {
  size(400,400);
  x=width/2;
  y=height/2;
  diameter = 50;
  center = color(255,255,0);
  rings = color(255,127,0);
  smooth();
  xspeed = 4;
  yspeed = 2;
  
 background(0,0,20);

}
 
void draw() {
  
  fill( 0,0,20,5);
  rect(0,0,width, height);
 
  renderCircle(mouseX,mouseY);
  renderCircle(x,y);
  moveCircle();
  
 if (insideCircle(mouseX, mouseY))
  {
    center = color(255,255,0);
  }
  else
  {
    center = color(0);
  }

  
  println ("x = "+ x + " y=" + y );

}

void renderCircle( int _x, int _y)
{
  noStroke();
  fill(center);
  ellipse(_x,_y,diameter,diameter);
  noFill();
  stroke(rings);
  strokeWeight(4);
  
  for (int i = 0; i < 4; i++) {
    ellipse(_x,_y,diameter + 8 + i*12, diameter + 8 + i*12);
  }
  
}

void moveCircle()
{
    
  x +=xspeed;
  y +=yspeed;

  if ((x>width) || (x<0))
  {
    //x=0;
    xspeed = - xspeed;
  }
  
  if ((y>height) || (y<0))
  {
     yspeed = -yspeed; 
  }
}


// checking distance from given(mouse coord) pt to circle center
boolean insideCircle (int _x, int _y)
{
  
  if (dist(_x,_y,x,y) < diameter/2) 
  //OR if (sq(mouseX-x) + sq(mouseY-y) < sq(diameter/2))
  {return true;}
  else
  {return false;}
}


void mousePressed() { 
 
   if (xspeed !=0 && yspeed !=0)
   {
     savedPt[0] = xspeed;
     savedPt[1] = yspeed;
     xspeed = 0;
     yspeed = 0;
   }
   else
   {
    xspeed = savedPt[0];
    yspeed = savedPt[1];
   }
  }


