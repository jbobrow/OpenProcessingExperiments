
class Orient {
  PVector ui;
  PVector uj;
  PVector uk;
  Orient() {
    ui = new PVector(1, 0, 0);
    uj = new PVector(0, 1, 0);
    uk = new PVector(0, 0, 1);
  }
  void spin(PVector phi) {
    ui = handleturn(ui, phi);
    uj = handleturn(uj, phi);
    uk = handleturn(uk, phi);
  }
  void restore() {
    uk = ui.cross(uj);
    uj = uk.cross(ui);
    ui.normalize();
    uj.normalize();
    uk.normalize();
  }
  PVector toOri(PVector w){
    PVector o = new PVector();
    o.x = w.dot(ui);
    o.y = w.dot(uj);
    o.z = w.dot(uk);
    return o;
  }
  PVector toWorld(PVector o){
    PVector w = new PVector();
    w.x = ui.x * o.x + uj.x * o.y + uk.x * o.z;
    w.y = ui.y * o.x + uj.y * o.y + uk.y * o.z;
    w.z = ui.z * o.x + uj.z * o.y + uk.z * o.z;
    return w;
  }
}
PVector handleturn(PVector r, PVector w) {
  PVector handled = r;
  if ((w.mag() != 0) && (r.mag() != 0)) {
    PVector r2 = new PVector();
    r2.x = r.x;
    r2.y = r.y;
    r2.z = r.z;
    PVector w2 = new PVector();
    w2.x = w.x;
    w2.y = w.y;
    w2.z = w.z;
    r2.normalize();
    w2.normalize();
    if (r2.dot(w2) != 1) {
      handled = turn(r, w);
    }
  }
  return handled;
}
PVector turn(PVector r, PVector w) {
  float dw = PI/8;
  int divisions;
  if (w.mag() > dw) {
    divisions = ceil(w.mag() / dw);
  } else {
    divisions = 1;
  }
  PVector uw = new PVector();
  uw.x = w.x;
  uw.y = w.y;
  uw.z = w.z;
  uw.normalize();
  PVector along = PVector.mult(uw, uw.dot(r));
  PVector rprime = PVector.sub(r, along);
  PVector phi = PVector.div(w, divisions);
  for (int i=1; i<=divisions; i++) {
    rprime = dturn(rprime, phi);
  }
  return PVector.add(rprime, along);
}
PVector dturn(PVector rprime, PVector phi) {
  PVector o2 = PVector.div(phi, 2);
  PVector a = PVector.add(rprime, o2.cross(rprime));
  PVector ua = a;
  ua.normalize();
  PVector b = PVector.mult(PVector.sub(rprime,
                        PVector.mult(ua, ua.dot(rprime))), -1);
  return PVector.add(rprime, PVector.mult(b, 2));
}

