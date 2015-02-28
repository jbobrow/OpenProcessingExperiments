
List<Particle> attackParticles = new ArrayList<Particle>();

void setup() {
  size(600, 600);
  smooth();
  frameRate(30);
}

void draw() {
  colorMode(RGB);
  background(5, 5);
  
  //draw the particle system for the cut
  strokeWeight(1.0);
  stroke(255, 255, 255);
  Iterator itr = attackParticles.iterator();
  while(itr.hasNext()) {
      Particle p = (Particle)itr.next();
      p.run();
      if(p.getY() > height) {
        itr.remove();
      }
    }
}

void mouseDragged() {
  stroke(225, 225, 225);
  strokeWeight(3.0);
  strokeJoin(ROUND);
  line(pmouseX, pmouseY, mouseX, mouseY);
  float dx = pmouseX - mouseX; //pmouseX > mouseX :: LEFT
  attackParticles.add(new Particle(random(mouseX-5, mouseX+5), random(mouseY-5, mouseY+5), dx));
  attackParticles.add(new Particle(random(mouseX-5, mouseX+5), random(mouseY-5, mouseY+5), dx));
  attackParticles.add(new Particle(random(mouseX-5, mouseX+5), random(mouseY-5, mouseY+5), dx));
    
    
}

class Particle {
  private float startx, starty, x, y;
  private float direction;
  private float xSpeed = 5, ySpeed = 2;
  private long startTime;
  
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
    //move in X
    this.x += (this.direction > 0 ? -xSpeed : xSpeed);
    //decrease X accel
    this.xSpeed = (this.xSpeed >= 1 ? this.xSpeed - 0.2 : this.xSpeed);
    //gravity
    this.y += ySpeed;
    if(System.currentTimeMillis() - startTime > 30) {
      ySpeed += 0.3;
    }
  }
  
  public void drawParticle() {
    ellipse(x, y, 1, 1);
  }
}

