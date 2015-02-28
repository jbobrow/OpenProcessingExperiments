
/**
 * ArcBall is all about smooth rotation of object for fun 
 * I should create two cubes each with a separate ArcBall....
 * http://wiki.processing.org/w/Arcball
 */

class ArcBall {
  float center_x, center_y, radius;
  PVector v_down, v_drag;
  Quat q_now, q_down, q_drag;
  PVector[] axisSet;
  int axis;

  ArcBall(float center_x, float center_y, float radius) {
    this.center_x = center_x;
    this.center_y = center_y;
    this.radius = radius;

    this.v_down = new PVector();
    this.v_drag = new PVector();

    this.q_now = new Quat();
    this.q_down = new Quat();
    this.q_drag = new Quat();

    this.axisSet = new PVector[] {
      new PVector(1.0, 0.0, 0.0), 
      new PVector(0.0, 1.0, 0.0), 
      new PVector(0.0, 0.0, 1.0)
      };
      axis = -1;  // no constraints...
  }

  void mousePressed() {
    v_down = mouseToSphere(mouseX, mouseY);
    q_down.copy(q_now);
    q_drag.reset();
  }

  void mouseDragged() {
    v_drag = mouseToSphere(mouseX, mouseY);
    q_drag.set(PVector.dot(v_down, v_drag), v_down.cross(v_drag));
  }

  void update() {
    q_now = Quat.mult(q_drag, q_down);
    applyQuat2Matrix(q_now);
  }

  PVector mouseToSphere(float x, float y) {
    PVector v = new PVector();
    v.x = (x - center_x) / radius;
    v.y = (y - center_y) / radius;

    float mag = v.x * v.x + v.y * v.y;
    if (mag > 1.0f) {
      v.normalize();
    }
    else {
      v.z = sqrt(1.0 - mag);
    }
    return (axis == -1) ? v : constrainVector(v, axisSet[axis]);
  }

  PVector constrainVector(PVector vector, PVector axis) {
    PVector res = PVector.sub(vector, PVector.mult(axis, PVector.dot(axis, vector)));
    res.normalize();
    return res;
  }

  void applyQuat2Matrix(Quat q) {
    // instead of transforming q into a matrix and applying it...
    float[] aa = q.getValue();
    rotate(aa[0], aa[1], aa[2], aa[3]);
  }
}


