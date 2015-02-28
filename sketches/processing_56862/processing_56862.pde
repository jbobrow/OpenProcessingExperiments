

int radius = 100;
float x = -radius;
float speed = 0.5;

void setup() {
  size(800, 800);
  smooth();
  strokeWeight(15);
  stroke(0, 0, 0, 10);
  ellipseMode(CENTER);
}

void draw() {
  background(255);
  //right
  for (int y= 0; y<=800; y+=20) {
    for (int x= 0; x<=800; x+=20) {
      fill(220, 0, 0);
      x += speed;
      float r = random(-5, 5);
      ellipse(x-3, y*1.2, 15 - y/100 + r, 15- y/100 + r);
      line( x, y, 400, 400);
    }
  }




  //top
  strokeWeight(10);
  for (int m= 0; m<=height-20; m+=100) {
    for (int n= 0; n<=width-20; n+=100) {
      fill(88, 268, 55, 162);
      ellipseMode(CENTER);
      ellipse(n-5*2, m-5/2, 50, 50);
    }
  }

  //left
  strokeWeight(5);
  stroke(56, 79, 100, 22);
  for (int g= 0; g<=height; g+=30) {
    for (int f= 0; f<= width; f+=30) {
      fill(168, 0, 76, 35);
      ellipseMode(CENTER);
      ellipse(f-100, g-100, 50, 50);
    }
  }
}//closing bracket for draw


//}


