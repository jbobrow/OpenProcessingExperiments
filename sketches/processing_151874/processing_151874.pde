
    void setup() {
      size(600,600);
    }
     
    void draw() {
      background(255);
      ellipse(frameCount, height / 2, 10, 10);
    }


    float speed;
    float x;
    float y;
    float angle, vx, vy;
    float ay;
     
     
    void setup() {
      size(600,600);
      speed = 5;
      x = 0;
      y = 300;
      angle = radians(20);
      vx = speed * cos(angle);
      vy = speed * sin(angle);
      ay = 0.05
    }
     
    void draw() {
      background(255);
      x = x + vx;
      y = y + vy;
      vy = vy + ay;
      ellipse(x, y, 10, 10);
    }

