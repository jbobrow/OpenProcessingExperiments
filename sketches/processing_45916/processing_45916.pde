
class Orbit {
  float x;
  float y;

  float cOrbit;
  float d;
  float dx;
  float dy;
  int id;
  float theta;
  float inc;

  Orbit(int id, float cOrbit) {
    this.id = id;
    x=   random(width/2- 300, width/2 + 300);
    y =  random(height/2 -300, height/2 + 300);
    d = random(-0.1, 0.1);

    theta = random(-TWO_PI, TWO_PI);
    dx = random(-1, 1) +0.1;
    dy = random(-1, 1) +0.1;
    inc = random(-0.1, 0.1) +0.1;

    this.cOrbit = cOrbit;
  }

  void update() {
    if ( dist(x, y, width/2, height/2) <= 300 + random(-20, 80)) {
      x += cos(theta + dx)*d;// + dx;
      y += sin(theta + dy)*d;

      d  +=0.03;
      dx += inc;
      dy += inc;
      theta += 0.1;
    }
    else {
      x=   random(width/2- 300, width/2 + 300);
      y =  random(height/2 -300, height/2 + 300);
      d = random(-0.01, 0.01);
      dx = random(-1, 1) +0.1;
      dy = random(-1, 1) +0.1;
      theta = random(-TWO_PI, TWO_PI);
    }
  }

  void draw() {
    float mg = atan2(y, x);
    float nx = norm(x, 0, width);
    float ny = norm(y, 0, height);
    stroke(0, 50);
    point(x, y);
    if ( id % 3 ==0) {
      stroke(id/10, id/10, mg*10 +10, 10 + id/20);
      point(x, y);
    }

    if (id % 5 == 0) {
      stroke(200, 50);
      point(x, y);
    }


    update();
    noiseVal +=0.02;
  }
}
int i=0;
void keyPressed(){
  save("dia10"+i+".png");
  i++;
}


