
import traer.physics.*;
//press 1,2,3 or 4 for different colors
ParticleSystem physics;
Particle[][] particles;
int gridSize=32;
float gridStep = 31;
float gridStep2=gridStep*sqrt(0.75);
float r,g,b;
int auswahl=0;
float SPRING_STRENGTH = 0.01;
float SPRING_DAMPING = 0.01;

void setup()
{
  size(600, 600);
  println(gridStep);
  //smooth();
  fill(0);
  stroke(0); 
  strokeWeight(1);
  physics = new ParticleSystem(0, 0.0003);
  particles = new Particle[gridSize][gridSize];
  for (int i = 0; i < gridSize; i++)
  {
    for (int j = 0; j < gridSize; j++)
    {
      particles[i][j] = physics.makeParticle(0.2,-360+i*gridStep+j*gridStep/2,j*gridStep2, 0.0);
      if(i==0||j==0||i==gridSize-1||j==gridSize-1){
        particles[i][j].makeFixed();
      }
    }
  }

  for (int j = 0; j < gridSize-1; j++)
  {
    for (int i = 0; i < gridSize-1; i++)
    {
      physics.makeSpring(particles[i][j], particles[i+1][j], SPRING_STRENGTH, SPRING_DAMPING, gridStep);
      physics.makeSpring(particles[i][j], particles[i][j+1], SPRING_STRENGTH, SPRING_DAMPING, gridStep);
      physics.makeSpring(particles[i][j+1], particles[i+1][j], SPRING_STRENGTH, SPRING_DAMPING, gridStep);
    }
  }
}

void draw()
{
  physics.tick();
  if (mousePressed)
  {
    particles[round(gridSize/2)][round(gridSize/3)+1].velocity().add(0,0,random(-12,12));
  }
  noFill();
  background(255);
  for (int i = 0; i < gridSize-1; i++)
  {
    for (int j = 0; j < gridSize-1; j++)
    {
      r=0.7*dist(particles[i][j].position().x(),  particles[i][j].position().y(),particles[i][j+1].position().x(),  particles[i][j+1].position().y());
      g=0.7*dist(particles[i][j+1].position().x(),  particles[i][j+1].position().y(),particles[i+1][j].position().x(),  particles[i+1][j].position().y());
      b=0.7*dist(particles[i][j].position().x(),  particles[i][j].position().y(),particles[i+1][j].position().x(),  particles[i+1][j].position().y());
      switch(auswahl){
      case 0:
        fill(9*sqrt(abs(r*r-300)),9*sqrt(abs(g*g-300)),9*sqrt(abs(b*b-300)));
        break;
      case 1:
        fill(0.7*r*r,min(0.5*r*r,0.4*g*g),min(0.4*r*r,0.3*b*b));
        break;
      case 2:
        fill(r/(0.7*gridStep)*240,g/(0.7*gridStep)*220,b/(0.7*gridStep)*150);
        break;
      case 3:
        fill( 50+3*(pow((r/0.7)-gridStep,2)+pow((g/0.7)-gridStep,2)),30+4*(pow((g/0.7)-gridStep,2)+pow((b/0.7)-gridStep,2)),50+4*(pow((r/0.7)-gridStep,2)+pow((b/0.7)-gridStep,2)));
        break;  
      }
      triangle(particles[i][j].position().x(),  particles[i][j].position().y(),particles[i][j+1].position().x(),  particles[i][j+1].position().y(),particles[i+1][j].position().x(),  particles[i+1][j].position().y());
      triangle(particles[i+1][j].position().x(),  particles[i+1][j].position().y(),particles[i+1][j+1].position().x(),  particles[i+1][j+1].position().y(),particles[i][j+1].position().x(),  particles[i][j+1].position().y());
    }
  }
}
void keyReleased(){
  switch(key) {
  case '1':
    auswahl=0;
    break;
  case '2':
    auswahl=1;
    break;
  case '3':
    auswahl=2;
    break;
  case '4':
    auswahl=3;
    break;
  }
}












