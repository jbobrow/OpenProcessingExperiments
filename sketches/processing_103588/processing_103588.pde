
int numParticlesPerRow = 40;
int numParticles = numParticlesPerRow * numParticlesPerRow;
color[] colors = new color[numParticles];

void setup()
{
  size(500, 500);
  for (int i=0; i<numParticles; i++)
  {
    colors[i] = color(random(100,150), random(20, 40), random(100,150), random(50,120));
  }
}

void draw()
{
  background(255);
  noStroke();
  int particleNumber = 0;
  for (int i=0; i<numParticlesPerRow; i++)
  {
    for (int j=0; j<numParticlesPerRow; j++)
    {
      fill(colors[particleNumber]);
      float x = float(i)/numParticlesPerRow * width;
      float y = float(j)/numParticlesPerRow * height;
      float scale = 0.07 * float(mouseX) / width;
      float speed = float(mouseY) / height;
      x = x + noise(x*scale, y*scale, frameCount*speed*0.021+1)*40;
      y = y + noise(x*scale, y*scale, frameCount*speed*0.02+2)*40;
      float size = noise(x*scale, y*scale, frameCount*speed*0.022)*25;
      ellipse(x, y, size, size);
      particleNumber++;
    }
  }
}
