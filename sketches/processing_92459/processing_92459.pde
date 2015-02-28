
class BouncingSphere {
  float r = 153;
  float g = 50;
  float b = 204;
  int radi = 200; 
  float x1 = int(random(radi, width-radi));  
  float y1 = int(random(radi, height-radi));
  float z1 = 300; 
  float speed1 = 4;  
  int distance1 = -650;
  int moveLeft1 = 11;
  int moveRight1 = 11;

  BouncingSphere() { //here is the constructor. Often more goes in here but I think in this case this is all that can go
    specular(255, 90, 0); //color of surface light
    shininess(7.0);
  }//end const

  void display() {
    fill(r, g, b);
    noStroke();
    translate(0, 0, distance1); //maybe these can be combined
    translate(x1, y1, z1); //sets location of sphere
    sphere(radi);
  }//end void

  void move() {
    z1 = z1 + speed1;
    // If sphere reaches the bottom
    if (z1 < distance1 || z1 > 500) {
      speed1 = -speed1;
    }//end if
    x1+=moveLeft1;
    y1+=moveRight1;
    if (x1<20 || x1>width-radi) {
      moveLeft1=-moveLeft1;
    }//end if
    if (y1<20 || y1>height-radi) {
      moveRight1=-moveRight1;
    }//end if
  }//end void
  void setColor(float red, float green, float blue) {
    r = red;
    g = green;
    b = blue;
  }//end void
}//end class

