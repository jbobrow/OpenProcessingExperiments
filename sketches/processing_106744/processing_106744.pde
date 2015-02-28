
Wave[] wav = new Wave[7];

void setup() {
  size(600, 350);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0 ; i < wav.length;i++) {
    wav[i] = new Wave(wav.length - i);
  }
}

void draw() {
  background(360);

  for (int i = 0 ; i < wav.length;i++) {
    wav[i].waving();
  }
}

class Star {
  int vertex_val = 5 * 2;
  float R;
  float R_out = random(10, 30);
  float R_in;

  float hue;
  float sat = random(30, 100);

  float theta = random(TWO_PI);
  float theta_spd = random(1, 3)/100 / 1.5;
  int theta_sign;

  int num;

  float y_theta;
  

  Star(int tmpNum) {
    num = tmpNum;

    y_theta = TWO_PI * num /7;

    hue = 360 * num / 7;

    if (random(1) >= 0.5) {
      theta_sign = 1;
    } else {
      theta_sign = -1;
    }
  }

  void display(float star_num,float amp) {
    R_in = R_out / 1.75;

    stroke(360, 120);
    fill(hue, sat, 100, 120);

    pushMatrix();
    translate(0, 100*sin(star_num/ amp + y_theta));
    rotate(theta);
    beginShape();
    for (int i = 0;i < vertex_val;i++) {
      if (i % 2 == 0) {
        R = R_out;
      } else {
        R = R_in;
      }
      vertex(R * cos(radians(360 * i / vertex_val)), R * sin(radians(360 * i /vertex_val)));
    }
    endShape(CLOSE);
    popMatrix();

    theta += theta_sign * theta_spd;

    y_theta += 0.0025;
  }
}

class Wave {
  int r = 20;

  Star[] stars = new Star[width/r];

  float t = 0.0;
  float xoff = t;
  float off_random= random(width);

  float xoff_delta = random(0.05, 0.1) / 2;
  float t_delta = random(3, 6) / 1000 / 2;

  float theta;

  int num;

  float amp = random(5, 20);

  Wave(int tmpNum) {
    num = tmpNum;

    theta = TWO_PI * num / 7;

    for (int i = 0 ; i < stars.length;i++) {
      stars[i] = new Star(num);
    }
  }

  void waving() {
    //xoff = t + off_random;

    for (int i = 0; i < stars.length; i++) {
      //float y1 = noise(xoff)*height;

      float y = height/2 + 100 * sin(theta);

      pushMatrix();
      translate(i*r, y);
      stars[i].display(i, amp);

      popMatrix();

      xoff += xoff_delta;
    }

    t += t_delta;

    theta += 0.01;
  }
}



