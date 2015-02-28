
// There are some round objects in space

class Particle {

  Particle(PVector position, float objectRadius) {
    idNumber = particleCount;
    particleCount++;

    this.objectRadius = objectRadius;
    this.position = position;
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    drag = .98;
    birth = currentTime;
    myHue = random(1);
    lifespan = 3.5 + random(8);
  }

  float getAngle() {
    return atan2(velocity.y, velocity.x) + PI/2;
  }

  void update(float ellapsedTime) {
    float wanderStrength = 10;
    float theta = 20*noise(.01*position.x, .01*position.y, .1*currentTime + idNumber*.2);
    float r = 1;
    acceleration.x = wanderStrength*(r*cos(theta));
    acceleration.y = wanderStrength*(r*sin(theta));

    PVector offset = new PVector(position.x, position.y);
    offset.normalize();
    float d = sqrt(position.x*position.x + position.y*position.y);
    d = constrain(d - 160, 0, 300);
    float gravityPull = -pow(.03*d, 2);

    acceleration.x += offset.x*gravityPull;
    acceleration.y += offset.y*gravityPull;

    addMultipleTo(velocity, ellapsedTime, acceleration);

    lifespanPct = constrain((currentTime - birth)/lifespan, 0, 1);

    velocity.x *= drag;
    velocity.y *= drag;

    float currentSpeed = velocity.mag();
    float speedMult = speed/currentSpeed;
    if (lifespanPct > .85)
      speed *= .8;

    velocity.x *= speedMult;
    velocity.y *= speedMult;

    addMultipleTo(position, ellapsedTime, velocity);
  }

  void draw(PGraphics render) {
    float speed = 10/objectRadius;
    // draw an ellipse
     float deathLength = .8/lifespan;
      float deathPct = constrain(lifespanPct - (1 - deathLength), 0, 1)/deathLength;
      float jumpHeight = 20*deathPct + 3*objectRadius;
      float jumpCycle = (sin(speed*12*currentTime+ idNumber));
    
      float sizeScale = 1*deathPct + 1; 
   
   
    render.pushMatrix();
    if (draw3D) {
      
      render.translate(position.x + random(10*deathPct), position.y, max(0, jumpHeight*abs(jumpCycle) - 10) + getHeight(position.x + width/2, position.y + height/2));
 
  render.fill(myHue, deathPct, 1 - random(deathPct));
render.rotateZ(getAngle());
render.rotateY(.2*jumpCycle);
      render.box(objectRadius*sizeScale*1.5, objectRadius*sizeScale, objectRadius*2*sizeScale);
    }
    else
      render.ellipse(position.x, position.y, objectRadius, objectRadius);
    render.popMatrix();
  }

  void drawTrail(PGraphics trailBuffer) {
      float speed = 10/objectRadius;
  if (frameCount%(ceil(12/speed)) == 0) {
      step++;

      // draw an ellipse
      trailBuffer.noStroke();
      trailBuffer.pushMatrix();
      trailBuffer.translate(position.x, position.y);
      float footW = objectRadius*.4;
      if (step%2 == 0)
        footW *= -1;

      float footSize = objectRadius*.6;
      trailBuffer.rotate(getAngle());
      trailBuffer.fill(.4);
      trailBuffer.ellipse(footW + footSize*.1, .1*footSize, footSize, footSize*2);
      trailBuffer.fill(.6);
      trailBuffer.ellipse(footW, 0, footSize, footSize*2);
      trailBuffer.popMatrix();
    }

    if (lifespanPct > .99 && !dead) {
      trailBuffer.pushMatrix();
      trailBuffer.translate(position.x, position.y);
      println("pop!");
      for (int i = 0; i < 30; i++) {
        float r = random(1);
        float splatSize = 2*objectRadius*pow(r, .3);
        trailBuffer.fill((myHue + random(.1))%1, random(.8, 1), 1);
        trailBuffer.pushMatrix();
        trailBuffer.rotate(i*.3);
        
        trailBuffer.ellipse(0, 10*objectRadius*pow(1 - pow(r, .4), 1), splatSize, splatSize*(1.5 + .8*r));
        trailBuffer.popMatrix();
      }
      dead = true;
      trailBuffer.popMatrix();
    }
  }


  float getDistanceTo(Particle ro) {
    return dist(position.x, position.y, ro.position.x, ro.position.y);
  }


  float getDistanceToEdge(Particle ro) {
    return dist(position.x, position.y, ro.position.x, ro.position.y) - (objectRadius + ro.objectRadius);
  }

  float birth;
  float lifespan;

  float drag;
  PVector position; 
  PVector velocity;
  PVector acceleration;
  float speed = 10 + random(5);

  float objectRadius;
  float lifespanPct;
  boolean dead;
  int idNumber;
  int step;
  float myHue;
}

void addMultipleTo(PVector v0, float m, PVector v1) {
  v0.x += m*v1.x;
  v0.y += m*v1.y;
}


void addPolarTo(PVector v0, float r, float theta) {
  v0.x += r*cos(theta);
  v0.y += r*sin(theta);
}



int particleCount = 0;


