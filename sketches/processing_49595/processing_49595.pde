
PImage fist;
PImage b;
PImage l;
PImage o;
PImage d;


boolean[] keys;

void setup()
{
  size(400, 238);
  frameRate(5);
  fist = loadImage("fist.png");
  b = loadImage("b.png");
  l = loadImage("l.png");
  o = loadImage("oo.png");
  d = loadImage("d.png");
  keys=new boolean[4];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
}
void draw(){
  background (0);
  image (fist,0,0);

  if( keys[0]) 
  {  
  image (b,0,0);   
  }
  if( keys[1]) 
  {
  image(l,0,0);
  }
  if( keys[2]) 
  {
  image(o,0,0);
  }
  if( keys[3]) 
  {
  image(d,0,0);
  }
}

void keyPressed()
{
  if(key=='b')
    keys[0]=true;
    
  if(key=='l')
    keys[1]=true;
    
  if(key=='0')
    keys[2]=true;

  if(key=='d')
    keys[3]=true;
   


}

void keyReleased()
{
  if(key=='b')
    keys[0]=false;
  if(key=='l')
    keys[1]=false;
  if(key=='0')
    keys[2]=false;
  if(key=='d')
    keys[3]=false;
} 

