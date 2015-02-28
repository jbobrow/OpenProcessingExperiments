
class gradient {
color startc = color(204,208,212);
color endc = color(82,96,110);

  void printgradient () {
  float amt = 0;
  float u = (float) height;
  float step = 1 / u;
    for (int i=0;i<height+1;i++) {
    stroke (lerpColor(startc, endc, amt));
    line (0,i,width,i);
    amt += step; 
    }
  }
  
}

