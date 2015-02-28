
class Particle{
  
  private ParticleEngine engine;
  
  float x, y;
  float velocityX = 5;
  float velocityY = -5;
  float gravityX = 0.01;
  float gravityY = 0.2;
  float Alpha = 255;
  float Color;
  float Color2 = 0;
  
  public Particle(){
    
  }
  
  public void Maken(){
    fill(255, Color, Color2, Alpha);
    ellipse (x, y, 13, 13);
    x += velocityX;
    y += velocityY;
    velocityY += gravityY;
    velocityX -= gravityX;
    Alpha -= 4;    
  }
  
  public void Reset(){
    velocityX = 5;
    velocityY = -5;
    Alpha = 255;
  }
}

