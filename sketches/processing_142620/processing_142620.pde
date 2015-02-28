
import processing.opengl.*;

class Particle
{
 float x,y,vx,vy,diam,freq; //variables for obj behavior
  
  Particle(float _mvx, float _mvy)//constructor (like setup) - must have, must be same name as class
  { 
     x=mouseX;
     y=mouseY;
     vx=_mvx*.1;
     vy=_mvy*.1;
     diam=random(10,50);
     freq = .02;
  }//end of constructor
  
  void update()
  {
     if (diam > 0)
     {
      diam-=.25; // same as diam = diam-1
     }
        vx+=(noise (x*freq, y*freq, frameCount*freq)-.5)*.5;   //slowly add to velocity using noise
        vy+=(noise (frameCount*freq+2345,x*freq,y*freq)-.5)*.5; //different so x,y return different numbers
        x+=vx;
        y+=vy;
        vx*=.95;
        vy*=.95;//slows down particles
  }//end of update
 
   void display()
   {
     pushMatrix();
     translate(x,y);
     ellipse(0,0,diam,diam);
     popMatrix();
   }//end of display 
   
}//end of class obj

//Particle[] parts  --static array
ArrayList parts; //arraylist allows dynamic addition and subtraction from the array, declaring arraylist named 'Parts'


void setup(){
  size(screen.width,screen.height,OPENGL); //for 2.0, screen.width, screen.height for 1.5
  parts = new ArrayList(); //construct arraylist parts
}

void draw(){
    background(0);
    ellipseMode(CENTER);
    fill(255,50);
    noStroke();
   
   for (int i=0; i < parts.size();)
  {
   //retrieving an item from arraylist and casting (type) it as a Particle Object 
   Particle p = (Particle) parts.get(i);
   p.update();
   p.display();
 
       if(p.diam<=1)
       {
       parts.remove(i);
       }
       
           else {
             i++;
           }
  }

 noFill();
 stroke(255);
                                                                                              /** beginShape();
                                                                                                
                                                                                                for (int i=0; i< parts.size(); i++)//add +i particles
                                                                                                  { 
                                                                                                  Particle p = (Particle) parts.get(i);
                                                                                                  vertex(p.x,p.y);  
                                                                                                }
                                                                                               
                                                                                               endShape();**/
                                                                     
 for (int i=0; i< parts.size(); i++)//add +i particles
    { 
    Particle p = (Particle) parts.get(i);
      
        for (int j=i+1; j<parts.size();j++)
        {
          Particle p2 = (Particle) parts.get(j); //get the second particle for distance checking and possible line drawing
         
         if(dist(p.x, p.y, p2.x, p2.y) <50) //if distance btwn two points is less than 50
         {
          line(p.x, p.y, p2.x, p2.y); //draw line
          
         } 
      }
  }
 
}//end void draw


void mouseDragged()
{
  float mvx = mouseX-pmouseX; //finds velocity of mouse
  float mvy = mouseY-pmouseY;
  
  for (int i=0; i<5; i++)//add i<? particles
  { 
  parts.add (new Particle(mvx+random(-10,10),mvy+random(-10,10)));  
  }
}
