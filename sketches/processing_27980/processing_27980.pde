
import ddf.minim.*;

Minim minim;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;



float gravity=0;
ArrayList balls=new ArrayList();
boolean creating=false;
PVector start;
void setup()
{
  size(500,500);
  smooth();
  minim = new Minim(this);
  song1 = minim.loadFile("sound1.wav");
   minim = new Minim(this);
  song2 = minim.loadFile("sound2.wav");
   minim = new Minim(this);
  song3 = minim.loadFile("sound3.wav");
}
class Ball
{
  PVector loc, vel;
  color clr;
  float size=random(15,20);
  Ball(float x,float y,float vx,float vy,color clr)
  {
    loc=new PVector(x,y);
    vel=new PVector(vx,vy);
    this.clr=clr;
  }
  void show()
  {
    noStroke();
    fill(clr);
    ellipse(loc.x,loc.y,30,30);
    loc.add(vel);
    if (loc.x<size/2)
    {
      vel.x*=-1;
      loc.x=size/2;
       song3.play();
  song3.rewind();
    }
    else if (loc.x>width-size/2)
    {
      vel.x*=-1;
      loc.x=width-size/2;
       song3.play();
  song3.rewind();
    }
    if (loc.y<size/2)
    {
      vel.y*=-1;
      loc.y=size/2;
       song3.play();
  song3.rewind();
    }
    else if (loc.y>height-size/2)
    {
      vel.y*=-1;
      loc.y=height-size/2;
       song3.play();
  song3.rewind();
    }
    vel.y+=gravity;
  }
}
void draw()
{
  background(0);
    stroke(255,30);
    strokeWeight(20);
    line(100,0,100,500);
    line(0,100,500,250);
    line(0,400,500,400);
    line(140,500,489,0);
  for (int i=0;i<balls.size();i++)
  {
    ((Ball)balls.get(i)).show();
  }
  if (keyPressed)
  {
    if (key=='c')
     song2.play();
  song2.rewind();
    
      balls=new ArrayList();
  }
  if (creating)
  {
    stroke(255,75);
    strokeWeight(5);
    line(start.x,start.x,mouseX,mouseY);
    
    
  }
}
void mousePressed()
{
  creating=true;
  start=new PVector(mouseX,mouseY);
}

void mouseReleased()
{
  creating=false;
  balls.add(new Ball(mouseX,mouseY,(mouseX-start.x)/6,(mouseY-start.y)/6,color(random(255),random(255),random(255))));
  song1.play();
  song1.rewind();
}

