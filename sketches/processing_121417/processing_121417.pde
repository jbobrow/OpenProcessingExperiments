
//template for planets

public class Planet {
  color c;
  float r;
  float x;
  float y;
  float theta;
  float theta_vel;
  float a;
  float b;

  Planet(color tempC, float tempR, float tempX, float tempY, float tempTheta, float tempTheta_vel, float tempA, float tempB) { // The Constructor is defined with arguments.
    c = tempC;
    r = tempR;
    x = tempX;
    y = tempY;
    theta = tempTheta;
    theta_vel = tempTheta_vel;
    a = tempA;
    b = tempB;
  }

  void display() { //general aesthetics of planets
    stroke(0);
    fill(c);
    ellipse(x,y,r,r);
  }

  void orbit() { //planets orbit around the sun
    x = (a * cos(theta) -10);
    y = (a * sin(theta) - 10);
    theta += theta_vel;
  }

}

