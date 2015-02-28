
import processing.video.*;

import traer.physics.*;



ParticleSystem physics;
Particle[][] particles;
int gridSize = 10;
PImage img;

//STRENGTH OF HANGING SPRING+GETTING 
float SPRING_STRENGTH = 0.05;
float SPRING_DAMPING = 0.05;

void setup()
{
  size(600, 600, P3D);
  img = loadImage("paperTexture.jpg");
  smooth();
  fill(255);
  textureMode(NORMAL);


  //(SETTING GRAVITY AT 0, RIGIDITY)
  physics = new ParticleSystem(0, 0.3);

  particles = new Particle[gridSize][gridSize];

  float gridStepX = (float) ((width / 1.5) / gridSize);
  float gridStepY = (float) ((height / 1.5) / gridSize);

  for (int i = 0; i < gridSize; i++)
  {
    for (int j = 0; j < gridSize; j++)
    {
      particles[i][j] = physics.makeParticle(0.2, j * gridStepX + (width / 5), i * gridStepY + 20, 0.0);
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

void draw()
{
  physics.tick();

  if (mousePressed)
  {
    //CORNER POINTS
      if (dist(mouseX, mouseY, particles[0][gridSize - 1].position().x(), particles[0][gridSize - 1].position().y()) < 0) {
     particles[0][gridSize - 1].position().set(mouseX, mouseY, 0);
     //    particles[0][gridSize - 1].velocity().clear();
     } else if (dist(mouseX, mouseY, particles[0][0].position().x(), particles[0][0].position().y()) < 40) {
     particles[0][0].position().set(mouseX, mouseY, 0);
     //    particles[0][gridSize - 1].velocity().clear();
     }else if (dist(mouseX, mouseY, particles[gridSize-1][0].position().x(), particles[gridSize-1][0].position().y()) < 40) {
     particles[gridSize-1][0].position().set(mouseX, mouseY, 0);
     //    particles[0][gridSize - 1].velocity().clear();
     }else if (dist(mouseX, mouseY, particles[gridSize-1][gridSize-1].position().x(), particles[gridSize-1][gridSize-1].position().y()) < 40) {
     particles[gridSize-1][gridSize-1].position().set(mouseX, mouseY, 0);
     //    particles[0][gridSize - 1].velocity().clear();
     }
     //CONTROL TOP POINTS
    for (int i=0; i<gridSize;i++) {
      if (dist(mouseX, mouseY, particles[0][i].position().x(), particles[0][i].position().y()) < 20) {
        particles[0][i].position().set(mouseX, mouseY, 0);
        //    particles[0][gridSize - 1].velocity().clear();
      }
    }
    
     
  }

  noFill();

  background(255);

  
  for (int i = 0; i < gridSize; i++)
  {

    beginShape();
    vertex(particles[i][0].position().x(), particles[i][0].position().y());
    for (int j = 0; j < gridSize; j++)
    {
      vertex(particles[i][j].position().x(), particles[i][j].position().y());
    }
    vertex(particles[i][gridSize - 1].position().x(), particles[i][gridSize - 1].position().y());
    endShape();
  }
  for (int j = 0; j < gridSize; j++)
  {

    beginShape();

    vertex(particles[0][j].position().x(), particles[0][j].position().y());
    for (int i = 0; i < gridSize; i++)
    {
      vertex(particles[i][j].position().x(), particles[i][j].position().y());
    }
    vertex(particles[gridSize - 1][j].position().x(), particles[gridSize - 1][j].position().y());
    endShape();
  }
  //drawing textures over top (try to for Loop this
  //top left
  beginShape();
  texture(img);
  vertex(particles[0][0].position().x(), particles[0][0].position().y());
  vertex(particles[1][0].position().x(), particles[1][0].position().y());
  vertex(particles[1][1].position().x(), particles[1][1].position().y());
  vertex(particles[0][1].position().x(), particles[0][1].position().y());
  endShape();
  
  //top mid
 /* beginShape();
  texture(img);
  vertex(particles[0][1].position().x(), particles[0][1].position().y());
  vertex(particles[0][2].position().x(), particles[0][2].position().y());
  vertex(particles[1][2].position().x(), particles[1][2].position().y());
  vertex(particles[1][1].position().x(), particles[1][1].position().y());
  endShape();
  
    //top right
  beginShape();
  texture(img);
  vertex(particles[0][2].position().x(), particles[0][2].position().y());
  vertex(particles[0][3].position().x(), particles[0][3].position().y());
  vertex(particles[1][3].position().x(), particles[1][3].position().y());
  vertex(particles[1][2].position().x(), particles[1][2].position().y());
  endShape();*/
}

void mouseReleased()
{
  particles[0][gridSize - 1].velocity().set( (mouseX - pmouseX), (mouseY - pmouseY), 3 );
}
