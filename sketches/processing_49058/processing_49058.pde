
Ziel [] Zielpunkt;
Agent [] Agenten;
//linien einfügen

void setup() {
  size (800, 800);
  background (255);
  erstelleZielpunkt ();
  buildAgenten ();
}

void draw () {
  background (255);
  
  
  for (int i=0; i<Agenten.length; i++) 
  { 
    Agenten[i].move();
  }
  
   for (int z=0; z<Zielpunkt.length; z++) 
  {
    Zielpunkt[z].render();
  }
  
  for (int i=0; i<Agenten.length; i++) 
  {
    Agenten[i].render();
  }
}
 



void erstelleZielpunkt (){
 Zielpunkt = new Ziel[5];
 int border = 50;
 for (int z=0; z<Zielpunkt.length; z++){
   float xPos = random(border, width-border);
   float yPos = random(border, height-border);
   float radius =  (30);
   color clr = color (200, 50, 50, 0);
   Zielpunkt[z] = new Ziel(xPos, yPos, radius,clr);
 }
 }

void buildAgenten (){
  Agenten = new Agent[10];
  int border = 20;
  for (int i=0; i<Agenten.length; i++){
  float theX = random (border, width-border);
  float theY = random(border, height-border);  
  
  float radius = (15);
  color clr = color (50,50,200,0);
  Agenten[i] = new Agent (theX, theY, radius, clr);
}
}
  
class Ziel {
  float xPos;
  float yPos;
  float radius;
  Ziel (float axPos, float ayPos, float aradius, color aclr) {
    xPos = axPos;
    yPos = ayPos;
    radius = aradius;
  }
  
  void render() {
    fill (0);
    ellipse (xPos, yPos, radius*2, radius*2);
  }
}

class Agent {
  PVector position;
  PVector direction;
  float radius;
  float r;
  float g;
  float b;
  Agent (float theX, float theY, float aradius, color aclr) {
  position = new PVector (theX, theY);
  direction   = new PVector (10,10);
  direction.x = random (-1, 1);
  direction.y = random (-1, 1);
  radius = aradius;
  r=random (0,255);
  g=random (0,255);
  b=random (0,255);
}

 void render () {
  r=random (0,255);
  g=random (0,255);
  b=random (0,255);
      for (int i=0; i<Zielpunkt.length; i++) 
   {
     if (dist (position.x, position.y, Zielpunkt[i].xPos, Zielpunkt[i].yPos) < 45)
     {
       r=255;
       g=255;
       b=255;  }
 }
   fill (r,g,b);
   ellipse (position.x, position.y, 2*radius, 2*radius);

 }
void move () 
{
   direction.x += direction.x;
   direction.y += direction.y;
   direction.normalize ();
   position.add (direction);
 
   if (position.x < radius || position.x > (width-radius)) 
   {
       direction.x *= -1;
   }
   
   if (position.y < radius || position.y > (height-radius)) 
   {
       direction.y *= -1;
   }
   
   for (int i=0; i<Zielpunkt.length; i++) 
   {
     if (dist (position.x, position.y, Zielpunkt[i].xPos, Zielpunkt[i].yPos) < 45)
     {
       direction.x=0;
       direction.y=0;
     }
      
       line (position.x, position.y, Zielpunkt[i].xPos, Zielpunkt[i].yPos);
     
     
      
   }
 }
}


  
