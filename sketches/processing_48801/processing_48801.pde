
class Integrator {

   float DAMPING = 0.5;
   float ATTRACTION = 0.2;

  float value;
  float vel;
  float accel;
  float force;
  float mass = 1;

  float damping = DAMPING;
  float attraction = ATTRACTION;
  boolean targeting;
  float target;
  float prev = MAX_FLOAT;
  float epsilon = 0.0001;

  Integrator() { }

  Integrator(float value) {
    this.value = value;
  }

  Integrator(float value, float damping, float attraction) {
    this.value = value;
    this.damping = damping;
    this.attraction = attraction;
  }

  void set(float v) {
    value = v;
  }

  boolean update() {
    if (targeting) {
      force += attraction * (target - value); 
    }

    accel = force / mass;
    vel = (vel + accel) * damping;
    value += vel;

    force = 0;
    
    if (abs(value - prev) < epsilon) {
      value = target;
      return false;
    }
    prev = value;
    return true;
  }

  void target1(float t) {
    targeting = true;
    target = t;
  }

  void noTarget() {
    targeting = false;
  }
}

