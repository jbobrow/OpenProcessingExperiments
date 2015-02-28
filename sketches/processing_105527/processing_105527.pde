
Sweet sweet = new Sweet();
Alice alice = new Alice();
Classical classical = new Classical();
Punk punk = new Punk();
Gothic gothic = new Gothic();

Barrette barrette = new Barrette();

void setup() {
  size(600, 500);
  background(255);
  smooth();

  rectMode(CENTER);
  strokeJoin(ROUND);

  textSize(30);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);

  pushMatrix();
  translate(width/2, height/2);


  barrette.display();

  if (mouseY > 440 && mouseY < 465) {
    if (mouseX > 35 && mouseX < 120) {
      sweet.display();
    }
    else if (mouseX > 140 && mouseX < 210) {
      alice.display();
    }  
    else if (mouseX > 230 && mouseX < 360) {
      classical.display();
    }
    else if (mouseX > 380 && mouseX < 450) {
      punk.display();
    }
    else if (mouseX > 470 && mouseX < 565) {
      gothic.display();
    }
    else {
      barrette.display();
    }
  }



  fill(0);
  text("Sweet  Alice  Classical  Punk  Gothic", 0, 200);
  popMatrix();
}

class Alice {
  Barrette barrette = new Barrette();

  Alice() {
  }

  void display() {
    barrette.linecolor = color(200);
    barrette.bgcolor = color(255, 219, 245);

    barrette.ribbonfrillcolor = color(234, 243, 255);
    barrette.ribboncolor_out = color(161, 216, 252);
    barrette.ribboncolor_in = color(255);

    barrette.bigfrillcolor = color(184, 213, 250);
    barrette.bigrotatedfrillcolor = color(255);
    barrette.smallfrillcolor = color(140, 229, 252);
    barrette.smallrotatedfrillcolor = color(255);

    barrette.circlecolor = color(255);
    barrette.stitchcolor = color(66, 172, 203);
    barrette.heartcolor = color(17, 112, 234);

    barrette.display();
  }
}

class Barrette {
  color linecolor = color(200);
  color bgcolor = color(255);

  color ribbonfrillcolor = color(255);
  color ribboncolor_out = color(255);
  color ribboncolor_in = color(255);

  color bigfrillcolor = color(255);
  color bigrotatedfrillcolor = color(255);
  color smallfrillcolor = color(255);
  color smallrotatedfrillcolor = color(255);

  color circlecolor = color(255);
  color stitchcolor = color(200);
  color heartcolor = color(200);

  Barrette() {
  }

  void display() {
    background(bgcolor);

    stroke(linecolor);
    fill(ribbonfrillcolor);
    ribbonfrill(0, 420, 15);
    ribbonfrill(-30, 400, 15);
    ribbonfrill(30, 400, 15);

    ribbon(0, 420, 15);
    ribbon(-30, 400, 15);
    ribbon(30, 400, 15);

    fill(bigrotatedfrillcolor);
    frill(6, 45, 220, 70);
    fill(bigfrillcolor);
    frill(6, 0, 220, 70);
    fill(smallrotatedfrillcolor);
    frill(10, 45, 180, 50);
    fill(smallfrillcolor);
    frill(10, 0, 180, 50);

    centercircle();
  }

  void centercircle() {
    fill(circlecolor);
    ellipse(0, 0, 160, 160);

    //stitch
    for (int i = 0; i < 70;i++) {
      if (i % 2 == 0) {
        stroke(stitchcolor);
      }
      else {
        noStroke();
      }
      arc(0, 0, 150, 150, radians(i*360/70), radians((i+1)*360/70));
    }

    //heart
    for (int i = 0; i < 10;i++) {
      pushMatrix();
      translate(55*cos(radians(360*i/10)), 55*sin(radians(360*i/10)));
      rotate(radians(360*i/10));
      fill(heartcolor);
      heart();
      popMatrix();
    }
  }

  void ribbonfrill(int theta, int w, int h) {
    for (int j = 0; j < 2;j++) {
      if (j == 1) {
        w *= -1;
      }
      for (int i = -2;i <= 2;i++) {
        pushMatrix();
        translate(0, 0);
        rotate(radians(theta));
        ellipse(w/2, i*h, h*2, h);
        popMatrix();
      }
      for (int i = -2;i < 2;i++) {
        pushMatrix();
        translate(0, 0);
        rotate(radians(theta));
        ellipse(w/2, i*h+h/2, h, h);
        popMatrix();
      }
    }
  }

