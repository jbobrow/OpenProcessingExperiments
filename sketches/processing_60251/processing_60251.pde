
class BoundingRectangle {
  PVector topleft;
  PVector bottomright;
  PVector topright;
  PVector bottomleft;
  PVector position; // centre of the rectangle

  BoundingRectangle(PVector pos, float w, float h) {
    this.position = pos;
    this.topleft = new PVector(position.x-w/2, position.y-h/2);
    this.bottomright = new PVector(position.x+w/2, position.y+h/2);
    this.topright = new PVector(position.x+w/2, position.y-h/2);
    this.bottomleft = new PVector(position.x-w/2, position.y+h/2);
  }
}


