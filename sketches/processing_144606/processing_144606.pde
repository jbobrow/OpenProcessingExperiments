
Particle[] p = new Particle[400];
void setup() {
  size(800, 800);
  noStroke();
  background(255);
}

void draw() {
  // fill(255,255,255,5);
  // rect(0,0,width,height);
  // background(255);
  if (p[0]!=null) {

    for (int i=0;i<p.length;i++) {
      p[i].move();
    }
  }
}

void mousePressed() {
  for (int i=0;i<p.length;i++) {


    p[i]=new Particle(mouseX, mouseY);
  }
}


class Particle {
  color c;
  float x=0;
  float y=0;
  float a=0;
  float aInc=0;
  float s=1;

  float driftAngle = 0;

  int totalTicks = 100;
  int tick=0;

  public Particle(float x, float y) {
    c = color(random(255), random(255), random(255), 40);
    float grey = random(255);
    c = color(grey, grey, grey, 40);
    this.x=x;
    this.y=y;
    aInc= random(-4, 4);

    driftAngle = random( 360);
  }

  public void move() {
    if ( tick++ < totalTicks) {


      x += cos( radians( a ) ) * s;
      y += sin( radians( a+=aInc ) ) * s ;

      x += cos( radians( driftAngle ) ) * 2;
      y += sin( radians( driftAngle ) ) * 2;

      stroke(c);
      strokeWeight(map(tick, 0, totalTicks, 15, 0.1) );
      point(x, y);
    }
  }
}

