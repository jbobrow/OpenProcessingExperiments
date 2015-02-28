
import java.util.Iterator;
import java.util.LinkedList;

class Particle {
  public float x, y, z, dx, dy, dz;
}

int numParticles = 1024*32;
LinkedList<Particle> particleList = new LinkedList<Particle>();

float d = 0.75f; // distance between two points

float a = 10.f; // Lorenz-Attractor parameters
float b = 28.f;
float c = 8.f / 3.f;

void advanceParticle(Particle p) {
  p.dx = a * (p.y - p.x);
  p.dy = p.x * (b - p.z) - p.y;
  p.dz = p.x * p.y - c * p.z;
  float l = sqrt((float) (p.dx * p.dx + p.dy * p.dy + p.dz * p.dz));
  p.dx *= d / l;
  p.dy *= d / l;
  p.dz *= d / l;
  p.x += p.dx;
  p.y += p.dy;
  p.z += p.dz;
}

public void setup() {
  size(512, 512, P3D);
  frameRate(60);
  stroke(color(0, 0, 0, 24));
  strokeWeight(2.0f);
  initParticles();
  //smooth();
}

private void initParticles() {
  float x = random(3), y = random(3), z = random(3);
  Particle p = new Particle();
  p.x = x;
  p.y = y;
  p.z = z;
  particleList.add(p);
  for (int i = 1; i < numParticles; i++) {
    p = new Particle();
    p.x = x;
    p.y = y;
    p.z = z;
    advanceParticle(p);
    x = p.x;
    y = p.y;
    z = p.z;
    particleList.add(p);
  }
}

private void advanceParticles() {
  // take and remove the first particle from list
  Particle p = particleList.pollFirst();
  // copy values from the most advanced particle
  Particle end = particleList.peekLast();
  p.x = end.x;
  p.y = end.y;
  p.z = end.z;
  // advance and add to the end of the list
  advanceParticle(p);
  particleList.add(p);
}

public void draw() {
  advanceParticles();
  if (mouseY == 0)
    mouseY = 1;
  float w1 = (float) mouseX / (float) width * PI * 2;
  float w2 = (float) mouseY / (float) height * PI;
  float d = 60;
  camera(d * cos(w1) * sin(w2), cos(w2) * d, d * sin(w1) * sin(w2), 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f);
  background(255);
  Iterator<Particle> it = particleList.iterator();
  while (it.hasNext ()) {
    Particle p = it.next();
    line(p.x, p.y, p.z - 30, p.x - p.dx, p.y - p.dy, p.z - p.dz - 30);
  }
}


