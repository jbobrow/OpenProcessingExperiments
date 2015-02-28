
import traer.physics.*;
 
ParticleSystem Petal = new ParticleSystem(0.0, 0.5);
int num_particles =180;

Particle[] Petal_outline = new Particle[num_particles];
Particle[] Goal =  new Particle[num_particles];
Spring[] Edge = new Spring[num_particles];
Spring[] Unfold = new Spring[num_particles];

float k;
float theta;
float loc_x, loc_y;
int timer;
int grow_time;

color start, end, gradient;

void setup ()
{
  size(900,900);
  background(255);
  smooth();
  k = random(4,12);
  theta = 0;
  initialize_petal(Petal);
  loc_x = width/2;
  loc_y = height/2;
  timer = 0;
  grow_time = int(random(815,900));
  start = color(random(255),random(255),random(255));
  end = color(random(255),random(255),random(255));

}

void draw ()
{ 
  gradient = lerpColor(start, end, (0.001*timer)%255);
  strokeWeight(2);
  stroke(gradient);
  
  translate(loc_x,loc_y);
  beginShape();
  for (int i = 0; i < num_particles; i++)
  {
     if (timer == grow_time)
     {
         timer = 0;
         k = random(4,12);
         theta = 0;
         start = color(random(255),random(255),random(255));
         end = color(random(255),random(255),random(255));
         check_distance();
         initialize_petal(Petal);
     }
     
     vertex(Petal_outline[i].position().x(),Petal_outline[i].position().y()); 
  }
  endShape(CLOSE);
  
  Petal.tick();
    
  timer++;
    
  for (int i = 0; i < num_particles; i++)
  {    
    Unfold[i].setRestLength(Unfold[i].restLength() +0.5);
  }
  
}

void check_distance()
{
  float tempx, tempy;
  float distance = 0;
  
  tempx = random(20,width-20);
  tempy = random(20,height-20);
  
  while (distance < 100)  
  {
    distance = dist(loc_x,loc_y,tempx,tempy);
    
    tempx = random(20,width-20);
    tempy = random(20,height-20);
  }
  
  loc_x = tempx;
  loc_y = tempy;
}

void initialize_petal(ParticleSystem A)
{
   for (int i = 0; i < num_particles; i++)
   {
       Petal_outline[i] = A.makeParticle(1.0, 0, 0,-0.3);
   }
   
   //equation of a petal is r = cos(k*THETA)
   
   for (int i = 0; i < num_particles; i++)
   {
     float interval = TWO_PI/float(num_particles);
     theta += interval;
     float r =  cos(k*theta);  
     
     float x = r*cos(theta);
     float y = r*sin(theta);
     
     Goal[i] = A.makeParticle(1.0, x, y, 0.0);
     
     Unfold[i] =  A.makeSpring(Petal_outline[i], Goal[i],0.001, 0.001, 0.001); 
     
   }
   
   for (int i = 0; i <num_particles; i++)
   {
      if ( i < num_particles - 1)
      {
         Edge[i] = A.makeSpring(Petal_outline[i],Petal_outline[i+1], 0.001, 0.0001, 0.0001);  
      }
      else
      {
         Edge[i] = A.makeSpring(Petal_outline[i],Petal_outline[0], 0.001, 0.0001, 0.0001);
      }
   }
}

