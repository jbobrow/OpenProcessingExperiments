
import java.util.Iterator;
ArrayList<Particle> particles;
int numOfParticles;

public void setup() {
  size(300, 300);
  background(255);
  numOfParticles = 20;
  particles = new ArrayList<Particle>();
  for (int i = 0; i < numOfParticles; i++) {
    particles.add(new Particle());
  }
}

public void draw() {
  background(255);
  for (Particle currentParticle : particles) {
    currentParticle.update();
  }

  for (Particle currentParticle : particles) {
    currentParticle.draw();
  }


  Iterator<Particle> i = particles.iterator();
  while (i.hasNext ()) {
    Particle currentParticle = i.next(); 
    if (currentParticle.isDead()) {
      i.remove();
    }
  }
}

class Particle {
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private PVector size;
  private Timer lifetime;
  
  public Particle() {
    position = new PVector();
    position.x = random(0,width);
    position.y = random(0, height);
    velocity = new PVector(3,-10);
    acceleration = new PVector(0,1);
    size = new PVector(5,5);
    lifetime = new Timer();
    lifetime.setDelay(5000);
    lifetime.start();
  }
  public void draw() {
    stroke(255,0,0);
    ellipse(position.x, position.y,size.x,size.y);
    
  }
  
  public void update(){
    velocity.add(acceleration);
    position.add(velocity);
    if(position.y+size.y/2>= height){
      position.y = height-size.y/2;
      velocity.y = -velocity.y;
    }
    if (position.x+size.x/2>= width){
      position.x = width-size.x/2;
      velocity.x = -velocity.x;
    }
    if(position.x-size.x/2<= 0){
      position.x = size.x/2;
      velocity.x = -velocity.x;
    }

    
  }
  
  public boolean isDead(){
    return lifetime.isFinished();
  }
}

class Timer {
  private int timeDelay;
  private boolean isRunning;
  private int startTime;

  public Timer() {
    isRunning = false;
    timeDelay = 0;
    startTime = 0;
  }

  public void setDelay(int timeDelay) {
    this.timeDelay = timeDelay;
  }

  public void start() {
    startTime = millis();
    isRunning = true;
  }
  
  public boolean isFinished(){   
    return isRunning && startTime + timeDelay <= millis();
  }
  

}



