
import ddf.minim.analysis.*;
import ddf.minim.*;
int k=0;
Minim minim;
AudioPlayer music;
int tp;
float i=0;
float c=0;
float anterior=0;
int n = 1000;
int tono=0;
particulea p;
void setup()
{
  
  i=random(0,360);
  colorMode(HSB,360,1,1,1);
  smooth();
  size(400,400);
  background(0);
  p = new particulea();
  minim = new Minim(this); 
  music = minim.loadFile("Tell Me Why.mp3", 2048);
  music.loop(1);
}
 
void draw()
{
  if(i>360)i=0;
  if(i>35&&i<120)i=120;
  if(i<35)i-=c*0.75;
  c=random(0,10)*0.14;  
  i+=c;
  noStroke();
  fill(0,0.05);
  //rect(0,0,width,height);
  p.act();
  p.raya();
  n=tono<10?(int)random(300,1000):(int)random(1,300);
  println(n);
  
}
class particulea
{
  weeParticula[] part;
   
  particulea()
  {
    part = new weeParticula[n];
    for(int i = 0; i < n; i++)
    {
      part[i]= new weeParticula();
    }
  }
   
  void act()
  {
    for(int i = 0; i < n; i++)
    {
      part[i].act();
    }
  }
   
  void raya()
  {
    tono=0;
    for(k = 0; k < n; k++)
    {
      tono+=part[k].raya();
    }
    tono/=n;
  }
}
class weeParticula
{
  PVector pos, vel;
 
  weeParticula()
  {
    pos = new PVector(random(width),random(height));
    vel = new PVector();
  }
   
  void act()
  {
    vel.x = 20*(noise(mouseX/10+pos.y/100+c*0.7)-0.5);
    vel.y = 20*(noise(mouseY/10+pos.x/100+c*0.7)-0.5);
    pos.add(vel);
    
    if(pos.x<0)pos.x+=width;
    if(pos.x>width)pos.x-=width;
    if(pos.y<0)pos.y+=height;
    if(pos.y>height)pos.y-=height;
  }
 
  int raya()
  {
    int g=0;
    g= dibuje(pos.x,pos.y,vel.x,vel.y);    
    return g>0?g:-g;
  }
  int dibuje(float x, float y, float velx, float vely){
   stroke(i+(random(0,100)*((int)i)%2==0?1:0),1,1,random(0,20)*0.1);
    
    
    strokeWeight((int)c/2);
    //stroke(255);
    point(x,y);
    
    
    strokeWeight((int)c*1.3);
    tp=(int)(music.left.get((int)random(0,music.bufferSize()-1 ) )*50);
    tp-=3;
      stroke(i,i>35?random(0.1,1.0):1,i>35?random(0.1,1.0):1,random(0.1,1.0));
      strokeWeight(tp>0?tp:-tp);
      //stroke(255);    
      point(x*1.05-vely,y*1.05-vely);
      tp++;
      
      int r=(int)random(0,30);
      stroke(i+30 , i!=3?random(0.1,0.9):1 , i==3?0:1 , r==3?random(0.0,0.3):random(0.1,1.0));      
      strokeWeight(tp>0?(tp+(r==3?6:0)):-tp);
      //stroke(255);    
      point(x*1.05-vely,y*1.05-vely);
      tp+=2;
        stroke(i,1,1,random(0,6)*0.1);
        strokeWeight(tp>0?(tp+((int)random(0,10))==3?6:0):-tp);
        point(x*1.05-velx,y*1.05-vely);
        //line(pos.x,pos.y,pos.x*1.05-vel.x,pos.y*1.05-vel.y);
        return tp;
  }
}


