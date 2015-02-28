
import processing.opengl.*;
 
ArrayList particles;
float gravMultiplier = 0.7;
float extMultiplier = 0.000001;
float repelMultiplier = 0.01;
float minNeighborDistance = 30;
 
void setup()
{
  size(800, 600, OPENGL);
  particles = new ArrayList();
 
  for (int i=0; i < 100; i++)
    SpawnNewParticle();
 
  background(0);
}
 
void SpawnNewParticle()
{
  particles.add(new Particle( new PVector(random(width), random(height), random(400)-200), //location
  new PVector(random(2.0)-1.0, random(2.0)-1.0, 0.0), //direction
  new PVector(random(0.02)-0.01, random(0.02)-0.01, 0.0), //acceleration
  8+random(4),
  color(128 + random(128))));
}
 
float cameraAngle = 0.0;
float camDistance = 1000;
void draw()
{
  cameraAngle = mouseX/float(width) * 180 - 90;
  camDistance = 500 + 1000 * mouseY/float(height);
 
  camera(width/2 + camDistance*sin(radians(cameraAngle)), height/2, camDistance*cos(radians(cameraAngle)), width/2, height/2, 0, 0.0, 1.0, 0.0);
  lights();
 
  background(0);
 
  noFill();
  stroke(255, 255, 255, 120);
  line(0, 0, -400, 0, height, -400);
  line(0, height, -400, width, height, -400);
  line(width, height, -400, width, 0, -400);
  line(width, 0, -400, 0, 0, -400);
 
  line(0, 0, 400, 0, height, 400);
  line(0, height, 400, width, height, 400);
  line(width, height, 400, width, 0, 400);
  line(width, 0, 400, 0, 0, 400);
 
  line(0, 0, -400, 0, 0, 400);
  line(0, height, -400, 0, height, 400);
  line(width, height, -400, width, height, 400);
  line(width, 0, -400, width, 0, 400);
 
  for (int i=0; i<particles.size(); i++)
  {
    ((Particle)particles.get(i)).render();
    ((Particle)particles.get(i)).update(particles);
  }
}
 
void mousePressed()
{
  SpawnNewParticle();
}
 
void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP)
      minNeighborDistance += 5;
    else if (keyCode == DOWN && minNeighborDistance >= 5)
      minNeighborDistance -= 5;
  }
}


