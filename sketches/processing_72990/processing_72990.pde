
Robot r;
Robot r2;
Robot r3;


void setup() {
  size(400, 400);
  noStroke();
  background(255);
  r = new Robot(20, 20, 1, (int)random(255), random(20));
  r2 = new Robot(20, 40, 0.5, (int)random(255), random(20));
  r3 = new Robot(20, 60, 0.1, (int)random(255), random(20));
}

void draw() {
  r.render();
  r2.render();
  r3.render();
}

class Robot {
  float x=0;
  float y=0;
  float m=0;
  float d=0;
  int c=0;


  public Robot(float n_x, float n_y, float n_m, int n_c, float n_d) {
    x= n_x;
    y= n_y;
    m= n_m;
    c= n_c;
    d= n_d;
  }

  public void render() {
    fill(c);
    ellipse(x, y, d, d);
    x += m;
  }
}


