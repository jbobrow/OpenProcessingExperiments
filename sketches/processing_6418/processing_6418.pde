
import traer.physics.*;


ParticleSystem physics;
Particle[][] particles;
int gridSize=25;
float gridStep = 28;
int XX,YY,vx,vy;
float r,g;

float SPRING_STRENGTH = 0.015;
float SPRING_DAMPING = 0.002;

void setup()
{
  size(600, 600);
  println(gridStep);
  smooth();
  fill(0);
  stroke(0);      
  physics = new ParticleSystem(0, 0.0003);

  particles = new Particle[gridSize][gridSize];



  for (int i = 0; i < gridSize; i++)
  {
    for (int j = 0; j < gridSize; j++)
    {
      particles[i][j] = physics.makeParticle(0.2, j * gridStep, i * gridStep, 0.0);
      if(i==0||j==0||i==gridSize-1||j==gridSize-1){
        particles[i][j].makeFixed();
      }

      if (j > 0)
      {
        physics.makeSpring(particles[i][j - 1], particles[i][j], SPRING_STRENGTH, SPRING_DAMPING, gridStep+0.0);
        //+0.1 means: all springs are a little bit compressed and that brings less stability.
        //try 0 or even less
      }
    }
  }

  for (int j = 0; j < gridSize; j++)
  {
    for (int i = 1; i < gridSize; i++)
    {
      physics.makeSpring(particles[i - 1][j], particles[i][j], SPRING_STRENGTH, SPRING_DAMPING, gridStep);
    }
  }


}

void draw()
{
  physics.tick();

  if (mousePressed)
  {
    XX=int(round (mouseX/gridStep));
    YY=int(round(mouseY/gridStep));
    vx=-int(round(gridStep*XX-mouseX));
    vy=-int(round(gridStep*YY-mouseY));
    particles[YY][XX].velocity().add(vx/8, vy/8, 0);

  }

  noFill();

  background(255);

  for (int i = 0; i < gridSize; i++)
  {
    for (int j = 0; j < gridSize; j++)
    {
      if(i<(gridSize-1)&&j<(gridSize-1)){
        r=2*dist(particles[i][j].position().x(), particles[i][j].position().y(), particles[i+1][j+1].position().x(), particles[i+1][j+1].position().y());
        g=2*dist(particles[i+1][j].position().x(),   particles[i+1][j].position().y(),   particles[i][j+1].position().x(),particles[i][j+1].position().y());
        fill(10*abs(r-g),6*abs(r-g),r*g/80);
        quad(particles[i][j].position().x(),particles[i][j].position().y(),particles[i+1][j].position().x(),particles[i+1][j].position().y(),particles[i+1][j+1].position().x(),particles[i+1][j+1].position().y(),particles[i][j+1].position().x(),particles[i][j+1].position().y());

      }

    }
  }


}




