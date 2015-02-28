
orbiter[][] orbiters;
int onum = 20;
int mainsize = 45;
int mainspacing = int(mainsize/2 + (mainsize/12));
int inset = 0;

void setup()  {
 size(400,400); 
 frameRate(50);
 noSmooth();
 orbiters = new orbiter[onum][onum];

 /// the phase of an orbiter is set according to its position in the orbiter grid. orbiters phase is set to its X position plus its Y position, both times 30. phase is measured in degrees because of the radians() function I'm using. each orbiter will be angled 30 degrees more than its top and left neighbours.
 
 for(int i=0;i<onum;i++)  { 
   for(int o=0;o<onum;o++)  { 
    orbiters[i][o] = new orbiter(inset+i*mainspacing,inset+o*mainspacing,(i+o)*30,mainsize);
   } } 
   
}

void draw()  {

  background(255);
  stroke(0);
  
   ////does the same thing as the original setup, but instead of a regular 30 degrees it uses the mouse's X and Y position to modify the phase difference between the rows and columns of orbiters, respectively                         
  if(mousePressed==true)  { 
   for(int i=0;i<onum;i++)  {
   for(int o=0;o<onum;o++)  {
    orbiters[i][o].phase=(  ( (i*mouseX) + (o*mouseY)));
   }  }  }
  
  for(int i=0;i<onum;i++)  {
   for(int o=0;o<onum;o++)  {
    orbiters[i][o].render();
   }  }  

}

class orbiter  {

  int x; int y;
  int phase; 
  
  int angle=0;        // keeps track of the current angle of the orbiter
  int speed = 4;
  
  int siz;
  int halfsiz;
  
  
  
  orbiter(int ix, int iy, int inphase, int size)  {
    x=ix; y=iy; 
    phase=inphase; 
    siz=size; 
    halfsiz = int(size/2.2);
  }

  void render()  {
  
    noFill();
    
    ellipse(x, y, siz, siz);
    
 ////set xhash and yhash to represent a point on a circular path around orbiter position according to angle
    float xhash = x - (  sin((radians(phase+angle)  )) * halfsiz ); 
    float yhash = y + (  cos((radians(phase+angle)  )) * halfsiz );
    
    fill(0);
    
    ellipse(xhash,yhash,6,6);
    
    if(angle<360)  {  angle = (angle + speed) % 360;  } //constrains the angle to 360 degrees 
                                                        // (not really necessary)                        
    
  }

}
