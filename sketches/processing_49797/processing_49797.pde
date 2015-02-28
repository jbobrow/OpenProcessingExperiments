
class Circle {
  int x1, y1;
  float r = 0;
  int RightOrLeft, speed;
  //color circleColor = 
  Circle(int x, int y) {
    x1 = x;
    y1 = y;
    RightOrLeft = int(random(2));
  //  speed
  }

  void draw() {
    if (RightOrLeft == 0){
      r+=0.05;
    } else {
      r-=0.05;
    }
      
    pushMatrix();
    translate(x1,y1);smooth();
    fill(255);
    noStroke();
    rectMode(CENTER);
    rotate(r);
    rect(0,0,40,40);//x, y, radius, radius
    fill(100);
    noStroke();
    ellipse(0,0,3,3);
    popMatrix();
  }
}


