
PinBall [] circles = new PinBall[50];

void setup () {
  size(600, 500);
  smooth();
  for (int i=0; i<circles.length; i++) {
    float x= random (width);
    float y = random (height);
    int r = i+2;
    circles[i] = new PinBall (x, y, r);
  }
}

void draw () {
  fill(random(200, 40));
  for (int i = 0; i <circles.length; i++) {
    circles[i].update();
    circles[i].display();
  }
}

class PinBall {
  float x;
  float y;
  float speedx;
  float speedy;
  int diameter;

  PinBall(int temp_x, int temp_y, int tempDiameter) {
    x=temp_x;
    y=temp_y;
    diameter= tempDiameter;
    speedx=10;
    speedy=5;
  }
  void display () {
    fill(random(200,50));
    noStroke();
  }

  void update () {
    noStroke();
    ellipse(x, y, diameter, diameter);
    x+=random(-speedx, speedx);
    y+=random(-speedy, speedy);
    if (y>=height) {
      speedy=-1;
    }
    if (y<0) {
      speedy+=+1;
    }
    if (x>=width) {
      speedx+=-1;
    }
    if (x<0) {
      speedx+=+1;
    }
  }
}



