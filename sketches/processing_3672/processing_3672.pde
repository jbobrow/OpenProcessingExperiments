
class Building extends Displayable {
  
  int age = 0;
  int h = 60;
  int w = 30;
  boolean[] windows;
  
  Building(Planet p, float posA) {
    super(p, posA);
    windows = new boolean[9];
    for (int i = 0; i < windows.length; i++) {
      if (random(2) > 1) windows[i] = true;
    }
    h = 30 + int(random(30));
    w = 20 + int(random(10));
  }
  
  void grow() {
    
    age++;
  
    int gh = h;
    int gh2 = 5;
  
    if (age < 40) {
      if (age < 10) gh = min(age, 10)*h/10;
      if (age < 20) gh2 = 0;
    } 
    
    rect(-w/2, h/10, w, -gh);
    fill(255);
    int dw = w/7; int dh = -gh/7;
    for (int i = 0; i < windows.length; i++) {
      int x = i%3; int y = int(i/3);
      if (windows[i]) rect(-w*0.5 + dw + x*2*dw, 1.5*dh + y*2*dh, gh2, gh2);
    }
    fill(0);
    
  }
  
}

