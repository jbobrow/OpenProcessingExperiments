
class Drone {
  
  // Speed limits
  static final float MIN_SPEED = 50;
  static final float MAX_SPEED = 200;
  
  // Acceleration and turning speed maximums
  static final float MAX_ACCEL = 20;
  static final float MAX_TURN = PI;
  
  // Ranges used to determine behaviour mode
  static final float OUTER_RANGE = 500;
  static final float INNER_RANGE = 20;

  // Enumerated behaviour modes
  static final int MODE_ATTACK = 0;
  static final int MODE_EVADE = 1;

  float x, y;   // position (in pixel coordinates)
  float theta;  // direction
  float speed;
  int mode;
  
  Drone(float x, float y, float theta) {
    this.x = x;
    this.y = y;
    this.theta = theta;
    this.speed = MIN_SPEED;
    this.mode = MODE_ATTACK;
  }
  
  void update(float dt) {

    // Modify mode based on distance from cursor
    float s = dist(x, y, mouseX, mouseY);
    switch (mode) {
    case MODE_ATTACK:
      if (random(s) < random(INNER_RANGE))
        mode = MODE_EVADE;
      break;
    case MODE_EVADE:
      if (random(s) > random(OUTER_RANGE))
        mode = MODE_ATTACK;
      break;
    default:
      return;
    }
    
    // Calculate accel and turn based on cursor position
    float phi = atan2(mouseY - y, mouseX - x) - theta;
    float accel, turn;
    switch (mode) {
    case MODE_ATTACK:
      accel = cos(phi) * MAX_ACCEL;
      turn = sin(phi) * MAX_TURN;
      break;
    case MODE_EVADE:
      accel = sin(phi) * MAX_ACCEL;
      turn = cos(phi) * MAX_TURN;
      break;
    default:
      return;
    }
    
    // Recalculate speed, keeping it between the predefined limits
    float k;
    if (accel > 0)
      k = (MAX_SPEED - speed) / (MAX_SPEED - MIN_SPEED);
    else
      k = (speed - MIN_SPEED) / (MAX_SPEED - MIN_SPEED);
    speed += k * accel;
    
    // Update direction
    theta = (theta + turn * dt) % TWO_PI;
    
    // Update position
    x += speed * dt * cos(theta);
    y += speed * dt * sin(theta);
  }
}

