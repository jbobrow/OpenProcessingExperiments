
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/135028*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
PImage kitchen;
class Predator {
  PVector target = new PVector(random(20, 40), random(20, 40));
  PImage chef;
  PVector position = new PVector(600, 400);
  int dir = 1;
  float speed = .01;
  float _scale = 1;
  Predator() 
  {
    this.chef = requestImage("chef128.png");
  }
  void update() {
    imageMode(CENTER);
  }
  void draw(float targetx, float targety)
  {
    float toX = targetx - this.position.x;
    float toY = targety - this.position.y;

    this.position.x += (toX * this.speed);
    this.position.y += (toY * this.speed);

    image(chef, this.position.x, this.position.y, 64*this._scale, 64*this._scale);
  }
}
class Ricochet {
  float life = -2;
  PImage racoon;
  boolean alive = true;
  PImage dead;
  PImage grave;
  float graveSpot_x;
  float graveSpot_y;
  PVector position = new PVector(16, 16);
  PVector dir = new PVector(1, 1);


  Ricochet() {
    this.racoon = requestImage("racoon.png");
    this.dead = requestImage("dead.png");
    this.grave = requestImage("grave.png");
  }

  void update() {


    if (this.position.x>=width||this.position.x<=0) {
      this.dir.x*=-1;
    }
    if (this.position.y>=height||this.position.y<=0) {
      this.dir.y*=-1;
    }
    this.position.x += this.dir.x;
    this.position.y += this.dir.y;
  }
  void draw() {
    if (this.life<10) {
      life += 1/frameRate;
    }
    if (alive == true&&life>=10) {
      alive = false;
      this.graveSpot_x = this.position.x;
      this.graveSpot_y = this.position.y;
    }
    if (alive == false&&life>=10) {
      image(grave, this.graveSpot_x, this.graveSpot_y);
    } 
    if (alive == true) {
      if (this.dir.x>0) {
        pushMatrix();
        translate(this.position.x, this.position.y);
        scale(-1, 1);
        imageMode(CENTER);
        image(this.racoon, 0, 0);
        //imageMode(CORNER);
        popMatrix();
      }  
      if (this.dir.x<0) {

        image(racoon, this.position.x, this.position.y, 128, 64);
      }
    }
  }
}

class Bouncer
{
  boolean alive = true;
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
    if (this.alive == true) {
      if (this.dir>0) {
        pushMatrix();
        translate(this.position.x, this.position.y);
        scale(-1, 1);
        imageMode(CENTER);
        image(this.raccoon, 0, 0);
        //imageMode(CORNER);
        popMatrix();
      }  
      if (this.dir<0) {

        image(raccoon, this.position.x, this.position.y, 128, 64);
      }
    }
  }
}

Bouncer bouncer1 = new Bouncer();
Ricochet ricochet1 = new Ricochet();
Predator chef1 = new Predator();

void setup() {
  size(640, 480);
  kitchen = requestImage("kitchen.jpg");
  bouncer1.position.x = width/2;
  bouncer1.position.y=64;
}

void draw() {
  if (kitchen.width>0) {
    imageMode(CORNER);
    image(kitchen, 0, 0, 640, 480);
    ricochet1.update();
    ricochet1.draw();
    bouncer1.update();
    bouncer1.draw();

    float distToBouncer = dist(chef1.position.x, chef1.position.y, bouncer1.position.x, bouncer1.position.y);
    float distToRicochet = dist(chef1.position.x, chef1.position.y, ricochet1.position.x, ricochet1.position.y);
    if (distToBouncer < distToRicochet)
    {
      chef1.draw(bouncer1.position.x, bouncer1.position.y);
    }
    if (distToBouncer > distToRicochet)
    {
      chef1.draw(ricochet1.position.x, ricochet1.position.y);
    }
    if (distToBouncer < 32 && chef1._scale<1.5) {
      chef1._scale += .5;
      bouncer1.alive = false;
    }
    if (distToRicochet<32 && chef1._scale<1.5) {
      chef1._scale += .5;
      ricochet1.alive = false;
    }
  }
}



