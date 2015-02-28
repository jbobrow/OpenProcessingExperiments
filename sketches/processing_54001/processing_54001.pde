
//know position
class Bubble{
  float ang;
  float x, y, z;
  Bubble(){
    x= random(-1000, 1000);
     y= random(-1000, 1000);
      z= random(-1000, 1000);
  }
  void display(){
    rotateY (ang);
    pushMatrix();
    translate(x, y, z);
    sphereDetail(20);
    fill (200, 0, 200);
    sphere(20);
    popMatrix();
  }
  void move(){
    y-=2;
    ang-=.001;
    if(y < -300) {
      x = random(width);
      y = height;
     
  }
  }
}


