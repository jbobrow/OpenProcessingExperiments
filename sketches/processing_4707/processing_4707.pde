
class Building extends Displayable {
  
  int h = 60;
  int w = 30;
  boolean[] windows;
  int ww = 5; // windows width 

  
  Building(Planet p, float posA) {
    super(p, posA);
    
    
    h = int(random(p.halfsize>>3, p.halfsize>>1));
    w = int(random(p.halfsize>>4, p.halfsize/6));
    
    ww = min(h,w)/5; 
    
    windows = new boolean[9];
    
    for (int i = 0; i < windows.length; i++) {
      if (random(2) > 1) windows[i] = true;
    }
  }
  
  void grow() {
   
    
    
   if ( isDying ) {
      age--;
    } else {
    age++;
    }
  
    int gh = h;  // temporary heigth
    int gh2 = ww; // windows width
  
    if (age < 30) {
      if (age < 0) isDead = true;
      if (age < 10) gh = min(age, 10)*h/10;
      if (age < 30-ww) {
        gh2 = 0;
      } else {
        gh2= age-(30-ww);
      }
    } else {
      age = 30;
    }
    
    strokeWeight(1);
    noStroke();
    rect(-w/2, h/10, w, -gh);
    fill(255);

    int dw = w/7; int dh = -h/7;
    for (int i = 0; i < windows.length; i++) {
      int x = i%3; int y = int(i/3);
      if (windows[i]) rect(-w*0.5 + dw*(1+x*2), ww + 1.5*dh + y*2*dh, ww, -gh2);
    }
    fill(0);
    
  }
  
}

