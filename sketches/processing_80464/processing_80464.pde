
class Particle
{
  float x, y, vx, vy, rad, trans, grav, freq;
  boolean dead;
  
  
  Particle() //constructor function
  {
   x = mouseX;
   y = mouseY;
   vx = mvx*.25+random(-2,2);
   vy = mvy*.25+random(-2,2);
   rad = 0;
   trans = 255;
   grav = -.05;
   freq = .01;
   dead = false;
    
  }
  
  
  void update()
  {
    rad += 2;
    trans -= 4;
    vy += grav;
    
    if(trans < 1)
    {
     dead = true;
     
    }
    
    x += vx;
    y += vy;
    
  }
  
  void display()
  {
   stroke(255,trans);
   fill(255,0,0,trans);  
   ellipse(x,y,rad,rad); 
    
  }
   
}

//end Class command

//array list


ArrayList parts;

float mvx, mvy;

void setup()
{
 size(1200,800);
 smooth();
 
 parts = new ArrayList();
  
}


void draw()
{
 background(0);
 mvx = mouseX-pmouseX;
 mvy = mouseY-pmouseY;
 println("mvx is " + mvx);
 println("mvy is " + mvy);
 
 noFill();
 stroke(255, 40);
 
 
//arrays have .lenght function
//ArrayList have .size() function
 for(int i = 0; i < parts.size(); i++)
 {

   //get from ArrayList
   Particle p = (Particle) parts.get(i);
   p.update();
   p.display();
   
   if(p.dead)
   {
    parts.remove(i); 
     
   }
   
 }
 //line between ellipses
 
 beginShape();
 for(int i = 0; i < parts.size(); i++)
 {
   Particle p = (Particle) parts.get(i);
   stroke(255, p.trans);
   //fill(255,0,0, p.trans);
   vertex(p.x,p.y);
 }
 endShape();
  
}


void mouseDragged()
{
  for(int i = 0; i < 30; i++)
  {
  parts.add(new Particle());
  }
  
}
