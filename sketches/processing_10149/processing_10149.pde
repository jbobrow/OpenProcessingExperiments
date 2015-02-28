
class Particle{
  
  float x, y;
  float Alpha = 255;
  float velocityX;
  float velocityY;
  float targetLocationX = 0;
  float targetLocationY = 0;
  float Color;
  
  public Particle(){
    
  }
  
  public void Maken(){
    fill(255, Color, 0);
    ellipse (x, y, 13, 13);
  }
}

