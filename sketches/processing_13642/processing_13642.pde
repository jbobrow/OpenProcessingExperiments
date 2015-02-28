
import controlP5.*;

ArrayList kvapky_l;
ArrayList kvapky_r;

int max_kvapky;
float x,y;

ControlP5 gui;


int lx, ly, rx, ry;

PImage lubica;
PImage slza;

boolean img;

class Kvapka
{
  PVector start;
  PVector lokacia;
  PVector smer;
  PVector zrychlenie;
  char sm;
  float uhol;
  
  
  Kvapka(PVector start, char sm)
  {
    this.start=start;
    this.sm=sm;
    lokacia=new PVector(start.x, start.y);
    if (sm=='r')
    {
      zrychlenie=new PVector(x, y);
      smer=new PVector(random(1, 3), random(-4, -2));
    } else if (sm=='l')
    {
      zrychlenie=new PVector(-x, y);
      smer=new PVector(random(-3, -1), random(-4, -2));
    }
    println("lokacia "+lokacia.x+" "+lokacia.y);
    println("smer "+smer.x+" "+smer.y);
    
    
    
    
    
   
    
  }
  
  void update()
  {
    
    fill(255);
    smer.add(zrychlenie);
    smer.limit(4);
    lokacia.add(smer);
    if(lokacia.y>height || lokacia.x>=width || lokacia.y<0 || lokacia.x<=0)
    {
      lokacia=new PVector(start.x, start.y);
    
    if (sm=='r')
    {
      zrychlenie=new PVector(x, y);
      smer=new PVector(random(1, 3), random(-4, -2));
    } else if (sm=='l')
    {
      zrychlenie=new PVector(-x, y);
      smer=new PVector(random(-3, -1), random(-4, -2));
    }
    }
    
    
    
  }
  
  void draw()
  {
    if(!img)
    {
      rect(lokacia.x, lokacia.y, 1, 1);
    } else {
      /*
      pushMatrix();
      uhol=smer.y/smer.x;
      uhol=atan(uhol);
      translate(lokacia.x, lokacia.y);
      //uhol=degrees(uhol);
      rotate(uhol);
      image(slza, 0, 0);
      popMatrix();
      */
      image(slza, lokacia.x, lokacia.y);
    }
  }
  
  
}

void setup()
{
  size(400, 400);
  //kvapka=new Kvapka();
  background(0);
  noStroke();
  frameRate(60);
  gui=new ControlP5(this);
  
  gui.addButton("slzae",0, 10, 10, 40, 20);
  gui.addSlider("x", 0.01, 1, 0.01, 80, 10, 80, 20);
  gui.addSlider("y", 0.1, 1, 0.3, 200, 10, 80, 20);
  
  max_kvapky=200;
  
  
  lx=192;
  ly=155;
  rx=205;
  ry=155;
  
  x=0.01;
  y=0.3;
  
  
  
  kvapky_l=new ArrayList();
  
  kvapky_l.add(new Kvapka(new PVector(lx, ly), 'l'));
  
  kvapky_r=new ArrayList();
  
  kvapky_r.add(new Kvapka(new PVector(rx, ry), 'r'));
  
  
  
  lubica=loadImage("lubica1.png");
  slza=loadImage("slza.png");
  
  rectMode(CENTER);
  imageMode(CENTER);
  
  
  
}

void draw()
{
  background(0);
  image(lubica, width/2, 250);
  for(int i=0; i<kvapky_l.size();i++)
  {
    Kvapka kvapka=(Kvapka)kvapky_l.get(i);
    
    kvapka.update();
    kvapka.draw();
    
    kvapka=(Kvapka)kvapky_r.get(i);
    
    kvapka.update();
    kvapka.draw();
  }
  
  if(/*(counter/dly==1) && */(kvapky_l.size()<max_kvapky))
  {
    println("O");
    kvapky_l.add(new Kvapka(new PVector(lx, ly), 'l'));
    kvapky_r.add(new Kvapka(new PVector(rx, ry), 'r'));
    
    //dly=(int)random(120, 150);
  }


}

void slzae()
{
  if(img)
  {
    img=false;
  } else {
    img=true;
  }
}

void x(float x)
{
  this.x=x;
}

void y(float y)
{
  this.y=y;
}

