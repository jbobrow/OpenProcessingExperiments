
public class Particle {
  private float startx, starty, x, y;
  private float direction;
  private float xSpeed = 5, ySpeed = 2;
  private long startTime;
  private float angleAccel = 10;
  
  public Particle(float x, float y, float direction) {
    this.startx = x;
    this.x = x;
    this.y = y;
    this.starty = y;
    this.direction = direction;
    this.startTime = System.currentTimeMillis();
  }
  
  public float getX() {
    return this.x;
  }
  
  public float getY() {
    return this.y;
  }
  
  public void run() {
    moveParticle();
    drawParticle();
  }
  
  public void moveParticle() {
    //rotate(radians(angleAccel));
    if(this.x >= width || this.x < 0) {
      this.direction = -this.direction;
    }
    //move in X
    this.x += (this.direction > 0 ? -xSpeed : xSpeed);
    //decrease X accel
    this.xSpeed = (this.xSpeed >= 1 ? this.xSpeed - 0.05 : this.xSpeed);
    //gravity
    this.y += ySpeed;
    if(System.currentTimeMillis() - startTime > 30) {
      ySpeed += 0.3;
    }
  }
  
  public void drawParticle() {
    ellipse(x, y, 2, 2);
  }
}

