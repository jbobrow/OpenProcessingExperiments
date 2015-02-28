
import ddf.minim.*;

Minim minim = new Minim(this);

ArrayList<Particle> particles = new ArrayList();

Particle centre;

void setup() {
  // cache
  minim.loadFile("Sound_Effect.wav");
  
  size(400, 400); 
  noStroke();
  smooth();
  
  centre = new Particle(width / 2f, height / 2f, 0, 0);
  centre.setFixed(true);
}

void draw() {
  fill(#3A7A93,20);
  noStroke();
  ellipse(200,200,200,200);
  ellipse(200,200,300,300);
  ellipse(200,200,100,100);
  fill(#404F55,20);
  rect(0,0,400,400);
  fill(#FFB039);
  stroke(#FFB039);
  
  centre.draw();
  
  for (Particle p : particles) {
    // applyDissipativeForce(p, 0.001);
    applyAttractiveForce(centre, p, 100f, 20f);
    
    p.move();
    p.draw();
    p.play();
  }  
}

void mouseDragged() {
  particles.add(new Particle(
    mouseX, mouseY, mouseX - pmouseX, mouseY - pmouseY
  ));
}

void applyDissipativeForce(Particle p, float friction) {
  PVector f = PVector.mult(p.velocity, -friction);
  p.applyForce(f);
}

void applyAttractiveForce(Particle a, Particle b,
    float strength, float minDistance) {
  PVector dir = PVector.sub(a.getDisplacement(), b.getDisplacement());
  float d = dir.mag();
  
  if (d < minDistance) {
    d = minDistance;
  }
  
  dir.normalize(); 
  float force = (strength * centre.mass * centre.mass) / (d * d); 
  dir.mult(force);
  
  if (!b.getFixed()) {
    b.applyForce(dir);
  }
  
  if (!a.getFixed()) {
    dir.mult(-1f);
    a.applyForce(dir);
  }
}

void stop() {
  for (Particle p : particles) {
    p.close();
  }
  
  minim.stop();
  super.stop();
}


public class Particle {
  
  private PVector
    displacement,
    velocity,
    pvelocity,
    acceleration = new PVector(0, 0, 0);
  
  private float mass = 8;
  private boolean
    fixed  = false,
    toPlay = false;
  
  private AudioPlayer player = minim.loadFile("Sound_Effect.wav");
  
  public Particle(float x, float y, float vx, float vy) {
    this.displacement = new PVector(x, y);
    this.velocity = this.pvelocity = new PVector(vx, vy);
    player.mute();
    player.play();
    player.rewind();
  }
  
  public PVector getDisplacement() {
    return new PVector(displacement.x, displacement.y);
  }
  
  public boolean getFixed() {
    return fixed;
  }
  
  public void setFixed(boolean fixed) {
    this.fixed = fixed;
  }
 
  public void draw() {
    if (fixed) {
      fill(#1C9BFF); 
    } else {
      fill(#F56060);
    }
    ellipse(displacement.x, displacement.y, 3, 3); 
  }
  
  public void move() {
    if (!fixed) {
      float pmag = pvelocity.mag(),
            mag  =  velocity.mag();
      pvelocity = new PVector(velocity.x, velocity.y);
      velocity.add(acceleration);
      if (velocity.mag() < mag && mag > pmag) {
        toPlay = true;
      }
      displacement.add(velocity);
    }
  }
  
  public void play() {
    if (toPlay) {
      player.unmute();
      player.rewind();
      player.play();
      toPlay = false;
    }
  }
  
  public void applyForce(PVector force) {
    PVector value = PVector.div(force, mass);
    acceleration.set(PVector.div(force, mass));
  }
  
  public void close() {
    if (player != null) {
      player.close();
    }
  }
  
}


