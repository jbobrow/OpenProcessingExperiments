
Planet[] planetlist = new Planet[8];
float screenh = 825/2, speed;

void setup() {
  size(825, 490);
  background(200, 100, 0);
  stroke(255, 50);
  smooth();
  noStroke();
  text("created by ChristianGeick 2011", 825-250, 490-50);

  planetlist[0] = new Planet(3.8, 30, 0.24);
  planetlist[1] = new Planet(9.5, 50, 0.52);
  planetlist[2] = new Planet(10, 90, 1);
  planetlist[3] = new Planet(5, 130, 1.88);
  planetlist[4] = new Planet(112, 225, 11.88);
  planetlist[5] = new Planet(94.5, 350, 29.5);
  planetlist[6] = new Planet(40.1, 425, 84);
  planetlist[7] = new Planet(38.8, 475, 164.8);
}

void draw() {

  fill(255,225);
  if (mousePressed) {
    background(150, 0, 200);
    if (mouseX != 825/2) {
      speed = (-1*(screenh-mouseX))/( 825 ) ;
    } 
    else {
      speed = 0;
    }

    ellipse(825/2, 490/2, 25, 25); //sun
    fill(255,225);

    for (int i=0; i<planetlist.length; i++) {
      if (planetlist[i] != null) {
        planetlist[i].orbit(speed);
      }
    }
  }
}

class Planet {
  float vel = 1, trans; //velocity and transparency
  float r, d, v; //size, distance, velocity

  Planet(float rad, float dis, float vel) {
    r = rad;
    d = dis;
    v = vel;
  }

  void orbit(float speed) {
    vel +=speed;
    ellipse(cos(vel/v)*d+825/2, sin(vel/v)*d/2+490/2, r, r);
  }
}


