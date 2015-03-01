
//tweak by Jerome Herr, original code by Raven Kwok aka Guo, Ruiwen
//ravenkwok.com
//vimeo.com/ravenkwok
//flickr.com/photos/ravenkwok

ArrayList<Particle> pts;
boolean onPressed;

void setup() {
  size(800, 600);
  frameRate(30);

  pts = new ArrayList<Particle>();

  background(0);
}

void draw() {


 background(0);

  if (onPressed) {
    for (int i=0; i<10; i++) {
      Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size());
      pts.add(newP);
    }
  }

  for (int i=0; i<pts.size (); i++) {
    Particle p = pts.get(i);
    p.update();
    p.display();
  }

  for (int i=pts.size ()-1; i>-1; i--) {
    Particle p = pts.get(i);
    if (p.dead) {
      pts.remove(i);
    }
  }
}

void mousePressed() {
  onPressed = true;

}


void mouseReleased() {
  onPressed = false;
}
class Particle {
  PVector loc, vel, acc;
  int lifeSpan, passedLife;
  boolean dead;
  float alpha, weight, weightRange, decay, xOffset, yOffset;

  Particle(float x, float y, float _xOffset, float _yOffset) {
    loc = new PVector(x, y);

    float randDegrees = random(360);
    vel = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    vel.mult(random(5));

    acc = new PVector(0, 0);
    lifeSpan = int(random(30, 90));
    decay = random(0.75, 0.9);
    weightRange = random(3, 50);

    xOffset = _xOffset;
    yOffset = _yOffset;
  }

  void update() {
    if (passedLife>=lifeSpan) {
      dead = true;
    } else {
      passedLife++;
    }

    alpha = float(lifeSpan-passedLife)/lifeSpan * 70+50;
    weight = float(lifeSpan-passedLife)/lifeSpan * weightRange;

    acc.set(0, 0);

    float rn = (noise((loc.x+frameCount+xOffset)*0.01, (loc.y+frameCount+yOffset)*0.01)-0.5)*4*PI;
    float mag = noise((loc.y+frameCount)*0.01, (loc.x+frameCount)*0.01);
    PVector dir = new PVector(cos(rn), sin(rn));
    acc.add(dir);
    acc.mult(mag);

    float randDegrees = random(360);
    PVector randV = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    randV.mult(0.5);
    acc.add(randV);

    vel.add(acc);
    vel.mult(decay);
    vel.limit(3);
    loc.add(vel);
  }

  void display() {
    strokeWeight(weight+1.5+2);
    stroke(0,alpha);
    point(loc.x, loc.y);

    strokeWeight(weight*.5+2);
    //stroke(#6FFF00);
    stroke(230);
    point(loc.x, loc.y);
  }
}
