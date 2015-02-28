
orbiter[][] orbiters;
int onum = 20;
int mainsize = 45;                                  // making this smaller makes it easier to see the patterns
int mainSpeed = 8;                                  // base speed for orbiters
int mainspacing = int(mainsize/2 + (mainsize/12));  // the space between
int inset = 0;
int atomSize = 7;                                   // base size for the little rotating ball

boolean colors = true;                             // pressing c changes this
 
void setup()  
{
 size(400,400);
 frameRate(50);
 noSmooth();
 colorMode(HSB);
 
 orbiters = new orbiter[onum][onum];
  
 for(int i=0;i<onum;i++) for(int o=0;o<onum;o++)  
 {
   orbiters[i][o] = new orbiter(inset+i*mainspacing,inset+o*mainspacing,(i+o)*30,mainsize);
 }
}
 
void draw()  
{
  background(255);
  stroke(0);

  if(mousePressed==true)  
  {
    for(int i=0;i<onum;i++) 
    for(int o=0;o<onum;o++) 
    {
     if(mouseButton == LEFT)   {  orbiters[i][o].phase=(  ( (i*mouseX) + (o*mouseY) )  );  }
     if(mouseButton == RIGHT)  
     {  
         orbiters[i][o].speed = (  ( (o*mouseX) + (o*mouseY) )  );
         orbiters[i][o].speed = mainSpeed + orbiters[i][o].speed*0.001;  
     }
    }  
  }  
   
   for(int i=0;i<onum;i++)  
   for(int o=0;o<onum;o++)  
   {
    orbiters[i][o].render();
   } 
}
 
class orbiter  
{ 
  int x; int y;
  int phase;
   
  int angle=0;      
  float speed = mainSpeed;
   
  int siz;
  int halfsiz;
   
   
   
  orbiter(int ix, int iy, int inphase, int size)  {
    x=ix; y=iy;
    phase=inphase;
    siz=size;
    halfsiz = int(size/2);
  }
 
  void render()  
  {   
    float xhash = x - (  sin((radians(phase+angle)  )) * halfsiz );
    float yhash = y + (  cos((radians(phase+angle)  )) * halfsiz );
    
    noFill();
    
    float angleColor = (angle+phase)*(180/255) % 255;
    
    if(colors) { stroke( angleColor,200,200 ); } else { stroke(0); }
     
    ellipse(x, y, siz, siz);
     
    if(colors) { fill(angleColor,255,255); } else { fill(0); }
     
    ellipse(xhash,yhash,atomSize,atomSize);
     
    angle = (angle + speed); //constrains the angle to 360 degrees
                                                        // (not really necessary)                       
     
  }
 
}

void keyPressed()
{
    if( key == 'c' )
    {
      colors = !colors;
    }
}
