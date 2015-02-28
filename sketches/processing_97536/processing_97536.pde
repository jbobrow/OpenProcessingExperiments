
RelaxedFluffy relaxed;
AscendingFluffy rotating;
RunningFluffy running;
PulsingFluffy f1;

void setup() {
  size(650, 300);
  relaxed = new RelaxedFluffy(100, 100, 30);
  rotating = new AscendingFluffy(250, 100, 30);
  running = new RunningFluffy(400, 100, 30);
  f1 = new PulsingFluffy(550, 100, 30);
}

void draw() {
  background(255);
  rect(0, 0, width, height);
  relaxed.draw();
  rotating.draw();
  running.draw();
  f1.draw();
}

abstract class Fluffy {
  int x;
  int y;
  int points;
  Fluffy(int x, int y, int points) {
    this.x = x;
    this.y = y;
    this.points = points;
  }
  abstract void draw();
}

class Point2D {
  float x;
  float y;
  Point2D(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

abstract class CurveVertexFluffy extends Fluffy {
  CurveVertexFluffy(int x, int y, int points) {
    super(x, y, points);
  }
  void draw() {
    beginShape();
    for(int i=0; i < this.points+3; i++) {
      Point2D v = this.getNoisyPoint(i);
      curveVertex(v.x, v.y);
      pushStyle();
        stroke(255, 0, 0);
        ellipse(v.x, v.y, 3, 3);
      popStyle();
    }
    endShape();
  }
  abstract Point2D getNoisyPoint(int i);
}

class RelaxedFluffy extends CurveVertexFluffy {
  RelaxedFluffy(int x, int y, int points) {
    super(x, y, points);
  }
  Point2D getNoisyPoint(int i) {
    float x = 100*(noise(frameCount*0.005, (i+this.x)%this.points))*cos(2*PI*i/this.points)+this.x;
    float y = 100*(noise(frameCount*0.005, (i+this.y)%this.points))*sin(2*PI*i/this.points)+this.y;
    return new Point2D(x, y);
  }
}

class AscendingFluffy extends CurveVertexFluffy {
  AscendingFluffy(int x, int y, int points) {
    super(x, y, points);
  }
  Point2D getNoisyPoint(int i) {
    float x = 100*(noise(frameCount*0.005, (i+this.x+frameCount)%this.points))*cos(2*PI*i/this.points)+this.x;
    float y = 100*(noise(frameCount*0.005, (i+this.y)%this.points))*sin(2*PI*i/this.points)+this.y;
    return new Point2D(x, y);
  }
}

class RunningFluffy extends CurveVertexFluffy {
  RunningFluffy(int x, int y, int points) {
    super(x, y, points);
  }
  Point2D getNoisyPoint(int i) {
    float x = 100*(noise(frameCount*0.005, (i+this.x)%this.points))*cos(2*PI*i/this.points)+this.x;
    float y = 100*(noise(frameCount*0.005, (i+this.y+frameCount)%this.points))*sin(2*PI*i/this.points)+this.y;
    return new Point2D(x, y);
  }
}

class PulsingFluffy extends CurveVertexFluffy {
  PulsingFluffy(int x, int y, int points) {
    super(x, y, points);
  }
  Point2D getNoisyPoint(int i) {
    float x = 100*(noise(frameCount*0.005, frameCount*0.008))*cos(2*PI*i/this.points)+this.x;
    float y = 100*(noise(frameCount*0.005, frameCount*0.008))*sin(2*PI*i/this.points)+this.y;
    return new Point2D(x, y);
  }
}


