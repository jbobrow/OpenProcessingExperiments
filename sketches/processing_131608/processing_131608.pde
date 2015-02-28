
int noofparticles=25;
float omega=0.95;


int minim=0;
int del=80000;


PVector gbest=new PVector(100,300);
float c1=1.5;
float c2=1.5;
float worldwidth=400;
float worldheight=400;
int iter=1;
float errx=100,erry=100;
Particle[] particles;
void setup()
{
  size(400,400);
  frameRate(300);
  particles= new Particle[noofparticles];
  for(int i=0;i<noofparticles;i++)
    {
      particles[i]=new Particle();
    }
  
  background(255);
  for(int i=0;i<noofparticles;i++)
    {
      if(Func(particles[i].pbest)<Func(gbest))
      gbest.set(particles[i].pbest.x,particles[i].pbest.y,0);
      
    }
    //buffimg= createImage(400,400,RGB);
}

void draw()
{  
  background(255);
   
  
//  for(int i=0;i<=400;i++)
//  {
//    for(int j=0;j<=400;j++)
//    {
//      rgb_func(pow((i-200),2)+pow((j-200),2));
//      buffimg.set(i,j,color(rgb_red,rgb_green,rgb_blue));
//    }
//  }
 
//  if(iter==200)
//  buffimg.save("img.png");
  
  line(0,200,400,200);
  line(200,0,200,400);
  
  text("X axis", 360, 213);
  text("Y axis", 210, 20);
  
  //if((errx>=0.01 && erry>=0.01) && iter<=10000)
  
   if(iter<=1000)
  {
    
    drawparticles();
    
    
      
      
//    for(int i=0;i<noofparticles-1;i++)
//    {
//      float distance1,distance2;
//      distance1= particles[i].position.dist(new PVector(mouseX,mouseY));
//      distance2= particles[i+1].position.dist(new PVector(mouseX,mouseY));
//      if(distance1<distance2)
//      gbest=particles[i].position;
//      else
//      gbest=particles[i+1].position;
//     //println(particles[i].position.x);
//     
////     gbest.x=min(particles[i].position.x,particles[i+1].position.x);
////     gbest.y=min(particles[i].position.y,particles[i+1].position.y);
//    }
    
    
    for(int i=0;i<noofparticles;i++)
    {
      particles[i].update_velocity(omega,c1,c2,gbest);
      particles[i].update_position();
    }
    
     for(int i=0;i<noofparticles;i++)
    {
//      if(particles[i].position.x<particles[i].pbest.x)
//      particles[i].pbest.x=particles[i].position.x;
//      
//      if(particles[i].position.x<gbest.x)
//      gbest.x=particles[i].position.x;
//      
//      if(particles[i].position.y<particles[i].pbest.y)
//      particles[i].pbest.y=particles[i].position.y;
//      
//      if(particles[i].position.y<gbest.y)
//      gbest.y=particles[i].position.y;
//      errx=0;
//      erry=0;

     if(Func(particles[i].position)<Func(particles[i].pbest))
     particles[i].pbest.set( particles[i].position.x,particles[i].position.y,0);    

     if(Func(particles[i].pbest)<Func(gbest))
     gbest.set( particles[i].pbest.x,particles[i].pbest.y,0); 
      
      errx=0;
      erry=0;
      
      errx+=(particles[i].position.x-gbest.x)*(particles[i].position.x-gbest.x);
      erry+=(particles[i].position.y-gbest.y)*(particles[i].position.y-gbest.y);
      
    }
    
   // errx=sqrt((1/(2*noofparticles))*errx);
    errx=errx/(2*noofparticles);
    errx=sqrt(errx);
    erry=erry/(2*noofparticles);
    erry=sqrt(erry);
    
    
    
    
    iter++;
    println("x="+(200-gbest.x)+" y="+(200-gbest.y));
   // println(errx+"   "+erry);
  }
}

void drawparticles()
{
  for(int i=0;i<noofparticles;i++)
  {
    ellipse(particles[i].position.x,particles[i].position.y,2,2);
  }
 
}

float Func(PVector a)
{
  return pow((a.x-200),2)+pow((a.y-200),2);
}

void rgb_func(float value)
{
  
  if(value>=minim && value<minim+del/5)
  {
    rgb_blue=128+int(map(value,minim,minim+del/5,0,127));
    rgb_green=0;
    rgb_red=0;
  }
  if(value>=minim+del/5 && value<minim+2*del/5)
  {
    rgb_green=int(map(value,minim+del/5,minim+2*del/5,0,255));
    rgb_red=0;
    rgb_blue=255;
  }
  if(value>=minim+2*del/5 && value<minim+3*del/5)
  {
    rgb_blue=255-int(map(value,minim+2*del/5,minim+3*del/5,0,255));
    rgb_green=255;
    rgb_red=int(map(value,minim+2*del/5,minim+3*del/5,0,255));
  }
  if(value>=minim+3*del/5 && value<minim+4*del/5)
  {
    rgb_blue=0;
    rgb_red=255;
    rgb_green=255-int(map(value,minim+3*del/5,minim+4*del/5,0,255));
  }
  if(value>=minim+4*del/5 && value<=minim+del)
  {
    rgb_blue=0;
    rgb_red=255-int(map(value,minim+4*del/5,minim+del,0,127));
    rgb_green=0;
  }
}

public class Particle
{
  PVector position;
  PVector velocity;
  PVector pbest;
  float maximumvel=0.3;
  Particle()
  {
    
    position= new PVector(random(width),random(height));
    velocity= new PVector(0,0);
    pbest=new PVector(position.x,position.y);
  }
  
  public void update_position()
  {
    this.position.x=this.position.x+this.velocity.x;
    this.position.y=this.position.y+this.velocity.y;
//    print(pbest.x-position.x);
//    println(" / "+(pbest.y-position.y));
  }
 
  public void update_velocity(float omega,float c1,float c2,PVector gbest)
  {
    this.velocity.x=omega*this.velocity.x+c1*random(1)*(gbest.x-this.position.x)+c2*random(1)*(this.pbest.x-this.position.x);
    this.velocity.y=omega*this.velocity.y+c1*random(1)*(gbest.y-this.position.y)+c2*random(1)*(this.pbest.y-this.position.y);
    
    if(pow(velocity.mag(),2)>pow(maximumvel,2))
    velocity.mult((maximumvel/sqrt(pow(velocity.x,2)+pow(velocity.y,2))));
    
    
  }
  
}


