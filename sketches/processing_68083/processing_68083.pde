
class Background extends Entity {
  Background() {
    pos = center;
    size = new PVector(width, height);
    drawLayer = layer.background;
    groups = new group[]{ group.background };
  }
  
  void draw() {
    fill(21);
    rect(center.x, center.y, width, height);
  }
}

