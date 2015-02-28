

class node
{
  float x, y, vx, vy;
  float m, r;

  node (float X, float Y) {
    x  = X;
    y  = Y;
    vx = 0;
    vy = 0;
    m  = 50;
    r  = m/2;
  }

  void update() {

    if (mousePressed && mouseButton==LEFT) {
      if (dist(x, y, mouseX, mouseY)<m/4) {
        x  = mouseX;
        y  = mouseY;
        vx = (mouseX-pmouseX)*20;
        vy = (mouseY-pmouseY)*20;
      }
    }

    vx *= 0.99;
    vy *= 0.99;
    
    x  += vx*dt;
    y  += vy*dt + g*dt;
    show();
  }

  void show() {
    pushStyle();
    noFill();
    stroke(m, 255, 255-m, 250);
    ellipse(x, y, 2*r, 2*r);
    popStyle();
  }
  
  void stop() {
    vx = 0;
    vy = 0;
  }
}


