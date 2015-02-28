
public class Particle {
  //a reference to the engine
  protected ParticleEngine engine;
  //a position
  public float x;
  public float y;
  // a velocity
  public float velocityX;
  public float velocityY;
  // a gravity
  protected float gravityX;
  protected float gravityY;
  // damping to simulate friction
  protected float damping;
  // color
  protected color col;
  //size
  protected float size;
  // variables to keep track of how long the particle is alive and how long it will live
  protected int life;
  protected int living;
   
  // flag to indicate whether or not the particle is destroyed
  public boolean destroyed;
   
  //flag to indicate the particle is being dragged
  public boolean dragged;
 
  public boolean pinned ;
   
  public String label;
   
   
  //constructor, set initial variables
  public Particle(String label, float x, float y, float velocityX, float velocityY) {
    engine = null;
    this.label = label;
    this.x = x;
    this.y = y;
    this.velocityX = velocityX;
    this.velocityY = velocityY;
    gravityX = 0;//random(-0.5,0.5);
    gravityY = 0;//random(-0.5,0.5);
    damping = 0.9;
    //randomize the color
    col = color(0, 200, 120,200);
    //randomize the size
    size = 30;
    //set life to -1 to live forever
    life = -1;
    living = 0;
     
    //set flags
    destroyed = false;
    dragged = false;
    pinned = false;
  }
   
  public void setEngine(ParticleEngine engine) {
    this.engine = engine;
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
    if (dragged) {
      x = mouseX;
      y = mouseY;
      velocityX =0;
      velocityY =0;
      return;
    }
    if (pinned) {
      velocityX =0;
      velocityY =0;
      return;
    }
     
    //apply gravity
     velocityX += gravityX;
     velocityY += gravityY;
     //apply damping
     velocityX *= damping;
     velocityY *= damping;
     //apply speed
     x += velocityX;
     y += velocityY;
     if (life>0) {
       life--;
       if (life<=0) destroyed = true;
     }
  }
   
  public void draw() {
   if (destroyed) return;
    //draw the particle
    noStroke();
    // use alpha to fade away when life gets low
    fill(col);
    ellipse(x, y, size, size);
    fill(255,0,0);
    text(label, x-textWidth(label)*0.5, y+5);
  }
   
  public void pin(float x, float y) {
    this.x = x;
    this.y = y;
    pinned = true;
  }
}
  


