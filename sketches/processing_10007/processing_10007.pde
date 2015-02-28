
public class Particle {
  //a position
  private float x;
  private float y;
  // a velocity
  private float velocityX;
  private float velocityY;
  // a gravity
  private float gravityX;
  private float gravityY;
  // damping to simulate friction
  private float damping;
  // color
  private color col;
  //size
  private float particleWidth;
  private float particleHeight;
  // variables to keep track of how long the particle is alive and how long it will live
  private int life;
  private int living;
  
  //constructor, set initial variables
  public Particle() {
    x = 0;
    y = 0;
    velocityX = 0;
    velocityY = 0;
    gravityX = 0;
    gravityY = 0.05;
    damping = 0.95;
    col = color(255, 0, 0);
    particleWidth = 15;
    particleHeight = 10;
    life = 100;
    living = 0;
  }
  
  //a method to set the particles position and velocity
  public void setPos(float x, float y, float velocityX, float velocityY) {
    this.x = x;
    this.y = y;
    this.velocityX = velocityX;
    this.velocityY = velocityY;
  }
  
  //a method to update the particle (should be called avery frame
  public void update() {
    //apply gravity
     velocityX += gravityX;
     velocityY += gravityY;
     //apply speed
     x += velocityX;
     y += velocityY;
     //apply damping
     velocityX *= damping;
     velocityY *= damping;
  } 
  
  public void draw() {
    //upkeep of life/living counters
    life--;
    living++;
    //if no life then don't draw
    if (life<0) return;
    //draw the particle
    noStroke();
    // use alpha to fade away when life gets low
    fill(col, min(244, life*5));
    //use living to adjust the size
    float w = particleWidth * min(1, living*0.05);
    float h = particleHeight * min(1, living*0.05);
    //draw
    rect(x - w*0.5, y - h*0.5, w, h);
  }
    
  
  
}
  


