
NavierStokesSolver fluidSolver;
double visc, diff, vScale, velocityScale;
float  limitVelocity;
int oldMouseX = 1, oldMouseY = 1;
int numParticles;
Particle[] particles;
Random rnd = new Random();

boolean vectors = false;

public void setup() {

  size(512, 512, P2D);
  frameRate(60);

  fluidSolver = new NavierStokesSolver();

  numParticles = (int)pow(2, 16);
  particles = new Particle[numParticles];
  visc = 0.00025f;
  diff = 0.03f;
  vScale = 10;
  velocityScale = vScale;
  vectors = true;

  limitVelocity = 200;

  stroke(color(0));
  fill(color(0));

  initParticles();
}

private void initParticles() {
  for (int i = 0; i < numParticles - 1; i++) {
    particles[i] = new Particle();
    particles[i].x = rnd.nextFloat() * width;
    particles[i].y = rnd.nextFloat() * height;
  }
}

public void draw() {

  handleMouseMotion();

  background(0);

  double dt = 1 / frameRate;
  fluidSolver.tick(dt, visc, diff);

  if (vectors)
    drawMotionVectorsImmediate((float) vScale * 4);

  vScale = velocityScale * 60. / frameRate;
  //drawParticlesImmediate();
  drawParticlesPixels();

  fill(255);
  textSize(20);
  text("fps: " + nf(frameRate, 2, 1), 10, 20);
}

private void drawParticlesImmediate() {

  int n = NavierStokesSolver.N;
  float cellHeight = height / n;
  float cellWidth = width / n;

  beginShape(QUADS);
  noStroke();
  fill(255);

  for (Particle p : particles) {
    if (p != null) {

      int cellX = floor(p.x / cellWidth);
      int cellY = floor(p.y / cellHeight);
      float dx = (float) fluidSolver.getDx(cellX, cellY);
      float dy = (float) fluidSolver.getDy(cellX, cellY);

      float lX = p.x - cellX * cellWidth - cellWidth / 2;
      float lY = p.y - cellY * cellHeight - cellHeight / 2;

      int v, h, vf, hf;

      if (lX > 0) {
        v = Math.min(n, cellX + 1);
        vf = 1;
      } 
      else {
        v = Math.max(0, cellX - 1);
        vf = -1;
      }

      if (lY > 0) {
        h = Math.min(n, cellY + 1);
        hf = 1;
      } 
      else {
        h = Math.max(0, cellY - 1);
        hf = -1;
      }

      float dxv = (float) fluidSolver.getDx(v, cellY);
      float dxh = (float) fluidSolver.getDx(cellX, h);
      float dxvh = (float) fluidSolver.getDx(v, h);

      float dyv = (float) fluidSolver.getDy(v, cellY);
      float dyh = (float) fluidSolver.getDy(cellX, h);
      float dyvh = (float) fluidSolver.getDy(v, h);

      dx = lerp(lerp(dx, dxv, vf * lX / cellWidth), 
      lerp(dxh, dxvh, vf * lX / cellWidth), 
      hf * lY / cellHeight);

      dy = lerp(lerp(dy, dyv, vf * lX / cellWidth), 
      lerp(dyh, dyvh, vf * lX / cellWidth), 
      hf * lY / cellHeight);

      p.x += dx * vScale;
      p.y += dy * vScale;

      if (p.x < 0 || p.x >= width) {
        p.x = random(width);
      }
      if (p.y < 0 || p.y >= height) {
        p.y = random(height);
      }

      vertex(p.x, p.y);
      vertex(p.x + 2, p.y);
      vertex(p.x, p.y + 2);
      vertex(p.x + 2, p.y + 2);
    }
  }
  endShape();
}

  int c = color(255);


