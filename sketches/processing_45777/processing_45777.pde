
  PShape f;

class Falcon {
  
  boolean dead;
  
  Falcon() {  
    
    f = loadShape("falcon.svg");
    dead = false;
  }

  void render() {
    a=atan2(mouseY-y, mouseX-x);
    d=dist(mouseX, mouseY, x, y);
    noCursor();
    
    x=x+sqrt(d)*cos(a)*.65;
    y=y+sqrt(d)*sin(a)*.65;
    fill(255);
    shape(f, x-50, y-40, ssize*4, ssize*3);
  }
  
}


