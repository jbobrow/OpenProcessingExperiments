
PFont andes;
PFont BebasNeue;
PFont scoolar_tfb;
float timer = 0;
float x2 = 0;
float y2 = 0;
PImage serious;
PImage chill;
boolean loaded = false;

void setup()
{
  frameRate (30);
  size(500,500);
  
  andes = createFont("Andes",32);
  BebasNeue = createFont("BebasNeue",40);
  scoolar_tfb = createFont("scoolar_tfb", 32);
  
  serious = requestImage("serious.PNG");
  chill = requestImage("chill.png"); 
}

void draw()
{
  
  x2 = x2 + 2;
  y2 = y2 + 2;
  
  if(serious.width >0)
  {
    timer+=0.045;
    if (timer>0&&timer<18)
  {
    image (serious, 0, 0, width, height);
    textFont(BebasNeue);
    textAlign(CENTER, TOP);
    
    fill(0);
    text("serious..", (-30 + x2), 300);
    text("quiet..", (550 - x2), 400);
    text("weirdo..", 200, (550 - y2));
    text("looks scary..", 300, (-50 + y2));
    text("must be depressed..", (-70 + x2), 450);
    text("creep..", 400, (-150 + y2));
  }
  if(timer>18&&timer<21)
  {
    background(255,255,255);
    textFont(andes);
    
    
    fill(0);
    text("But in reality...", 250,250);
  }
  
  if(timer>21&&timer<25)
  
  
  {
    
    image (chill, 0, 0, width, height);  
  }
  
  if(timer>25)
  {
    background (0);
    textFont(scoolar_tfb);
    
    
    fill(255,255,255);
    text("chill",40,0);
    text("laid back", 430,0);
    text("classy-ish", 80,450);
    text("swell dude",420,450);
    text("never judge until you know..",250,250);
    
  }
  
  }
  
  
  
}


