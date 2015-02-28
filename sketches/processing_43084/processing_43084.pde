
class Cube {




  //jiggle variables
  float jigX = 0;
  float jigY = 0;
  float jigZ = 0;
  float jigSpeed = 1;

  float originalD;


  Cube(float tempD) {
    d = tempD;
    originalD = d;
  } 

  void display() {
    stroke(255);
    fill(0); 
    pushMatrix();
    rectMode(CENTER);
    translate(mouseX, mouseY);
    rotateX(radians(jigX));
    rotateY(radians(jigY));
    rotateZ(radians(jigZ));
    jigX+=jigSpeed/2;
    jigY+=jigSpeed/2;
    jigZ+=jigSpeed;
    box(d);
    popMatrix();
  }

  void shrink() {
    if (mousePressed && d>originalD/2 && shrinkTimer>0) {
      shrinkTimer--;
      d--;
    }
    else {
      d++; 
      if (d>=originalD) {
        d=originalD;
        if (shrinkTimer <40) {
          shrinkTimer+=.2;
        }
      }
    }
  }
}


