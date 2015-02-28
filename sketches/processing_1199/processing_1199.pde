
import traer.physics.*;

ParticleSystem physics;
Particle[][] particles;
int gridSize = 100;

void setup()
{
  size(800, 800);
  smooth();
  fill(0);
  frameRate(60);

  physics = new ParticleSystem(0.0, 0.0);

  particles = new Particle[gridSize][gridSize];

  float gridStepX = (float) ((width / 2) / gridSize);
  float gridStepY = (float) ((height / 2) / gridSize);

  for (int i = 0; i < gridSize; i++)
  {
    for (int j = 0; j < gridSize; j++)
    {
      particles[i][j] = physics.makeParticle(0.2, j * gridStepX + (width / 4), i * gridStepY + 20, 0.0);
      if (j > 0)
      {
        physics.makeSpring(particles[i][j - 1], particles[i][j], 1.0, 0.1, gridStepX);
      }
    }
  }

  for (int j = 0; j < gridSize; j++)
  {
    for (int i = 1; i < gridSize; i++)
    {
      physics.makeSpring(particles[i - 1][j], particles[i][j], 1.0, 0.1, gridStepY);
    }
  }

  particles[0][0].makeFixed();
  particles[0][gridSize - 1].makeFixed();
  particles[gridSize - 1][0].makeFixed();
  particles[gridSize - 1][gridSize - 1].makeFixed();

}

void draw()
{
  physics.advanceTime(0.1);
  float dp =1000;
  int ir = 0;
  int jr = 0;
  if (mousePressed)
  {
      for (int i = 0; i < gridSize; i++)
      {
        for (int j = 0; j < gridSize; j++)
        {
          float d = sqrt((mouseX-particles[i][j].position().x())*(mouseX-particles[i][j].position().x())+(mouseY-particles[i][j].position().y())*(mouseY-particles[i][j].position().y()));
          while  (d<dp){
          dp = d;
          ir = i;
          jr = j;
          }
        }
      }  
    particles[ir][jr].moveTo(mouseX, mouseY, 0);
    particles[ir][jr].velocity().clear();
  }

  background(255);

  for (int i = 0; i < gridSize; i++)
  {
    noFill();
    beginShape(  );
    curveVertex(particles[i][0].position().x(), particles[i][0].position().y());
    for (int j = 0; j < gridSize; j++)
    {
      curveVertex(particles[i][j].position().x(), particles[i][j].position().y());
    }
    curveVertex(particles[i][gridSize - 1].position().x(), particles[i][gridSize - 1].position().y());
    endShape();
  }
  for (int j = 0; j < gridSize; j++)
  {
    noFill();
    beginShape(  );
    curveVertex(particles[0][j].position().x(), particles[0][j].position().y());
    for (int i = 0; i < gridSize; i++)
    {
      curveVertex(particles[i][j].position().x(), particles[i][j].position().y());
    }
    curveVertex(particles[gridSize - 1][j].position().x(), particles[gridSize - 1][j].position().y());
    endShape();
  }
}

void mouseReleased()
{
  particles[0][gridSize - 1].setVelocity( (mouseX - pmouseX), (mouseY - pmouseY), 0 );
}



