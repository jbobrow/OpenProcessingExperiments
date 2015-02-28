
void drawVector(DVector s, DVector e, color c) {
  DVector ar1 = e.copy();
  DVector ar2 = e.copy();
  ar1.rotate2D(60.0);
  ar2.rotate2D(-60.0);
  ar1.normalize();
  ar2.normalize();
  ar1.mult(10);
  ar2.mult(10);
  stroke(c);
  beginShape();
    vertex((float)s.x(), (float)s.y(), (float)s.z());
    vertex((float)(s.x()+e.x()), (float)(s.y()+e.y()), (float)(s.z()+e.z()));
  endShape();

  beginShape();
    vertex((float)(s.x()+e.x()), (float)(s.y()+e.y()), (float)(s.z()+e.z()));
    vertex((float)(s.x()+e.x()+ar1.x()), (float)(s.y()+e.y()+ar1.y()), (float)(s.z()+e.z()+ar1.z()));
  endShape();

  beginShape();
    vertex((float)(s.x()+e.x()), (float)(s.y()+e.y()), (float)(s.z()+e.z()));
    vertex((float)(s.x()+e.x()+ar2.x()), (float)(s.y()+e.y()+ar2.y()), (float)(s.z()+e.z()+ar2.z()));
  endShape();
  //line((float)s.x(), (float)s.y(), (float)(s.x() + e.x()), (float)(s.y()+e.y()));
  //line((float)(s.x() + e.x()), (float)(s.y() + e.y()), (float)(s.x() + e.x() + ar1.x()), (float)(s.y()+e.y() + ar1.y()));
  //line((float)(s.x() + e.x()), (float)(s.y() + e.y()), (float)(s.x() + e.x() + ar2.x()), (float)(s.y()+e.y() + ar2.y()));
}

