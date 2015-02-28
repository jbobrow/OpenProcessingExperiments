


class Actor extends GameObject {

  PVector location;
  PVector rot;
  PVector velocity;
  PVector acceleration;
  float contactRadius = 10;
  PVector bounds;
  float maxVelocity = 100;
  
  PVector w11;
  PVector w21;
  PVector w12;
  PVector w22;
  
  public void place(PVector location) {
    
    if (null == this.location) 
      this.location = new PVector();
      
    this.location.x = location.x;
    this.location.y = location.y;
    this.location.z = location.z;
    this.rot = new PVector(0, 0, 0);
    this.velocity = new PVector(0, 0, 0);
    this.acceleration = new PVector(0, 0, 0);

    if (null != bounds) {
      float dx = bounds.x / 2;
      float dz = bounds.y / 2;
      
      w11 = new PVector(location.x - dx, location.y, location.z - dz);
      w12 = new PVector(location.x - dx, location.y, location.z + dz);
      w21 = new PVector(location.x + dx, location.y, location.z - dz);
      w22 = new PVector(location.x + dx, location.y, location.z + dz);
    }   
  }
  
  public float getVolume() {
    if (null == bounds) return 0;
    return bounds.x * bounds.y * bounds.z;
  }

  public void draw() {

    if (null != bounds && showBounds) {
       noFill();
       pushMatrix();
       stroke(color(0, 0, 255));//RB
       translate(w11.x, w11.y, w11.z);
       box(bounds.x / 4f, bounds.x / 4f, bounds.x / 4f);
       popMatrix();  
       pushMatrix();
       stroke(color(0, 255, 0));//LB
       translate(w12.x, w12.y, w12.z);
       box(bounds.x / 4f, bounds.x / 4f, bounds.x / 4f);
       popMatrix();  
       pushMatrix();
       stroke(color(0, 255, 255));//RF
       translate(w21.x, w21.y, w21.z);
       box(bounds.x / 4f, bounds.x / 4f, bounds.x / 4f);
       popMatrix();  
       pushMatrix();
       stroke(color(0, 0, 0));//LF
       translate(w22.x, w22.y, w22.z);
       box(bounds.x / 4f, bounds.x / 4f, bounds.x / 4f);
       popMatrix();  
    }

    pushMatrix();
    translate(location.x, location.y, location.z);
    
    rotateY(-rot.y);
    rotateZ(-rot.z);
    rotateX(-rot.x);
    if (showContactRadius) {
      stroke(color(0, 255, 0));
      sphere(contactRadius);       
    }
    if (null != bounds && showBounds) {
      pushMatrix();
      stroke(color(255, 0, 0));
      noFill();
      translate(0, bounds.y / 2, 0);
      box(bounds.x, bounds.y, bounds.z);
      popMatrix();
    }
    
    drawImpl();

    popMatrix();
  }
  
  protected void drawImpl() {}
  
  public void update(float deltaTime) {
    
    boolean moving = (velocity.mag() > 0);
    // Velocity changes according to cceleration
    if (moving) {
      if (velocity.mag() < 10) {
        velocity.mult(0);  
      } else {
        velocity.mult(constrain(1.0 - 1.0 * deltaTime, 0, 0.90));
      }
    }
    
    if (acceleration.mag() > 0) {
      velocity.x += acceleration.x * deltaTime;
      velocity.z += acceleration.z * deltaTime;
    }

    // Block limit
    velocity.limit(maxVelocity);
    
    // Location changes by velocity
    location.x += velocity.x * deltaTime;
    location.z += velocity.z * deltaTime;

    if (null == bounds) {
      
      location.y = moon.getAltitudeAt(location.x, location.z);
      
    } else {
      
      float my = moon.getAltitudeAt(location.x, location.z);
      
      float cosd = cos(rot.y);
      float sind = sin(rot.y);
      float dx11 = (bounds.x * cosd - bounds.z * sind) / 2.0;
      float dz11 = (bounds.z * cosd + bounds.x * sind) / 2.0;
      float q11 = moon.getAltitudeAt(location.x - dx11, location.z - dz11);
      float dx12 = (bounds.z * cosd + bounds.x * sind) / 2.0;
      float dz12 = (bounds.z * cosd - bounds.x * sind)  / 2.0;
      float q12 = moon.getAltitudeAt(location.x - dx12, location.z + dz12);
      float q21 = moon.getAltitudeAt(location.x + dx12, location.z - dz12);
      float q22 = moon.getAltitudeAt(location.x + dx11, location.z + dz11);
      
      w11.set(location.x - dx11, q11, location.z - dz11);
      w12.set(location.x - dx12, q12, location.z + dz12);
      w21.set(location.x + dx12, q21, location.z - dz12);
      w22.set(location.x + dx11, q22, location.z + dz11);
      
      float ay = (q11 + q12 + q21 + q22) / 4f;
      float fz1 = constrain((q12 + q22) / 2f - (q11 + q21) / 2f, -bounds.z, bounds.z);
      float fx1 = constrain((q11 + q12) / 2f - (q21 + q22) / 2f, -bounds.x, bounds.x);
      
      location.y = max(my, ay);
      rot.x = asin(fz1 / bounds.z);
      rot.z = asin(fx1 / bounds.x);
      
    }
    
    // We must clear acceleration each frame
    acceleration.x = 0;
    acceleration.z = 0;
    
 }
 
 public boolean isInContactRadius(Actor a) {
   float distance = a.location.dist(location);
   float contactDistance = max(a.contactRadius, contactRadius);
   return distance < contactDistance;  
 }
 
 public void collide(Actor a) {}
  
}

