
// REQUEST: BEFORE RUNNING PROCEESS, please play loud music

int lastX, lastY;

import ddf.minim.*;



void setup ()
{ size (500, 500);

background (0);
stroke (255,0,0);
strokeWeight (5);

}

void draw ( )
{ 
  strokeWeight (random (7) );
  stroke (random (255), random (255), random (255) );
point ( random (width), random (height) );

rect (50,50,100,200);

if (mousePressed==true)

{line (lastX, lastY, mouseX, mouseY);
lastX= mouseX;
lastY= mouseY;

}

}

void mousePressed ()
{
println ("The door is open!");
}
