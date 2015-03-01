
    void setup() {

      size(800, 600);

      background(0);

      strokeWeight(3);

      cron_UI();

    }

    void draw() {

      ponteiro();

    }

    void ponteiro() {

      noStroke();

      fill(0);

      ellipse(400, 300, 205, 205);

      stroke(#2cd8ac);

      float ang = millis()*(PI/30000);

      float x = 100*cos(ang-HALF_PI);

      float y = 100*sin(ang-HALF_PI);

      line(400, 300, x+400, y+300);

    }

    void cron_UI() {

      noFill();

      stroke(#8c8c8c);

      ellipse(400, 300, 260, 260); 

      for (float ang = 0; ang < 2*PI; ang+=HALF_PI) {

        float x = 115*cos(ang-HALF_PI);

        float y = 115*sin(ang-HALF_PI);

        fill(#2ed82c);

        text(int(0+(ang/HALF_PI)*15), x+400-7, y+300+6);

      }

    }
