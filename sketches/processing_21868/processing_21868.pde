
class Arrows {
  int spacing;
  
  Arrows(int s) {
    spacing = s;
  }
  
  void render() {
    stroke(100);
    // render arrows in the direction of the force
    for(int i=1; i<width/spacing; i++) {
      for(int j=1; j<height/spacing; j++) {
        PVector f = wind.getForce(spacing*i,spacing*j,time);
        line(spacing*i,spacing*j,spacing*i+100*f.x,spacing*j+100*f.y);
      }
    }
  }
}

