
class Bullet {

  float power;
  float s;
  float x;
  float y;
  PVector v;
  float ang;
  int startTime;
  int lifeTime;
  boolean isMine;
  PVector c;      //this is a color, used as PVector to have simpler access to r, g and b as x, y and z :)
  Enemy owner;


  Bullet(float x, float y, PVector v, BulletModel model, boolean isMine) {
    startTime   = millis();
    this.x      = x;
    this.y      = y;
    this.v      = v;
    this.ang    = ang;
    this.isMine = isMine;
    this.power    = model.power;
    this.s        = model.s;
    this.lifeTime = model.lifeTime;
    this.c        = model.c;
  }
  
  Bullet(float x, float y, PVector v, BulletModel model, Enemy owner) {
    startTime   = millis();
    this.x      = x;
    this.y      = y;
    this.v      = v;
    this.ang    = ang;
    this.power    = model.power;
    this.s        = model.s;
    this.lifeTime = model.lifeTime;
    this.c        = model.c;
    this.owner    = owner;
  }

  void draw() {
    ellipseMode(CENTER);
    fill(255*c.x, 255*c.y, 255*c.z, 255*(lifeTime-millis()+startTime)/lifeTime );
    stroke(250, 100);
    ellipse(x, y, power*s*width, power*s*width);
  }

  void update(Bullet me) {
    x +=  width*v.x/frameRate;
    y +=  width*v.y/frameRate;

    if (millis()-startTime>lifeTime) {
      //      println("REMOVE");
      bullets.remove(me);
    }

//    if (isMine) {
      for (int i=0; i<enemies.size(); i++) {
        Enemy enemy = enemies.get(i);
        if(isMine || owner!=enemy) {
        if ( dist(x, y, enemy.x, enemy.y) < enemy.size*width ) {
          float val = ((c.x/enemy.shell.c.x) + (c.y/enemy.shell.c.y) + (c.z/enemy.shell.c.z))/2;
          enemy.life -= val;
//          println(val);
          if(enemy.life<=0) enemies.remove(enemy);
//          enemies.remove(enemy);
        }
      }
      }
//    }
    if (!isMine) {
      if ( dist(x, y, player.x, player.y) < player.size*width ) {
        float val = ((c.x/player.shells[player.currentShell].c.x) + (c.y/player.shells[player.currentShell].c.y) + (c.z/player.shells[player.currentShell].c.z))/3;
//        println(val); 
        player.life-=val;
        bullets.remove(me);
      }
    }
  }
}

class BulletModel {
  boolean isActive;
  float power;
  int lifeTime;
  float s;
  int bulletsAtOnce;
  PVector c;

  BulletModel(float power, int lifeTime, PVector c, int bulletsAtOnce) {
    this.power         = power;
    this.lifeTime      = lifeTime;
    this.s             = 0.01;
    this.bulletsAtOnce = bulletsAtOnce;
    this.c             = c;
  }

  void draw(float x, float y) {
    ellipseMode(CENTER);
    fill(255*c.x, 255*c.y, 255*c.z, 255);
//    stroke(250, 100);
    noStroke();
    ellipse(x, y, power*s*width, power*s*width);
  }
}


