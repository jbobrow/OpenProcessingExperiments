
class Higgs {
  float x, y;
  float r;
  float atomSpeed;

  Higgs() {
    x=random(width);
    y=-random(4000);
    atomSpeed=0;
  }

  void display() {
    fill(100); 
    PImage h = loadImage("higgsphere.gif");  
    imageMode(CENTER); 
    image(h, x, y);
  }
}


