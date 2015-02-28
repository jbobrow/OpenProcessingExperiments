
//Martin C, CP1, Mods 4-5
//Bouncing Ball

//when balls collide, dist(balls[i].x,balls[i].y,balls[j].x,balls[j].y==25)

Ball[] balls = new Ball[7];

void setup()
{
  size(500, 500);
  for (int i=0;i<balls.length;i++)
  {
    balls[i] = new Ball(278, 115, random(2*PI));
  }
}

void draw()
{
  background(0);
  for (int i=0;i<balls.length;i++)
  {
    if (balls[i].checkCollide) {
      checkCollisions(i);
    }
    balls[i].show();
    balls[i].move();
    balls[i].bounce();
    balls[i].collide();
  }
}

void checkCollisions(int i) {
  for (int j=0;j<balls.length;j++) {
    if (dist(int(balls[i].bx),int(balls[i].by),int(balls[j].bx),int(balls[j].by))<=25) {
      balls[i].collided=true;
      balls[j].collided=true;
      balls[i].checkCollide=false;
      balls[j].checkCollide=false;
      balls[i].t=0;
      balls[j].t=0;
    }
  }
}

class Ball
{
  int speed, r, g, b, t;
  float dir, bx, by;
  boolean collided, checkCollide;
  Ball(int x_, int y_, float dir_)
  {
    dir = dir_;
    bx = float(x_);
    by = float(y_);
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
    collided=false;
    speed=4;
  }
  void move()
  {

    bx+=speed*cos(dir);
    by+=speed*sin(dir);
  }
  void bounce()
  {
    if (bx<12) {
      dir=PI-dir;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
    }
    if (by<12) {
      dir=-dir;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
    }
    if (bx>500-12) {
      dir=PI-dir;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
    }
    if (by>500-12) {
      dir=-dir;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
    }
  }
  void collide()
  {
    println("boom");
    collided=false;
  }
  void show()
  {
    fill(r, g, b);
    ellipse(int(bx), int(by), 25, 25);
    if (checkCollide==false) {
      t++;
    }
    if (t>2) {
      checkCollide=true;
    }
  }
}

void keyPressed() {
  for(int i=0;i<balls.length;i++)
  {
    if(keyCode==UP) {
      balls[i].speed++;
    }
    else if(keyCode==DOWN) {
      balls[i].speed--;
    }
  }
}
