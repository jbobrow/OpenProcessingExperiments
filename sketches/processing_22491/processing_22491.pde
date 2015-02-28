
import traer.physics.*;
 
ParticleSystem Petal = new ParticleSystem(0.0, 0.5);
int num_flowers = 4;
int num_particles = 200;

Particle[][] Petal_outline = new Particle[num_flowers][num_particles];
Particle[][] Goal =  new Particle[num_flowers][num_particles];
Spring[][] Edge = new Spring[num_flowers][num_particles];
Spring[][] Unfold = new Spring[num_flowers][num_particles];

PVector[] flower_loc = new PVector[num_flowers];

int k;
float theta;
int timer;
int grow_time;

color start, end, gradient;

void setup ()
{
  size(900,900);
  background(255);
  smooth();
  k = int(random(4,15));
  theta = 0;
  initialize_petal(Petal);
  initialize_flower_loc();
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

  //beginShape();
  //translate(width/2, height/2);
  
  for (int i = 0; i < num_flowers; i++)
  {
    
    pushMatrix();
    translate(flower_loc[i].x, flower_loc[i].y);
    
    beginShape();
    for (int j = 0; j < num_particles; j++)
    {  
       vertex(Petal_outline[i][j].position().x(),Petal_outline[i][j].position().y()); 
    }
    endShape(CLOSE);
    
    popMatrix();
    
  }
  //endShape(CLOSE);
  
  
  if (timer <= grow_time)
  {
    Petal.tick(); 
    
    for (int i = 0; i < num_flowers; i ++)
    {  
      for (int j = 0; j < num_particles; j++)
      {    
        Unfold[i][j].setRestLength(Unfold[i][j].restLength() +0.5);
      }
    }
  }
  
  if (timer > grow_time)
  {
   //Petal.tick(-1); 
   
   
   for (int i = 0; i < num_flowers; i ++)
    {  
      Petal.tick();
      
      for (int j = 0; j < num_particles; j++)
      {    
        Unfold[i][j].setRestLength(Unfold[i][j].restLength() -0.5);
      }
    }
   
  }
  
  timer++;
}

void initialize_flower_loc()
{
  for (int i = 0; i < num_flowers; i++)
  {
     flower_loc[i] = new PVector(random(50, width-50), random(50, height-50));
  }
}

void initialize_petal(ParticleSystem A)
{
   
  for (int i = 0; i < num_flowers; i++)
  {
   k = int(random(4,14));
   for (int j = 0; j < num_particles; j++)
   {
     //initialize the petal outline
     Petal_outline[i][j] = A.makeParticle(1.0, 0, 0,-0.3);
     
     //calculate rose curve coordinates
     //equation of a petal is r = cos(k*THETA)
     float interval = TWO_PI/float(num_particles);
     theta += interval;
     float r =  cos(k*theta);  
     
     float x = r*cos(theta);
     float y = r*sin(theta);
     
     Goal[i][j] = A.makeParticle(1.0, x, y, 0.0);
     
     Unfold[i][j] =  A.makeSpring(Petal_outline[i][j], Goal[i][j],0.001, 0.001, 0.001); 
     
   }
  }
   
  //link flower edge points on outline together 
  for (int i = 0; i < num_flowers; i++)
  {
     for (int j = 0; j <num_particles; j++)
     {
        if ( j < num_particles - 1)
        {
           Edge[i][j] = A.makeSpring(Petal_outline[i][j],Petal_outline[i][j+1], 0.001, 0.0001, 0.0001);  
        }
        else
        {
           Edge[i][j] = A.makeSpring(Petal_outline[i][j],Petal_outline[i][0], 0.001, 0.0001, 0.0001);
        }
     }
  }
}

