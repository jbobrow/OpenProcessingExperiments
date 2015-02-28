
class Sakura {
  float inner_s;
  float ch;
  float cs;
  float cv;

  float spd;

  float color_theta;

  float t;

  Sakura() {
    color_theta = random(360);
  }

  void display(float x, float y, float s, float ch, float t) {
    float cs_p = 0.2;
    
    colorMode(HSB,360,100,100);
    noStroke();
    pushMatrix();
    translate(x, y);
    rotate(radians(t));
    for (int j = 0 ; j < 1;j++) {
      if (j == 0) {
        inner_s = 1.2 * s;

        cs = 80;
        cv = 98;
      }
      else if (j == 1) {
        inner_s = 1 * s;
        cs = 50;
        cv = 100;
      }
      else {
        inner_s = 0.5 * s;
        cs = 20;
        cv = 100;
      }
      for (int i = 0; i < 5;i++) {
        pushMatrix();
        rotate(radians(360 * i / 5));
        fill(ch, cs, cv,30);
        heart(0, -37.5*inner_s, 45*inner_s, 75*inner_s);
        popMatrix();
      }
    }
    popMatrix();
    colorMode(RGB,255,255,255);
  }



  void heart(float centerX, float centerY, float width, float height) {
    final float WIDTH = width / 2 * 0.85;
    final float HEIGHT = height / 2;
    final float OFFSET = centerY - (HEIGHT / 6 * 5);
    beginShape();
    for (int i = 0; i < 30; i++) {
      float tx = abs(sin(radians(i * 12))) * (1 + cos(radians(i * 12))) * sin(radians(i * 12)) * WIDTH + centerX;
      float ty = (0.8 + cos(radians(i * 12))) * cos(radians(i * 12)) * HEIGHT + OFFSET;
      vertex(tx, ty);
    }
    endShape(CLOSE);
  }
}


