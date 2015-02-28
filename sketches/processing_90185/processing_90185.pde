
class Flower {
  float ch;
  float cs = 80;
  float cb = 100;

  float inner_s;
  float s = 0;
  color flower_color;
  float rotate_flg;

  float x;
  float y;
  float flower_size;
  float growth;

  float sign_flg = 1;

  float flower_theta;
  float theta_sign;
  float theta_val;

  Flower() {
    ch = random(360);
    x = random(width);
    y = random(height);
    flower_size = random(0.1, 0.7);
    growth = random(0.005, 0.02);
    flower_theta = random(TWO_PI);

    theta_val = random(0.01, 0.05);
    if (random(1) > 0.5) {
      theta_sign = 1;
    }  
    else {
      theta_sign = -1;
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(flower_theta);
    for (int j = 0;j < 4;j++) {
      switch(j) {
      case 0:
        inner_s = 1.2*s;
        cs = 80;
        cb = 80;
        rotate_flg = 0;
        break;
      case 1:
        inner_s = 1*s;
        cs = 80;
        cb = 100;
        rotate_flg = 0;
        break;
      case 2:
        inner_s = 0.6*s;
        cs = 0;
        rotate_flg = 1;
        break;
      case 3:
        inner_s = 0.4*s;
        cs = 80;
        cb = 100;
        rotate_flg = 0;
        break;
      }
      for (int i = 0; i < 4; i++) {
        pushMatrix();
        rotate(radians(45*i+45/2*rotate_flg));
        stroke(ch, cs, cb, 80);
        fill(360, 5);
        ellipse(0, 0, 200*inner_s*flower_size, 60*inner_s*flower_size);
        popMatrix();
      }
    }
    fill(360);
    ellipse(0, 0, 30*flower_size*s, 30*flower_size*s);

    popMatrix();
  }

  void move() {
    flower_theta += theta_sign * theta_val;
    if (sign_flg == 1) {
      s += growth;
      if (s > 1) {
        sign_flg *= -1;
      }
    }
    else {
      s -= growth;
      if (s < 0) {
        sign_flg *= -1;
        s = 0;
        ch = random(360);
        x = random(width);
        y = random(height);
        flower_size = random(0.1, 0.7);
        growth = random(0.005, 0.02);
        flower_theta = random(TWO_PI);

        theta_val = random(0.01, 0.05);
        if (random(1) > 0.5) {
          theta_sign = 1;
        }  
        else {
          theta_sign = -1;
        }
      }
    }
  }
}


