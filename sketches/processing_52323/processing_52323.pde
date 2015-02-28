
class AxisLine {

  // used in the Scatterplot view to show directional arrows

  float x;
  float y;
  float bright;
  //float x2;
  //float y2;

  AxisLine(float x_, float y_, float bright_) { //, float x2_, float y2_) {
    x = x_;
    y = y_;
    bright = bright_;
    // y1 = y1_;
    //y2 = y2_;
  }

  void displayLine1() {
    noFill();
    strokeWeight(1);
    stroke(55, bright, 80);

    beginShape();
    vertex(x, y);
    vertex(x + 800, y);
    vertex(x + 800, y - 5);
    vertex(x + 805, y);
    vertex(x + 800, y + 5);
    vertex(x + 800, y);
    endShape();
  }

  void displayLine2() {
    noFill();
    strokeWeight(1);
    stroke(55, bright, 80);

    beginShape();
    vertex(x, y);
    vertex(x, y - 500);
    vertex(x -5, y - 500);
    vertex(x, y - 505);
    vertex(x + 5, y - 500);
    vertex(x, y - 500);
    endShape();
  }
}


