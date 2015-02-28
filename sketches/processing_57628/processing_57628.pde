
void intersect() {
  for (int i=0; i<sommets.size(); i++) {
    PVector sommetia = (PVector) sommets.get(i);
    PVector sommetib = (PVector) sommets.get((i+1)%sommets.size());
    for (int j=i+2; j<sommets.size(); j++) {
      if(i==0 && j==sommets.size()-1){break;}
      PVector sommetja = (PVector) sommets.get(j);
      PVector sommetjb = (PVector) sommets.get((j+1)%sommets.size());
      PVector intersect = segIntersection(sommetia.x,sommetia.y,sommetib.x,sommetib.y,sommetja.x,sommetja.y,sommetjb.x,sommetjb.y);
      if (intersect != null) {
        ellipse(intersect.x,intersect.y,5+random(-3,10),5+random(-3,10));
        if((j-((i+1)%sommets.size())+1) < (sommets.size()/2)) {
          float ibxTemp = sommetib.x;
          float ibyTemp = sommetib.y;
          sommetib.x = sommetja.x;
          sommetib.y = sommetja.y;
          sommetja.x = ibxTemp;
          sommetja.y = ibyTemp;
        } else {
         float iaxTemp = sommetia.x;
          float iayTemp = sommetia.y;
          sommetia.x = sommetjb.x;
          sommetia.y = sommetjb.y;
          sommetjb.x = iaxTemp;
          sommetjb.y = iayTemp;
        }
      }
    }
  }
}

PVector segIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  float bx = x2 - x1;
  float by = y2 - y1;
  float dx = x4 - x3;
  float dy = y4 - y3;
  float b_dot_d_perp = bx * dy - by * dx;
  if(b_dot_d_perp == 0) {
    return null;
  }
  float cx = x3 - x1;
  float cy = y3 - y1;
  float t = (cx * dy - cy * dx) / b_dot_d_perp;
  if(t < 0 || t > 1) {
    return null;
  }
  float u = (cx * by - cy * bx) / b_dot_d_perp;
  if(u < 0 || u > 1) { 
    return null;
  }
  return new PVector(x1+t*bx, y1+t*by);
}

