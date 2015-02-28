

// Our moonlander module
Module capsule = null;
int fps = 100;

/**
  \brief  Moonlander module falls freely towards
          the moon surface
  
*/
class Module {
  private PVector location;
  private PVector velocity;
  
  private float   ground   = 0.0;
  private int     moduleSize = 32;
  private float   g = 1.65;// Gravitational constant of the Moon
  private PImage  imgMod; // module image
  private PImage  imgExp; // explosion image
  private PImage  imgThr; // thrust image
  private float   fuel = 60.0;
  // State variables
  private boolean thrust = false;
  private boolean crash  = false;
  private int     crashCnt   = fps;
  
  public Module(PVector location, PVector velocity){
    this.location = location;
    this.location.x -= moduleSize/2;
    this.velocity = velocity;
    this.ground = height - moduleSize;
    
    imgMod = loadImage("lunar25.png");
    imgExp = loadImage("explosion.png");
    imgThr = loadImage("flame.png");
  }
  
  public void applyThrust(){
    if (fuel > 0){
      fuel--;
      thrust = true;
    }
    else {
      thrust = false;
    }
  }
  
  public void stopThrust(){
    thrust = false;
  }
  
  public void draw(){
    
    background(0);
    printPos(false);
  
    image(imgMod,location.x,location.y);
    
    if (thrust) {
      velocity.y -= g * 0.0010;
      image(imgThr,location.x + 6.0,location.y+moduleSize);
    }
    else {
      velocity.y += g * 0.0015;
    }
    
    location.add(velocity);
    
    if (location.y >= ground) {
      location.y = ground;
    }    
    
    if (location.y == ground) {
      if (velocity.y > 0.2) {
        fill(255,0,0);
        crash = true;
      }
      else {
        fill(0,255,0);
      }
      background(0);
      
      printPos(crash);
      
      if (crash) {
        image(imgExp,location.x,location.y);
        if (crashCnt > 0) {
          --crashCnt;
        }
        else {
          background(0);
          printPos(crash);
          noLoop();
        }
      }
      else {
         image(imgMod,location.x,location.y);
         noLoop();
      }    
    }
  }

  private void printPos(boolean crash)
  {
    fill(0,240,20);
    
    String strPos = nf(height-location.y-moduleSize,3,1); 
    text("Height:   " + strPos,200,20);
    
    strPos = nf(fuel,3,1);
    text("Fuel:       " + strPos,200,40);
    
    if (crash) {
      fill(#ff0000);
    }
    strPos = nf(velocity.y * 10,3,1);
    text("Velocity: " + strPos,200,60);
  }
}

void setup()
{
  size(320,480);
  frameRate(fps);
  smooth();
  
  capsule = new Module( 
    new PVector(width/2, 0), // location
    new PVector(0,0));       // velocity
}

void draw()
{
  capsule.draw();
}


void keyPressed() 
{
  if (key == CODED && keyCode == UP ) {
    capsule.applyThrust();
  }
}

void keyReleased()
{
  capsule.stopThrust();
}


