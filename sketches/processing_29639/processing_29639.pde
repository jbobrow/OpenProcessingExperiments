
float yrot = +.01;
float yrot2 = +.01;
float yrot3 = +.01;
import processing.opengl.*;
import peasy.*;
import traer.physics.*;
import controlP5.*;


ParticleSystem physics;
Particle[] particles;
int gridSize = 40;
Particle repulsor;
PeasyCam camera;
ControlP5 controlP5;
PMatrix3D currCameraMatrix;
PGraphics3D g3; 
int buttonValue = 1;

int myColor = color(118, 229, 255);


float SPRING_STRENGTH = 0.5;
float SPRING_DAMPING = 0.1;

void setup()
{
  size(400, 400, OPENGL);
  g3 = (PGraphics3D)g;
  controlP5 = new ControlP5(this);
  controlP5.addButton("button", 10, 100, 60, 80, 20).setId(1);
  controlP5.addButton("buttonValue", 4, 100, 90, 80, 20).setId(2);
  controlP5.setAutoDraw(false);
  smooth();
  fill(0);
  camera = new PeasyCam(this, 200, 200, 0, 400);
  physics = new ParticleSystem(0.001, 0.01);
  particles = new Particle[gridSize];

  float gridStepX = (float) ((width / 2) / gridSize);
  float gridStepY = (float) ((height / 2) / gridSize);

  for (int i = 0; i < gridSize; i++)
  {

    particles[i] = physics.makeParticle(0.2, 50, 50, i*5.0);
  }

  repulsor = physics.makeParticle(1, 200, 200, 0); 
  repulsor.makeFixed();

  for (int i = 0; i < gridSize; i++)
  {
    physics.makeSpring(particles[i], repulsor, SPRING_STRENGTH, SPRING_DAMPING, 150); //this keps the particles in orbit around the center
    for (int j = 1; j < gridSize; j++)
    {
      physics.makeAttraction(particles[j], particles[i], -500, 5); //this pushes all the particles away from each other so they spread out in a sphere
    }
  }
}

void draw()
{
  physics.tick();

  background(255);
  rotateY(yrot2+=.01); 
  pushMatrix();
  sphereDetail(10);
  fill(255, 62, 197, 70);
  translate(200, 200, 10);
  rotateY(yrot+=.01);
  sphere(50);
  popMatrix();
  for (int i = 1; i < gridSize; i++)
  {
    fill(myColor);
    pushMatrix();
    translate(particles[i].position().x(), particles[i].position().y(), particles[i].position().z());
    rotateY(yrot3+=.0005);
    sphereDetail(10);
    sphere(15);

    popMatrix();
    stroke(0);

    beginShape();
    vertex(particles[i].position().x(), particles[i].position().y(), particles[i].position().z());
    vertex(repulsor.position().x(), repulsor.position().y(), repulsor.position().z());
    endShape();
  }
  gui();
}

void gui() {
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  controlP5.draw();
  g3.camera = currCameraMatrix;
}

void controlEvent(ControlEvent theEvent) {
  println(theEvent.controller().id());
}

void button(float theValue) {
  myColor = color(random (118), random(229), random(255));
  println("a button event. "+theValue);
}


