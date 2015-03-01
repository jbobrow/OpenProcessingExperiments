
    void setup() {

      size(800, 600);

      strokeWeight(10);

    }

    float tang;

    void draw() {

      background(127);

      fill(255);

      ellipse(400, 300, 300, 300);

      float ht = 300 - mouseY, wdt = 400 - mouseX;

      if (wdt != 0) {

        tang = ht / wdt;

        fill(0);

        float d = dist(mouseX, mouseY, 400, 300);

        if (d > 80) { //Fora do Olho

          if (mouseX - 400 > 0) {

            ellipse (80*(cos(atan(tang)))+400, 80*(sin(atan(tang)))+300, 100, 100);

          } else ellipse (-1*80*(cos(atan(tang)))+400, -1*80*(sin(atan(tang)))+300, 100, 100);

        } else { //Dentro do Olho

          if (mouseX - 400 > 0) {

            ellipse (d*(cos(atan(tang)))+400, d*(sin(atan(tang)))+300, 100, 100);

          } else ellipse (-1*d*(cos(atan(tang)))+400, -1*d*(sin(atan(tang)))+300, 100, 100);

        }

      }

    }
