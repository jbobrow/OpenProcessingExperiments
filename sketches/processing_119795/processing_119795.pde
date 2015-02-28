
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer music;
int tp;
float i=0;
float c=0;
float anterior=0;
int n = 800;
particulea p;
boolean block=false;
void setup()
{
  i=random(0,360);
  colorMode(HSB,360,1,1,1);
  smooth();
  size(1024,768);
  background(0);
  p = new particulea();
  minim = new Minim(this);
  music = minim.loadFile("riechinito.mp3", 2042);
  music.loop();
}
  
void draw()
{
  if(i>360)i=0;
  if(i>35&&i<120)i=120;
  c=random(0,10)*0.14; 
  i+=c;
  noStroke();
  fill(0,0.05);
  //rect(0,0,width,height);
  p.act();
  p.raya();
  println(tp);
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
     
    for(int i = 0; i < n; i++)
    {
      part[i].raya();
    }
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
  
  void raya()
  {
     
    stroke(i+(random(0,100)*((int)i)%2==0?1:0),1,1,random(0,20)*0.1);
     
     
    strokeWeight((int)c);
    //stroke(255);
    point(pos.x,pos.y);
     
     
    strokeWeight((int)c*1.3);
    tp=(int)(music.left.get((int)random(0,music.bufferSize()-1 ) )*50);
    tp-=2;
    stroke(i+60,1,1,random(0.1,1.0));
    strokeWeight(tp>0?tp:-tp);
    //stroke(255);   
    point(pos.x*1.05-vel.x,pos.y*1.05-vel.y);
    tp++;
     
    stroke(i+30,1,1,random(0.1,1.0));
    strokeWeight(tp>0?tp:-tp);
    //stroke(255);   
    point(pos.x*1.05-vel.x,pos.y*1.05-vel.y);
    tp++;
     
    stroke(i,1,1,random(0,10)*0.1);
    strokeWeight(tp>0?tp:-tp);
    point(pos.x*1.05-vel.x,pos.y*1.05-vel.y);
    //line(pos.x,pos.y,pos.x*1.05-vel.x,pos.y*1.05-vel.y);
  }
}


