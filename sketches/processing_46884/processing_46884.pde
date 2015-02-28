
class Particula {
  float x;
  float y;
  float z;

  float fx;
  float fy;
  float fz;

  float ox;
  float oy;
  float oz;

  float ruidoValue;
  float radio;

  float theta1;
  float theta2;

  color c;
  float t =0;

  Particula(color c) {
    this.theta1 = random(360);
    this.theta2 = random(360);
    this.ruidoValue = random(-0.1, 0.1);
    //radio = random(90, 150);
    radio = 250;
    this.c =c;
    ox = random(-width/2, width/2);
    oy = random(-height/2, height/2);
    oz = random(-width/2, width/2);
  }

  void update() {
    x = radio * cos ( radians(theta1) )* cos( radians(theta2));
    y = radio * sin ( radians(theta1) )* cos( radians(theta2));
    z = radio * sin ( radians(theta2) ); 

    ox = (x - ox)*t + ox;
    oy = (y - oy)*t + oy;
    oz = (z - oz)*t + oz;

    if (dist(x, y, z, ox, oy, oz) < 0.4) {
      t= 0;
      ox = random(-width/2, width/2);
      oy = random(-height/2, height/2);
      oz = random(-width/2, width/2);
      this.theta1 = random(360);
      this.theta2 = random(360);
    }


    ruidoValue += 0.03;
    radio = noise(ruidoValue)*230 + 100;
    t+=0.000006;
  }
}


