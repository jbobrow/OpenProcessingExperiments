
int screen =0;
PImage walk;
PImage u; //
PImage d; //desert
PImage c; //cliff
PImage c1; //outside
PImage b; //beach

int time1= 1000;
PImage milo;
PImage b2;
PImage back;


PImage sc1;
PImage rooms3;
PImage j; //jungle


void setup()

{
  
  walk=loadImage("walk.png");
  milo= loadImage("milo.png");
  b2=loadImage("b2.png");
  
  c1=loadImage("c1.png");

  sc1= loadImage("sc1.png");
  rooms3 = loadImage("rooms3.png");
  j=loadImage("jungle2.png");
  u= loadImage("up.png");
  d=loadImage("desert2.png");
  c=loadImage("cliff3.png");
 
  b=loadImage ("beach2.png");
  back=loadImage("back.png");
  
  
  size(500,500);
  imageMode (CENTER);
}


void draw()
{
   
    image(sc1,250,250);
    
    
      if(key=='o')
      
      image(c1,250,250);
    
      if(key=='u')
      image(rooms3,250,250);
      
      if(key=='w')
    
    
    image(d,250,250);
  
    
    if(key=='c')
    image(c,250,250);
    
    else if (key=='k')
    image(b,250,250);
    
    if(key=='b')
    image(j,250,250);
    }


