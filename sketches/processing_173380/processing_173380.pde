
particle p = new particle(1);
boolean a2 = false;
boolean a4 = false;
float box_x1,box_x2,box_y1,box_y2;
float collfactor;
int P = 0;
//p.drag1 = false;
//p.traject = false;
 
 
void setup()
{
 size(800,480);
  background(255,255,100);
 
 box_x1 = 200;
 box_x2 = 500;
 box_y1 = 100;
 box_y2 = 400;
 collfactor = 0;
 rectMode(CENTER);
 rect((box_x1+box_x2)/2,(box_y1+box_y2)/2,box_x2 - box_x1,box_y2 - box_y1);
 fill(0);
textSize(18);
     text("click in the box to generate a particle. Click again to give veloctiy in the direction.",10,33);
 
 
}
  
 //initialise
void draw()
{   //if (p.drag1 == true)
//{
//  stroke(0);
//  strokeWeight(3);
//  line(mouseX,mouseY,p.location.x,p.location.y);
//}
 
 
//trajectory
if (p.traject== true)
{ p.update();
  p.trajectory();
}
 
if (a4 == true){
if (p.location.x<=box_x1 + collfactor)
 {
   p.location.x = box_x1;
   p.velocity.x = -1*p.velocity.x;
               P+=1;
 }
  else if(p.location.x>=box_x2 - collfactor)
  { p.location.x = box_x2;
   p.velocity.x = -1*p.velocity.x;
                  P+=1; 
}
  else if(p.location.y<=box_y1+ collfactor)
  {
    p.location.y = box_y1;
    p.velocity.y = -1*p.velocity.y;
                 P+=1; 
}
  else if(p.location.y>=box_y2-collfactor){
     p.location.y = box_y2;
    p.velocity.y = -1*p.velocity.y;
                      P+=1; 
}
}
}
 
void mousePressed()
{
 
if (a2 == true) 
{p.velocity();
  p.drag1 = false;
p.traject = true;
 
} 
  
  if (a2 == false)
  {p.location();
      p.drag1 = true;
    a2 = true;
   a4 = true;
 }
 
 
if (p.a3 == false){
 p.display();}
}
class particle
{
 PVector location;
 PVector velocity = new PVector();
   
  particle(float temp_particle_radius)
  { float particle_radius = temp_particle_radius;
  }
 
 
boolean drag1 = false;
boolean traject = false;
boolean a3;
void location()
{
  location = new PVector(mouseX,mouseY);
  a3 = false;
drag1 = true;
}
void update(){
  location.add(velocity);
   
}
void display()
{
  ellipse(location.x,location.y,10,10);
  boolean a3 = true;
}
void velocity()
{
  PVector mouse = new PVector (mouseX,mouseY);
  velocity = PVector.sub(mouse,location);
 velocity.normalize();
velocity.mult(2);
//a3 = false;
}
 
void trajectory()
{ stroke(0);
  strokeWeight(3);
  line(location.x+1,location.y+1,location.x,location.y);
  a3 = true;
}
}