  void ribbon(int theta, int w, int h) {
    for (int i = -2;i <= 2;i++) {
      if (i % 2 == 0) {
        fill(ribboncolor_out);
      }
      else {
        fill(ribboncolor_in);
      }

      pushMatrix();
      translate(0, 0);
      rotate(radians(theta));
      rect(0, i*h, w, h);
      popMatrix();
    }
  }

  void heart() {
    float r = 0.8;

    //stroke(linecolor);
    noStroke();
    beginShape();
    for (float i = 0; i< TWO_PI;i+=0.1) {
      curveVertex(calc_x(r, i), calc_y(r, i));
    }
    endShape(CLOSE);
  }

  float calc_x(float r, float t) {
    float x;

    x = r *(16 * sin(t) * sin(t) * sin(t));

    return x;
  }

  float calc_y(float r, float t) {
    float y;

    y = -1 * r * (13 * cos(t) - 5 * cos(2*t) - 2 * cos(3 * t) - cos(4 * t) );
    return y;
  }

  void frill(int val, int theta, int w, int h) {
    for (int i = 0; i < val;i++) {
      pushMatrix();
      translate(0, 0);
      rotate(radians(180*i/val + theta));
      ellipse(0, 0, w, h);
      popMatrix();
    }
  }
}

class Classical {
  Barrette barrette = new Barrette();

  Classical() {
  }

  void display() {
    barrette.linecolor = color(200);
    barrette.bgcolor = color(191, 211, 255);

    barrette.ribbonfrillcolor = color(255);
    barrette.ribboncolor_out = color(193, 43, 43);
    barrette.ribboncolor_in = color(188, 123, 80);

    barrette.bigfrillcolor = color(201, 73, 73);
    barrette.bigrotatedfrillcolor = color(175, 23, 23);
    barrette.smallfrillcolor = color(229, 184, 125);
    barrette.smallrotatedfrillcolor = color(162, 93, 49);

    barrette.circlecolor = color(180, 117, 58);
    barrette.stitchcolor = color(183, 30, 30);
    barrette.heartcolor = color(209, 23, 23);

    barrette.display();
  }
}

class Gothic {
  Barrette barrette = new Barrette();

  Gothic() {
  }

  void display() {
    barrette.linecolor = color(200);
    barrette.bgcolor = color(98, 6, 6);

    barrette.ribbonfrillcolor = color(255);
    barrette.ribboncolor_out = color(0);
    barrette.ribboncolor_in = color(255);

    barrette.bigfrillcolor = color(255);
    barrette.bigrotatedfrillcolor = color(255);
    barrette.smallfrillcolor = color(255);
    barrette.smallrotatedfrillcolor = color(0);

    barrette.circlecolor = color(0);
    barrette.stitchcolor = color(255);
    barrette.heartcolor = color(178, 29, 34);

    barrette.display();
  }
}

class Punk {
  Barrette barrette = new Barrette();

  Punk() {
  }

  void display() {
    barrette.linecolor = color(200);
    barrette.bgcolor = color(255, 205, 191);

    barrette.ribbonfrillcolor = color(255);
    barrette.ribboncolor_out = color(255, 0, 149);
    barrette.ribboncolor_in = color(85, 40, 137);

    barrette.bigfrillcolor = color(255, 0, 255);
    barrette.bigrotatedfrillcolor = color(255, 152, 212);
    barrette.smallfrillcolor = color(184, 149, 250);
    barrette.smallrotatedfrillcolor = color(255);

    barrette.circlecolor = color(255);
    barrette.stitchcolor = color(188, 111, 38);
    barrette.heartcolor = color(240, 215, 27);

    barrette.display();
  }
}

class Sweet {
  Barrette barrette = new Barrette();

  Sweet() {
  }

  void display() {
    barrette.linecolor = color(200);
    barrette.bgcolor = color(255, 250, 191);

    barrette.ribbonfrillcolor = color(255);
    barrette.ribboncolor_out = color(247, 209, 250);
    barrette.ribboncolor_in = color(255);

    barrette.bigfrillcolor = color(250, 178, 255);
    barrette.bigrotatedfrillcolor = color(255);
    barrette.smallfrillcolor = color(251, 203, 255);
    barrette.smallrotatedfrillcolor = color(255);

    barrette.circlecolor = color(255);
    barrette.stitchcolor = color(255, 0, 255);
    barrette.heartcolor = color(255, 200, 255);

    barrette.display();
  }
}



