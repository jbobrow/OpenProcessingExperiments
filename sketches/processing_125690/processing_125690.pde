
ArrayList<particle> particles; 
int particleCount = 10000;
boolean a2 = false;
boolean a4 = false;
float box_x1,box_x2,box_y1,box_y2;
float collfactor;
float P = 0; 
int X = 0;
int Y = 0;
//p.drag1 = false;
//p.traject = false;


void setup()
{size(800,480);
   particles = new ArrayList<particle>();
  for (int i=0;i<particleCount;i++)
  {
    particles.add(new particle(1));  
  }
 
 background(255,255,100);
 box_x1 = 200;
 box_x2 = 500;
 box_y1 = 100;
 box_y2 = 400;
 collfactor = 0; 
 }
 
 //initialise
void draw()
{ background(255,255,100);
  rectMode(CENTER);
  rect((box_x1+box_x2)/2,(box_y1+box_y2)/2,box_x2 - box_x1,box_y2 - box_y1);
P=0;
  for (int i= 0; i<particleCount;i++)
  {
    particle p = particles.get(i);
    p.update(); 
    p.display();
     
//if (p.drag1 == true)
//{
//  stroke(0);
//  strokeWeight(3);
//  line(mouseX,mouseY,p.location.x,p.location.y);
//}
if (p.location.x<box_x1 + collfactor)
 {
   p.location.x = box_x1;
   p.velocity.x = -1*p.velocity.x;
               P+=2*p.velocity.x;
 }
  else if(p.location.x>box_x2 - collfactor)
  { p.location.x = box_x2;
   p.velocity.x = -1*p.velocity.x;
                  P+= -2*p.velocity.x;  
}
  else if(p.location.y<box_y1+ collfactor)
  {
    p.location.y = box_y1;
    p.velocity.y = -1*p.velocity.y;
               
                  P+= 2*p.velocity.y;  
}
  else if(p.location.y>box_y2-collfactor){
     p.location.y = box_y2;
    p.velocity.y = -1*p.velocity.y;
             P+= -2*p.velocity.y;  
  
}

    
  
}

println(P);

}


class particle
{
 PVector location;
 PVector velocity = new PVector(); 
  
  particle(float temp_particle_radius)
  { float particle_radius = temp_particle_radius;
  
  float a = random(200,500);
  float b = random(100,400);
  location = new PVector(a,b);
  velocity.x = random(-10,10);
  velocity.y = random(-10,10);
  }


boolean drag1 = false;
boolean traject = false;

boolean a3 = false;
void display()
{ 
  stroke(0);
  strokeWeight(1);
  ellipse(location.x,location.y,1,1);
  }


void update()
{
  location.add(velocity);
}
}


