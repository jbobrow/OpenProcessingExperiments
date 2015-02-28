
class Circle {
  int x1, y1;
  float r = 0;
  int RightOrLeft, speed;
  ////////////flower size random /////////
  float petal1 = random(10,30);
  float petal2 = random(20,40);
  float flowerSize = petal2/2;
  float flowerCenter = flowerSize/1.3;
  ////////////flower color random /////////
  color fc1 = color(245,132,102);
  color fc2 = color(228,169,90);
  color fc3 = color(255,217,143);
  color fc4 = color(254,219,180);
  color fc5 = color(149,15,67);
  color fc6 = color(148,0,100);
  color[] fcColors = { 
  fc1,fc2,fc3,fc4,fc5,fc6
};
  color fcColor=(fcColors[int(random(0,6))]);
  
  Circle(int x, int y) {
    x1 = x;
    y1 = y;
    RightOrLeft = int(random(2));
    //  speed
     
  }

  void draw() {
    if (RightOrLeft == 0) {
      r+=0.05;
    } 
    else {
      r-=0.05;
    }

    pushMatrix();
    translate(x1, y1);
    rotate(r);
    flower();
    popMatrix();
  }
  void flower() {
    noStroke();
    smooth();
    fill(255);
    ellipse(0, flowerSize, petal1, petal2);
    ellipse(0, flowerSize*-1, petal1, petal2);
    ellipse(flowerSize, 0, petal2, petal1);
    ellipse(flowerSize*-1, 0, petal2, petal1);
    fill(fcColor);
    ellipse(0, 0, flowerCenter, flowerCenter);
  }
  
}