private void drawParticlesPixels() {

  int n = NavierStokesSolver.N;
  float cellHeight = height / n;
  float cellWidth = width / n;

  for (Particle p : particles) {
    if (p != null) {

      int cellX = floor(p.x / cellWidth);
      int cellY = floor(p.y / cellHeight);
      float dx = (float) fluidSolver.getDx(cellX, cellY);
      float dy = (float) fluidSolver.getDy(cellX, cellY);

      float lX = p.x - cellX * cellWidth - cellWidth / 2;
      float lY = p.y - cellY * cellHeight - cellHeight / 2;

      int v, h, vf, hf;

      if (lX > 0) {
        v = Math.min(n, cellX + 1);
        vf = 1;
      } 
      else {
        v = Math.max(0, cellX - 1);
        vf = -1;
      }

      if (lY > 0) {
        h = Math.min(n, cellY + 1);
        hf = 1;
      } 
      else {
        h = Math.max(0, cellY - 1);
        hf = -1;
      }

      float dxv = (float) fluidSolver.getDx(v, cellY);
      float dxh = (float) fluidSolver.getDx(cellX, h);
      float dxvh = (float) fluidSolver.getDx(v, h);

      float dyv = (float) fluidSolver.getDy(v, cellY);
      float dyh = (float) fluidSolver.getDy(cellX, h);
      float dyvh = (float) fluidSolver.getDy(v, h);

      dx = lerp(lerp(dx, dxv, vf * lX / cellWidth), 
      lerp(dxh, dxvh, vf * lX / cellWidth), 
      hf * lY / cellHeight);

      dy = lerp(lerp(dy, dyv, vf * lX / cellWidth), 
      lerp(dyh, dyvh, vf * lX / cellWidth), 
      hf * lY / cellHeight);

      p.x += dx * vScale;
      p.y += dy * vScale;

      if (p.x < 0 || p.x >= width) {
        p.x = random(width);
      }
      if (p.y < 0 || p.y >= height) {
        p.y = random(height);
      }

      set((int) p.x, (int) p.y, c);
    }
  }
}

private void drawMotionVectorsImmediate(float l) {
  int n = NavierStokesSolver.N;
  float cellHeight = height / n;
  float cellWidth = width / n;
  float dx, dy, x, y, x1, y1, x2, y2, x3, y3;
  int i, j;

  float thick = 0.1f;

  beginShape(TRIANGLES);

  // stroke(255);
  // noFill();
  noStroke();
  fill(255, 64);
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {

      dx = (float) fluidSolver.getDx(i, j);
      dy = (float) fluidSolver.getDy(i, j);

      x = cellWidth / 2 + cellWidth * i;
      y = cellHeight / 2 + cellHeight * j;

      x1 = x + dx * l;
      y1 = y + dy * l;

      x2 = x + dy * l * thick;
      y2 = y - dx * l * thick;

      x3 = x - dy * l * thick;
      y3 = y + dx * l * thick;

      // normal(0, 0, 1f);
      vertex(x1, y1);
      vertex(x2, y2);
      vertex(x3, y3);
    }
  }
  endShape();
}

private void handleMouseMotion() {
  mouseX = max(1, mouseX);
  mouseY = max(1, mouseY);

  int n = NavierStokesSolver.N;
  float cellHeight = height / n;
  float cellWidth = width / n;

  float mouseDx = mouseX - oldMouseX;
  float mouseDy = mouseY - oldMouseY;
  int cellX = floor(mouseX / cellWidth);
  int cellY = floor(mouseY / cellHeight);

  mouseDx = (abs(mouseDx) > limitVelocity) ? Math.signum(mouseDx) * limitVelocity : mouseDx;
  mouseDy = (abs(mouseDy) > limitVelocity) ? Math.signum(mouseDy) * limitVelocity : mouseDy;

  fluidSolver.applyForce(cellX, cellY, mouseDx, mouseDy);

  oldMouseX = mouseX;
  oldMouseY = mouseY;
}

public class Particle {
  public float x;
  public float y;
}


