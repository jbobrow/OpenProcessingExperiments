
class predator {
  PVector target = new PVector(random(20, 40), random(20, 40));
  PImage chef;
  PVector position = new PVector(320, 240);
  int dir = 1;
  Chef() {
    this.chef = requestImage("chef128.png");
  }
  void update() {
    imageMode(CENTER);
  }
}
class Ricochet {
  PImage racoon;
  PVector position = new PVector(16, 16);
  PVector dir = new PVector(1,1);


  Ricochet() {
    this.racoon = requestImage("raccoon.png");
  }

  void update() {
    this.position.x += this.dir.x;
    this.position.y += this.dir.y;
    
  }
}

class Bouncer
{
  PImage raccoon;
  PVector position = new PVector(16, 16);
  int dir = 1;

  Bouncer() {
    this.raccoon = requestImage("racoon.png");
  }
  void update() {
    imageMode(CENTER);
    if (this.position.x<width&&this.position.y>0) {
      this.position.x += this.dir;
    }
    if (this.position.x>=width) {
      this.dir*=-1;
      this.position.x=width-4;
    }
    if (this.position.x<=0) {
      this.dir*=-1;
      this.position.x=1;
    }
  }

  void draw() {
    image(raccoon, this.position.x, this.position.y, 128, 64);
  }
}

Bouncer bouncer1 = new Bouncer();

void setup() {
  size(640, 480);

  bouncer1.position.x = width/2;
  bouncer1.position.y=64;
}
void draw() {





  bouncer1.update();
  bouncer1.draw();
}



