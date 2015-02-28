

////////////////////////////////////////////////

class Trace {

  ArrayList points;
  boolean writing = false;

  Trace() {
    points = new ArrayList();
  }

  void start() {
    writing = true;
  }

  void stop() {
    writing = false;
  }

  void drawShape() {

    if (writing) {
      points.add(new PVector(
      (x.x*X+y.x*Y), 
      (x.y*X+y.y*Y), 
      (x.z*X+y.z*Y)
        ));
    }

    stroke(255, 120);

    //beginShape();
    for (int i = 1 ; i < points.size();i++) {
      PVector tmp1 = (PVector)points.get(i-1);
      PVector tmp2 = (PVector)points.get(i);
      float dis = dist(tmp1.x, tmp1.y, tmp1.z, helperPoint.x, helperPoint.y, helperPoint.z)/R;

      pushStyle();
      stroke(lerpColor(#ffffff, #ffcc00, constrain(dis, 0.0, 1.0)), constrain(100-dis*70,0,255));
      strokeWeight(7.0-dis*6.5);
      //vertex(tmp.x, tmp.y, tmp.z);
      line(tmp1.x, tmp1.y, tmp1.z,tmp2.x, tmp2.y, tmp2.z);
      popStyle();
      
    }
    //endShape();
  }
}

////////////////////////////////////////////////


