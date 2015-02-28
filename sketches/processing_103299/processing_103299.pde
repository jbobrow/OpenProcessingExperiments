
boolean collision(Polygone shape1,Polygone shape2) {
  if(shape1.AABBxmin>shape2.AABBxmax ||
     shape1.AABBxmax<shape2.AABBxmin ||
     shape1.AABBymin>shape2.AABBymax ||
     shape1.AABBymax<shape2.AABBymin) {
    return false;
  }
  int axisid = -1;
  int shapeid = -1;
  float overlap = 100000000;
  PVector smallest = null;
  float shape1minimum;
  float shape1maximum;
  float shape2minimum;
  float shape2maximum;
  for (int i = 0; i < shape1.normales.size(); i++) {
    PVector normalei = (PVector) shape1.normales.get(i);
    Sommet sommet01 = (Sommet) shape1.sommets.get(0);
    shape1minimum = normalei.dot(sommet01.pos);
    shape1maximum = shape1minimum;
    for (int j = 1; j < shape1.sommets.size(); j++) {
      Sommet sommetj = (Sommet) shape1.sommets.get(j);
      float p = normalei.dot(sommetj.pos);
      if (p < shape1minimum) {
        shape1minimum = p;
      } else if (p > shape1maximum) {
        shape1maximum = p;
      }
    }
    Sommet sommet02 = (Sommet) shape2.sommets.get(0);
    shape2minimum = normalei.dot(sommet02.pos);
    shape2maximum = shape2minimum;
    for (int j = 1; j < shape2.sommets.size(); j++) {
      Sommet sommetj = (Sommet) shape2.sommets.get(j);
      float p = normalei.dot(sommetj.pos);
      if (p < shape2minimum) {
        shape2minimum = p;
      } else if (p > shape2maximum) {
        shape2maximum = p;
      }
    }
    if (!(shape1minimum<shape2maximum && shape1maximum>shape2minimum)) {
      return false;
    } else {
      float o = 100000000;
      if(shape1minimum>shape2minimum && shape1maximum<shape2maximum) {
        float a=shape1minimum-shape2minimum;
        float b=shape2maximum-shape1maximum;
        if(a<b) {
          o=(shape1maximum-shape2minimum);
        } else {
          o=(shape2maximum-shape1minimum);
        }
      } else if(shape1minimum>shape2minimum && shape1maximum<shape2maximum) {
        float a=shape2minimum-shape1minimum;
        float b=shape1maximum-shape2maximum;
        if(a<b) {
          o=(shape2maximum-shape1minimum);
        } else {
          o=(shape1maximum-shape2minimum);
        }
      } else if(shape1minimum>shape2minimum && shape1maximum>shape2maximum) {
        o=(shape2maximum-shape1minimum);
      } else if(shape1minimum<shape2minimum && shape1maximum<shape2maximum) {
        o=(shape1maximum-shape2minimum);
      }
      if (o < overlap) {
        overlap = o;
        smallest = normalei;
        axisid = i;
        shapeid = 1;
      }
    }
  }
  for (int i = 0; i < shape2.normales.size(); i++) {
    PVector normalei = (PVector) shape2.normales.get(i);
    Sommet sommet01 = (Sommet) shape1.sommets.get(0);
    shape1minimum = normalei.dot(sommet01.pos);
    shape1maximum = shape1minimum;
    for (int j = 1; j < shape1.sommets.size(); j++) {
      Sommet sommetj = (Sommet) shape1.sommets.get(j);
      float p = normalei.dot(sommetj.pos);
      if (p < shape1minimum) {
        shape1minimum = p;
      } else if (p > shape1maximum) {
        shape1maximum = p;
      }
    }
    Sommet sommet02 = (Sommet) shape2.sommets.get(0);
    shape2minimum = normalei.dot(sommet02.pos);
    shape2maximum = shape2minimum;
    for (int j = 1; j < shape2.sommets.size(); j++) {
      Sommet sommetj = (Sommet) shape2.sommets.get(j);
      float p = normalei.dot(sommetj.pos);
      if (p < shape2minimum) {
        shape2minimum = p;
      } else if (p > shape2maximum) {
        shape2maximum = p;
      }
    }
    if (!(shape1minimum<shape2maximum && shape1maximum>shape2minimum)) {
      return false;
    } else {
      float o = 100000000;
      if(shape1minimum>shape2minimum && shape1maximum<shape2maximum) {
        float a=shape1minimum-shape2minimum;
        float b=shape2maximum-shape1maximum;
        if(a<b) {
          o=(shape1maximum-shape2minimum);
        } else {
          o=(shape2maximum-shape1minimum);
        }
      } else if(shape1minimum>shape2minimum && shape1maximum<shape2maximum) {
        float a=shape2minimum-shape1minimum;
        float b=shape1maximum-shape2maximum;
        if(a<b) {
          o=(shape2maximum-shape1minimum);
        } else {
          o=(shape1maximum-shape2minimum);
        }
      } else if(shape1minimum>shape2minimum && shape1maximum>shape2maximum) {
        o=(shape2maximum-shape1minimum);
      } else if(shape1minimum<shape2minimum && shape1maximum<shape2maximum) {
        o=(shape1maximum-shape2minimum);
      }
      if (o < overlap) {
        overlap = o;
        smallest = normalei;
        axisid = i;
        shapeid = 2;
      }
    }
  }
  if(shapeid==2) {
    Sommet sommeti = (Sommet) shape2.sommets.get(axisid);
    Sommet sommetj = (Sommet) shape2.sommets.get((axisid+1)%shape2.sommets.size());
    PVector normalei = (PVector) shape2.normales.get(axisid);
    PVector force2 = PVector.mult(normalei,-(overlap/2)-(espacement/2));
    sommeti.addForce(force2);
    sommetj.addForce(force2);
    float axe = normalei.dot(sommeti.pos);
    for(int k=0; k<shape1.sommets.size(); k++){
      Sommet sommetk = (Sommet) shape1.sommets.get(k);
      float kproj = normalei.dot(sommetk.pos);
      if(kproj < (axe-(overlap/2))) {
        PVector force1 = PVector.mult(normalei,(overlap/2)+(espacement/2));
        sommetk.addForce(force1);
      }
    }
  } else if(shapeid==1) {
    Sommet sommeti = (Sommet) shape1.sommets.get(axisid);
    Sommet sommetj = (Sommet) shape1.sommets.get((axisid+1)%shape1.sommets.size());
    PVector normalei = (PVector) shape1.normales.get(axisid);
    PVector force1 = PVector.mult(normalei,-(overlap/2)-(espacement/2));
    sommeti.addForce(force1);
    sommetj.addForce(force1);
    float axe = normalei.dot(sommeti.pos);
    for(int k=0; k<shape2.sommets.size(); k++){
      Sommet sommetk = (Sommet) shape2.sommets.get(k);
      float kproj = normalei.dot(sommetk.pos);
      if(kproj < (axe-(overlap/2))) {
        PVector force2 = PVector.mult(normalei,(overlap/2)+(espacement/2));
        sommetk.addForce(force2);
      }
    }
  }
  return true;
}

