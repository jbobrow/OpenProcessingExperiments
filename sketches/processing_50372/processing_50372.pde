
/* Calculate whether the angle is between 'start' and 'end'.
Starting from 'start', proceed anticlockwise.  Return true if the
angle is encountered before 'end' is reached. */
boolean angle_between(float angle, float start, float end) {
  float angle_offset = (angle - start) % TWO_PI;
  float end_offset = (end - start) % TWO_PI;
  
  if (angle_offset < 0)
    angle_offset += TWO_PI;

  if (end_offset < 0)
    end_offset += TWO_PI;

  return angle_offset < end_offset;
}

class Obstacle {
  int x, y, r;
  float shadow_s;                 // distance to start of shadow
  float shadow_phi0, shadow_phi1; // start and end angles of shadow

  public Obstacle(int x, int y, int r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }

  // Update shadow geometry.
  // (x, y) is the new location of the light source.
  void shadow_update() {
    shadow_s = sqrt(sq(this.x - light_x) + sq(this.y - light_y) - sq(this.r));
    float phi = atan2(this.y - light_y, this.x - light_x);
    float dphi = asin(this.r / dist(light_x, light_y, this.x, this.y));
    shadow_phi0 = phi - dphi;
    shadow_phi1 = phi + dphi;
  }

  // Returns true if the obstacle covers point (x, y).
  boolean hit(int x, int y) {
    return dist(x, y, this.x, this.y) <= this.r;
  }

  // Returns true if the obstacle shadows point (x, y).
  boolean shadows(int x, int y) {
    if (dist(x, y, light_x, light_y) >= shadow_s) {
      float phi = atan2(y - light_y, x - light_x);
      return angle_between(phi, shadow_phi0, shadow_phi1);
    }
    return false;
  }
}


