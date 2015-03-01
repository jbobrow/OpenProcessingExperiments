
int num=500, c, fc;
Particle[] particles = new Particle[num];
color[] palette = {
  #9bd2e3, #eb432d, #f5b75a
};
boolean save= false;

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  if (c<num) {
    particles[c]= new Particle(random(width*.35, width*.65), random(height*.35, height*.65), int(random(0, 3)));
    c++;
  } 
  fill(#202020, 50);
  rect(0, 0, width, height);
  for (int i=0; i<c; i++) {
    particles[i].move();
    particles[i].update();
  }
  if (save) {
    if (frameCount%2==0 && frameCount<fc+100) saveFrame("image-###.gif");
  }

}

class Particle {

  float sz, speed, distance, angle, angleIncr;
  PVector dir, loc;
  int d, col;

  Particle(float x, float y, int _col) {
    loc = new PVector(x, y);
    sz = 2;
    col = _col;
    angleIncr = random(0.01, 0.005);
    d=random(1.0)>.5?1:-1;
    speed=random(.5, 1);
  }

  void move() {
    dir = new PVector(cos(angle), sin(angle));
    dir.mult(speed*d);
    //dir.normalize();
    loc.add(dir);
    angle += angleIncr;
  }

  void update() {
    fill(palette[col],150);
    ellipse(loc.x, loc.y, sz, sz);
    float distance = dist(width/2, height/2, loc.x, loc.y);
    if (distance>150) d*=-1;
  }
}
void keyPressed(){
  fc= frameCount;
  save = true;
}

