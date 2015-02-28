
Octopuss octo;
Body body;
Arms [] arms = new Arms [6];



void setup() {
  size(800, 400);
  //frameRate(30);
  octo = new Octopuss();
  body = new Body();
  for (int i = 0; i < arms.length; i++) {
    arms[i] = new Arms(i*PI/arms.length);
  }
}

void draw() {
  noStroke();
  fill(255, 5);
  rect(0, 0, width, height);
  octo.update();
  octo.display();
}


class Octopuss {
  PVector location;
  int size = 10;
  float xtime = 0.0;

  Octopuss() {
    location = new PVector(noise(xtime)*width, noise(xtime+1)*height);
  }

  void update() {
    location.set(noise(xtime)*width, noise(xtime+1)*height);
    xtime+=0.001;
  }


  void display() {
    body.display();
    body.update();
    for (Arms a : arms) {
      a.display();
      a.update();
    }
  }
}

class Body extends Octopuss {
  Body() {
    super();
  }

  void display() {
    stroke(0);
    fill(0, 4);
    ellipse(location.x, location.y, size, size);
  }
}

class Arms extends Octopuss {
  float startAngle;
  float angleVel;
  float theta;
  Arms(float theta) {
    super();
    this.theta = theta;
    startAngle = random(3);
    angleVel = random(0.1, 0.2);
  }

  void display() {
    float angle = startAngle;
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    for (int x = 0; x <= 30; x++) {
      int amp = 2;
      float y = x*amp*sin(angle);
      stroke(0);
      fill(0, 50);
      ellipse(x*size/2, y, size, size);
      angle+=angleVel;
    }
    startAngle +=0.025;
    popMatrix();
  }
}





