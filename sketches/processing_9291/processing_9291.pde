
import napplet.*;

NAppletManager nappletManager;
  
void setup() {
  size(400, 400);
  
  nappletManager = new NAppletManager(this);
  nappletManager.createNApplet("MouseBox", 25, 25);
  nappletManager.createNApplet("MouseBlob", 25, 225);
  nappletManager.createNApplet("MouseBox", 225, 225);
  nappletManager.createNApplet("MouseBlob", 225, 25);
}

void draw() {
  background(50);
}

public class MouseBox extends NApplet {
  
  int x, y;
  
  void setup() {
    size(150, 150);
    stroke(255);
    fill(100);
    x = width/2;
    y = height/2;
  }
  
  void draw() {
    if (mousePressed) {
      x = mouseX;
      y = mouseY;
    }
    background(0);
    translate(x, y);
    rotate(frameCount*PI/180);
    rect(-10, -10, 20, 20);
  }
}

public class MouseBlob extends NApplet {

  void setup() {
    size(150, 150);
    noStroke();
  }
  
  void draw() {
    translate(width/2, height/2);
    background(0);
    fill(255*mouseX/width);
    ellipse(0, 0, mouseY, mouseY);
  }
  
}

