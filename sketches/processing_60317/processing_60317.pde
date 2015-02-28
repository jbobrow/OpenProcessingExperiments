
import oscP5.*;
import netP5.*;
import traer.physics.*;

ParticleSystem physics;
Particle[][] particles;
int gridSize = 15;
int angulo = -5; 
int angulo2;

float SPRING_STRENGTH = 0.2;
float SPRING_DAMPING = 0.147;

void setup() {
  
  size(500, 400);
  smooth();
  fill(0);
  frameRate(10);

  physics = new ParticleSystem(0.1, 0.01);

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
        physics.makeSpring(particles[i][j - 1], particles[i][j], SPRING_STRENGTH, SPRING_DAMPING, gridStepX);
      }
    }
  }

  for (int j = 0; j < gridSize; j++)
  {
    for (int i = 1; i < gridSize; i++)
    {
      physics.makeSpring(particles[i - 1][j], particles[i][j], SPRING_STRENGTH, SPRING_DAMPING, gridStepY);
    }
  }

  particles[0][0].makeFixed();
  particles[0][gridSize - 1].makeFixed();
}

void draw() {
  physics.tick();

  if (mousePressed) {
    particles[0][gridSize - 1].position().set(mouseX, mouseY, 0);
    particles[0][gridSize - 1].velocity().clear();
  }


  stroke(82,143,165);
  strokeWeight(7);
  noFill();

  background(255);
  /*rotate( radians(random(angulo2)) );
  /*translate (width/4, height/4);*/
  for (int i = 0; i < gridSize; i++)
  {
    strokeWeight(i);
    beginShape();  
    vertex(particles[i][0].position().x(),particles[i][0].position().y());
    for (int j = 0; j < gridSize; j++)
    {

      vertex(particles[i][j].position().x(),particles[i][0].position().y());
    }
    vertex(particles[i][gridSize - 1].position().x(), particles[i][gridSize - 1].position().y());
    endShape();
  }
  /* angulo++;
   angulo2++;*/
}
void keyPressed() {
  if(key=='s') {
     if(key== 's'){
    saveFrame("Gravity-####.jpg");

  }
}
}
float linexp (float x, float a, float b, float c, float d)
{
  if (x <= a) return c;
  if (x >= b) return d;
  return pow(d/c, (x-a)/(b-a)) * c;
}


