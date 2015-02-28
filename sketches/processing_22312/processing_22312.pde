
class Particle
{

  float x=width/6;
  float y=height/6;
  float xv=-3+random(6);
  float yv=-random(4);
  float maxYV=10;
  float gravity=0.1;
  float friction=1;
  float radius=random(20)+10;
  color c=color(random(255),random(255),random(255));
  
  Particle(){ }
  
  Particle(float xp,float yp)
  {
    x=xp;
    y=yp;
  }
  Particle(float xp,float yp,float xvel,float yvel)
  {
    this(xp,yp);
    xv=xvel;
    yv=yvel;
  }
  void run()
  {
    update();
    render();
    
  }
  public void update()
  {
    if(x<=radius)
    {
      xv=abs(xv);
    }
    else if(x>=width-radius)
    {
      xv=-abs(xv);
    }
    if(y+radius>=height)
    {
      yv=-abs(yv);
      if(y+radius-height>=0.15)
      {
        y=height-radius;
        if(yv>-0.1)
        {
          xv*=0.96;
        }
      }
    }
    if((yv<maxYV))
    {
      yv+=gravity;
    }
    yv*=friction;
     //println(yv);
    y+=yv;
    x+=xv;
  }
  void render()
  {
    fill(c);
    rect(x,y,radius,radius);
    ellipse(x,y,radius,radius);
    ellips();//Small random ellipsis
  }
}
class ParticleSystem
{
  ArrayList particles=new ArrayList();
  ParticleSystem(){}
  void add(Particle p)
  {
    particles.add(p);
  }
  void removeAll()
  {
    particles.clear();
  }
  void run()
  {
    for(int i=0;i<particles.size();i++)
    {
      Particle p=(Particle)particles.get(i);
      p.run();
    }
  }
}
ParticleSystem ps=new ParticleSystem();
boolean mouseDown=false;

void setup()
{
  frameRate(50);
  size(800,600);
  smooth();
  //background(random(255),random(255),random(255));
  //tint(random(255),random(255),random(255),-100);
  noStroke();
  ellipseMode(RADIUS);
  smooth();
  background(0);
  noStroke();
  ellipseMode(RADIUS);
  //rectMode(RADIUS);
  
 
  
}
void draw()
{
  
      background(0);
  if(mousePressed==true)
  { 
    ps.add(new Particle(mouseX,mouseY));
  }
  ps.run();

}
float[]colors=new float[3];

void mouseMoved()
 {
  // background(0);
   
   for(int i=0;i<50;i++)
   {
     for(int n=0;n<3;n++)
     {
       float r=random(0,255);
       colors[n]=r;
       
     }
   fill(colors[0],colors[1],colors[2]);
   float x=random(0,900);
   float y=random(0,900);
   stroke(random(255),random(255),random(255));
   rect(x,y,width/18,height/18);
   }
 }
   void keyPressed()
{
  if(keyPressed==true){
  if(key=='r'){
    switch(key)
   {
     case 'r':ps.removeAll();break;
   }
  }
  }
}

void ellips(){
noFill();
stroke(random(255),random(255),random(255));//color
ellipse(random(width),random(height),random(15),random(15));//posizione
noStroke();
}

