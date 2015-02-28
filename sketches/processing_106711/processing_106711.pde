
Cloud[] clouds = new Cloud[60];

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0 ; i < clouds.length;i++) {
    clouds[i] = new Cloud();
  }

  noStroke();
}

void draw() {
  background(360);

  for (int i = 0 ; i < clouds.length;i++) {
    clouds[i].move();
    clouds[i].display();
  }
}

class Cloud {
  float R = random(30, 50);
  float r = R;

  float hue = random(360);
  float sat = random(50, 100); //Saturation

  float y_long = R * 1.4; //上昇幅

  float x = random(width);
  float y = random(height+y_long);

  float S = random(1); //size倍率
  float S_spd = random(0.01, 0.001) ;
  int S_flg;

  float theta = random(TWO_PI);
  float theta_spd = random(0.03, 0.01);
  float theta_sign;

  Cloud() {
    if (random(1) >= 0.5) {
      theta_sign = 1;
    } else {
      theta_sign = -1;
    }

    if (random(1) >= 0.5) {
      S_flg = 1;
    } else {
      S_flg = -1;
    }
  }

  void move() {
    //回転しながらサイズ小→大→小
    //合わせてy軸上昇→降下
    if (S_flg == 1) {
      S += S_spd;
      if (S > 1.0) {
        S = 1.0;
        S_flg *= -1;
      }
    } else {
      S -= S_spd;
      if (S < 0) {
        S = 0;

        R = random(30, 50);
        r = R;

        y_long = R * 1.4; //上昇幅

        hue = random(360);
        sat = random(50, 100);

        x = random(width);
        y = random(height+y_long);

        S_flg *= -1;
      }
    }

    theta += theta_sign * theta_spd;
  }

  void display() {
    fill(hue, sat, 100); //sat = 80
    donuts(r);

    fill(hue, sat - 30, 100);
    donuts(r - 10);
    ellipse(x, y - y_long * abs(sin(S)), r * 2*S, r*2*S);
  }

  void donuts(float r) {
    pushMatrix();
    translate(x, y - y_long * abs(sin(S)));
    rotate(theta);
    for (int i = 0; i < 8;i++) {
      ellipse(R*cos(radians(360 * i / 8))*S, R*sin(radians(360 * i / 8))*S, r*S, r*S);
    }
    popMatrix();
  }
}



