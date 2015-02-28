
/*
  Andor Salga
 
 TODO:
 - fix init
 - clean code
 - make startPosition
 */

PImage pipe, cloud, ground;

ParticleSystem psys;
Timer timer;

final int NUM_PARTICLES = 50;

void setup() {
  size(400, 400);

  timer = new Timer();
  psys = new ParticleSystem();
  psys.setEmitRate(5.0f);

  pipe = loadImage("pipe.png");
  ground = loadImage("ground.png");
  cloud = loadImage("cloud.png");
}

void update() {
  timer.tick();
  float dt = timer.getDeltaSec();
  

  psys.setAcceleration(map(mouseX, 0, width, 4, -4), 9.8);
  
  psys.update(dt);

}

void draw() {
  update();

  background(72, 125, 251);
  image(cloud, 40, 40);

  pushStyle();
  tint(0, 255, 0);
  image(cloud, width-100, height - cloud.height - 16);
  popStyle();

  for (int i = 0; i < 13; i++) {
    image( ground, i * ground.width, height - ground.height);
  }

  psys.draw();
  image(pipe, width/2 - pipe.width/2, height - pipe.height - ground.height);
  psys.drawDying();
}

/**
 * 
 */
class ParticleSystem {

  ArrayList p;
  PImage fireball;
  PVector acceleration;
  int fireballIndex;
  float emitRate;

  class Particle {
    boolean isAlive;
    float age;
    float lifeTime;

    PVector position;
    PVector velocity;

    float rotation;
    float rotVel;

    int zOrder;

    Particle() {
      reset();
      position.x = width * 2;
    }

    float getAge() {
      return age;
    }
    float getLifeTime() {
      return lifeTime;
    }
    boolean getIsAlive() {
      return isAlive;
    }

    void setIsAlive(boolean b) {
      isAlive = b;
    }
    void setAge(float a) {
      age = a;
    }
    void setPosition(float x, float y) {
      position.x = x;
      position.y = y;
    }
    void setVelocity(float x, float y) {
      velocity.x = x;
      velocity.y = y;
    }
    void setLifeTime(float l) {
      lifeTime = l;
    }

    void reset() {
      position = new PVector(width/2, height-40, 0);
      velocity = new PVector(random(-1, 1), -10 + random(0, 0.5));

      rotation = 0.0f;
      rotVel = random(-TWO_PI * 2.0f, TWO_PI * 2.0f);

      age = 0.0f;
      setLifeTime(random(2, 7));
      isAlive = true;

      zOrder = 0;
    }

    void update(float dt) {
      age += dt;

      rotation += rotVel * dt;

      velocity.x += acceleration.x * dt;
      velocity.y += acceleration.y * dt;

      position.x += velocity.x * dt;
      position.y += velocity.y * dt;

      position.add(velocity);
    }

    void draw() {
      if (isAlive == false) {
        return;
      }

      pushMatrix();
      translate(position.x, position.y);
      rotate(rotation);

      image(fireball, -fireball.width/2, -fireball.height/2);
      popMatrix();
    }
  }

  ParticleSystem() {
    fireball = loadImage("fireball.png");
    fireballIndex = 0;
    acceleration = new PVector(0, 9.8);

    p = new ArrayList();

    for (int i = 0; i < NUM_PARTICLES; i++) {
      Particle particle = new Particle(); 
      p.add(particle);
      // resetParticle(i);
    }
  }

  void resetParticle(int i) {
    fireballIndex++;
    Particle particle = (Particle)p.get(i);

    particle.reset();
    particle.setPosition(width/2, height - 40);
  }

  void setEmitRate(float rate) {
    emitRate = rate;
  }
  
  void setAcceleration(float x, float y){
    acceleration.x = x;
    acceleration.y = y;
  }

  void update(float dt) {
    for (int i = 0; i < NUM_PARTICLES; i++) {
      Particle particle = (Particle)p.get(i);
      particle.update(dt);

      if (particle.getAge() > 0.5f) {
        particle.zOrder = 1;
      }

      if (particle.getAge() > particle.getLifeTime()) {
        resetParticle(i);
      }
    }
  }

  void draw() {
    for (int i = 0; i < NUM_PARTICLES; i++) {
      Particle particle = (Particle)p.get(i);
      if (particle.zOrder == 0) {
        particle.draw();
      }
    }
  }

  void drawDying() {
    for (int i = 0; i < NUM_PARTICLES; i++) {
      Particle particle = (Particle)p.get(i);
      if (particle.zOrder == 1) {
        particle.draw();
      }
    }
  }
}

/**
 * A timer class to manage animation timing.
 */
public class Timer {

  private int lastTime;
  private float deltaTime;
  private boolean isPaused;
  private float totalTime;
  private boolean countingUp;

  public Timer() {
    reset();
  }

  public void setDirection(int d) {
    countingUp = false;
  }

  public void reset() {
    deltaTime = 0f;
    lastTime = -1;
    isPaused = false;
    totalTime = 0f;
    countingUp = true;
  }

  //
  public void pause() {
    isPaused = true;
  }

  public void resume() {
    deltaTime = 0f;
    lastTime = -1;
    isPaused = false;
  }

  public void setTime(int min, int sec) {
    totalTime = min * 60 + sec;
  }

  /*
   * Format: 5.5 = 5 minutes 30 seconds
   */
  public void setTime(float minutes) {
    int int_min = (int)minutes;
    int sec = (int)((minutes - (float)int_min) * 60);
    setTime( int_min, sec);
  }

  public float getTotalTime() {
    return totalTime;
  }

  public float getDeltaSec() {
    if (isPaused) {
      return 0;
    }
    return deltaTime;
  }

  /*
   * Calculates how many seconds passed since the last call to this method.
   *
   */
  public void tick() {
    if (lastTime == -1) {
      lastTime = millis();
    }

    int delta = millis() - lastTime;
    lastTime = millis();
    deltaTime = delta/1000f;

    if (countingUp) {
      totalTime += deltaTime;
    }
    else {
      totalTime -= deltaTime;
    }
  }
}

